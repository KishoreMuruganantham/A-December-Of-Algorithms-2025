s <- readLines("stdin", n = 1)

if (!grepl("\\[", s)) {
  cat(as.integer(s))
} else {
  stack <- list()
  num <- ""
  sign <- 1
  current <- NULL

  for (ch in strsplit(s, "")[[1]]) {
    if (ch == "-") {
      sign <- -1
    } else if (ch >= "0" && ch <= "9") {
      num <- paste0(num, ch)
    } else if (ch == "[") {
      if (!is.null(current)) stack[[length(stack) + 1]] <- current
      current <- list()
    } else if (ch == "," || ch == "]") {
      if (nchar(num) > 0) {
        current[[length(current) + 1]] <- sign * as.integer(num)
        num <- ""
        sign <- 1
      }
      if (ch == "]" && length(stack) > 0) {
        parent <- stack[[length(stack)]]
        stack <- stack[-length(stack)]
        parent[[length(parent) + 1]] <- current
        current <- parent
      }
    }
  }

  print_nested <- function(x) {
    if (is.integer(x)) {
      cat(x)
    } else {
      cat("[")
      for (i in seq_along(x)) {
        print_nested(x[[i]])
        if (i < length(x)) cat(",")
      }
      cat("]")
    }
  }

  print_nested(current)
}

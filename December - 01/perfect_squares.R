n <- as.integer(readLines(con = "stdin", n = 1))
limit <- floor(sqrt(n))
squares <- (1:limit)^2
cat(squares, sep = " ")
cat("\n")
cat(length(squares))

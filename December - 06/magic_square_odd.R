n <- as.integer(readLines("stdin", n = 1))

if (n %% 2 == 0) {
  cat("Magic square is only possible for odd values of n.")
} else {
  magic <- matrix(0, nrow = n, ncol = n)
  i <- 1
  j <- (n + 1) %/% 2
  
  for (num in 1:(n * n)) {
    magic[i, j] <- num
    ni <- i - 1
    nj <- j + 1
    if (ni < 1) ni <- n
    if (nj > n) nj <- 1
    if (magic[ni, nj] != 0) {
      ni <- i + 1
      nj <- j
      if (ni > n) ni <- 1
    }
    i <- ni
    j <- nj
  }
  
  M <- n * (n * n + 1) / 2
  cat("Magic constant:", M, "\n")
  for (r in 1:n) {
    cat(paste(magic[r, ], collapse = " "), "\n")
  }
}

n <- as.integer(readLines("stdin", n = 1))

if (n <= 2) {
  cat("The count of prime numbers less than", n, "is: 0")
} else {
  isPrime <- rep(TRUE, n - 1)
  isPrime[1] <- FALSE
  limit <- floor(sqrt(n))
  
  for (i in 2:limit) {
    if (isPrime[i]) {
      isPrime[seq(i * i, n - 1, i)] <- FALSE
    }
  }
  
  cat("The count of prime numbers less than", n, "is:", sum(isPrime))
}

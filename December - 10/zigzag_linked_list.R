input <- scan("stdin", quiet = TRUE)
n <- input[1]
vals <- input[2:(n + 1)]

i <- 1
j <- n
res <- integer(0)

while (i <= j) {
  res <- c(res, vals[i])
  if (i != j) res <- c(res, vals[j])
  i <- i + 1
  j <- j - 1
}

cat(res, sep = " ")

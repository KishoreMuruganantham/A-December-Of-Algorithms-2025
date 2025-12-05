stones <- scan("stdin", quiet = TRUE)
n <- length(stones)
maxReach <- 0
for (i in 0:(n - 1)) {
  if (i > maxReach) break
  reach <- i + stones[i + 1]
  if (reach > maxReach) maxReach <- reach
  if (maxReach >= n - 1) break
}
result <- maxReach >= n - 1
cat(tolower(as.character(result)))

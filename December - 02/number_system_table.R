n <- as.integer(readLines("stdin", n = 1))
widths <- c(nchar(as.character(n)), nchar(as.character(as.octmode(n))), nchar(toupper(as.character(as.hexmode(n)))), nchar(as.character(as.binary <- function(x) paste(rev(as.integer(intToBits(x))[1:ceiling(log2(n+1))])), collapse="")))

for(i in 1:n){
  dec <- i
  oct <- as.octmode(i)
  hex <- toupper(as.hexmode(i))
  bin <- paste(rev(as.integer(intToBits(i))[1:ceiling(log2(n+1))]), collapse="")
  cat(format(dec, width = widths[1]), format(oct, width = widths[2]+1), format(hex, width = widths[3]+1), format(bin, width = widths[4]+1), "\n", sep="")
}

input <- scan("stdin", quiet = TRUE)
R <- input[1]
C <- input[2]
grid <- matrix(input[-c(1,2)], nrow = R, ncol = C, byrow = TRUE)

visited <- matrix(FALSE, R, C)

count <- 0

stack <- list()

push <- function(x) stack[[length(stack)+1]] <<- x
pop <- function() { tmp <- stack[[length(stack)]]; stack <<- stack[-length(stack)]; tmp }

dirs <- list(c(1,0), c(-1,0), c(0,1), c(0,-1))

for(r in 1:R){
  for(c in 1:C){
    if(grid[r,c] == 1 && !visited[r,c]){
      count <- count + 1
      push(c(r,c))
      visited[r,c] <- TRUE
      while(length(stack) > 0){
        cell <- pop()
        cr <- cell[1]
        cc <- cell[2]
        for(d in dirs){
          nr <- cr + d[1]
          nc <- cc + d[2]
          if(nr >= 1 && nr <= R && nc >= 1 && nc <= C){
            if(grid[nr,nc] == 1 && !visited[nr,nc]){
              visited[nr,nc] <- TRUE
              push(c(nr,nc))
            }
          }
        }
      }
    }
  }
}

cat(count)

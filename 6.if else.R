#  ---- -2 ---- -1 ---- 0 ---- 1 ---- 2 ----
rm(answer)
x <- rnorm(1)
if(x > 1){
  answer <- "grater than 1"
} else{
    
   if(x >= -1){
     answer  <- "between -1 and 1"
   }  else{
     answer <- "less than -1"
   }
}



## TODO

 * [x] Disambiguate element from function on global environment
       See `two-dots.R`
     

 * [ ] Support %<>%

   Currently, `magrittr.plus` does not support the assignback operator,
   for example:
 
     df %>% var1 %<>% add(1) 
   
   does not work.


 * [?] Support x %>% 1 
       Support x %>% 1 <- 20 
       Use integer to select element
       What about . %>% .(1,2) for array slice (?)

       Note: x %>% .[[1]] and x %>% .[1] work! 

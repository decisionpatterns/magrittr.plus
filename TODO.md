
## TODO

 *  [ ] Break out the monkey-patching code in R/zzz.R into it's own package
        probably called `monkeypatch` or `breakshit` or `breakthis`

 * How to make magrittr extensible with different hooks and callbacks to support:
   * magrittr.plus / magrittr.tidy
   * magrittr.breadcrumps

 * [ ] Rename magrittr.tidy
   [ ] Stop the monkey patch and release as a fork of magrittr.

   **magrittr.tidy** is a tidy-compliant fork of the **magrittr** package.

    
Did you know that despite being central to the tidyverse, magrittr is not, in fact, tidy. It does not adhere to one of the most basic tidy principals, namely:

   *data first, context next*. 
  
**magrittr** is *context first, data next*. This break in the paradigm making it an oddball in the tidyverse.  **magrittr.tidy** fixes that by providing fully tidy compliant pipes.  


 * [ ] Create and export active binding function for turning on-and-off the tidy
functionality.

   > tidy_on()   # turn on magrittr.tidy
   > tidy_off()  # turn off magrittr tidy
   


 * [ ] Add  .. for reference to context environment within the pipe chain 

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


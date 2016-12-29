## magrittr.plus

Drop-In Replacement of 'magrittr' To Introspect Recursive Objects


## Install 

### CRAN 

    install.packages('magrittr.plus")

### github.com

    install_github("decisionpatterns/magrittr.plus")


## Benefits

 * simpler, more legible syntax 
 * behaves more like `.` method of other languages (DWIM)
 * No need for 'extract2' method
 * Avoids ugly:
   * `obj %>% .$name` 
 * Works with all recursive (non-atomic) objects: S3, S4, R6 and proto objects
   * Supports nested objects, e.g. list of lists


## Usage

    library(magrittr.plus)    # Use instead of magrittr
     
    ll <- list( a=1, b=2 ) 
     
    # Accesor
    ll %>% a         # 1
     
    # Replacement
    ll %>% a <- 2  
    ll %>% a         # 2


## TLDR;

`magrittr.plus` promotes cleaner more legibly code eliminating the need for the `extract2` function or the ugly `obj %>% .$name` syntax. Consider, the common case of extracting a value from a list or data.frame by name. The way `magrittr` allows this is:

    ll <- list( a=1:10, b=rnorm(10) ) 
    ll %>% extract2('a')  # OR
    ll %>% .$a

`magrittr.plus` allows you to express this as:

    ll %>%  a

There are two good reasons for promoting this syntax. First, it makes `%>%` behave more like the `.` operator in other languages. In Python, JAVA, etc.  The `.` is a dereferncing operator that looks inside the object. This same useful semantic is promoted by `magrittr.plus`.

Second, `magrittr.plus` favors the more common case. Especially when working interactively, the coder is interested in inspecting a recursive object. (This is one feature that has made `data.table` a success.) `magrittr.plus` follows that paradigm, but does not prevent the use of  `extract2` or `.$name` syntax. They work to promote backward compatibility. 


`magrittr.plus` also provides a natural replacement function. This allows syntax such as the following to do the right thing.

    ll %>% a
    ll %>% a <- 5:10
    ll %>% a         # 5:10

The equivalent cannot be done with either `extract2` or `.$name` and instead requires the `inset2` function for extra cognitive bloat.  



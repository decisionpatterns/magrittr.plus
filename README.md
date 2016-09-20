## magrittr.introspective

Drop-In Replacement of 'magrittr' To Introspect Recursive Objects


## Install 

### CRAN 

    install.packages('magrittr.introspectice")

### github.com

    install_github("decisionpatterns/magrittr.introspective")


## Benefits

 * simpler, more legible syntax 
 * behaves more like `.` method of other languages (DWIM)
 * No need for 'extract2' method
 * Works with all recursive (non-atomic) objects: S3, S4, R6 and proto objects
   * Supports nested objects, e.g. list of lists


## Usage

    library(magrittr.introspective)
    ll <- list( a=1, b=2 ) 
    
    # Accesor
    ll %>% a       # 1
    
    # Replacement
    ll %>% a <- 2  
    ll %>% a       # 2
    

## TLDR;

`magrittr.introspective` promotes cleaner more legibly code eliminating the 
need for the `extract2` function.  Consider, the common case of extracting
a value from a list or data.frame by name. The way `magrittr` allows this is:

    list( a=1:10, b=rnorm(10) ) %>% extract2('a')

`magrittr.introspective` allows you to express this as:

    list( a=1:10, b=rnorm(10) ) %>%  a

There are two good reasons for promoting this syntax. First, it makes `%>%` 
behave more like `.` in other languages.  In Python, JAVA, etc.  The `.` is a 
dereferncing operator that looks inside the object. This same semantic is 
promoted here.  Second, this is almost always what you would is done so it makes
since that `extract2` is unnecessary. (It still works though).

`magrittr.introspective` also provides replacement function for a number of 
classes.  This allows syntax such as the following: 

    ll <- list( a=1:10, b=rnorm(10) ) 
    ll %>% a
    ll %>% a <- 11:20
    ll %>% a


## magrittr.plus

**Drop-In, Opinionated ("Data First, Context Next") 'magrittr' Replacement
    with both get/set accessors.** 
    
This packages provides a monkey patch for 'magrittr' so that
elements/attributes of recursive objects 
(e.g. lists, data.frames, S3, S4, R6, env, etc,) can be accessed using only 
the pipe '%>%' operator and their names. That is, 'magrittr.plus' looks for 
the RHS of the pipe *within* the LHS before looking in the enclosing scope. 
This enhancement eliminates the need for `.$` or `extract[2]` and is more 
in keeping with the tidyverse that favors "Data First, Context Next" 
evaluation.  Additionally, it promotes more concise and legible code. 
Additionally, replacement methods also allows for inline replacement of a 
recursive objects elements/attributes: 'LHS %>% RHS <- newvalue'    


## Install 

### CRAN 

    install.packages('magrittr.plus")

### github.com

    install_github("decisionpatterns/magrittr.plus")


## Benefits

 - Tidyverse Opinionated ("Data First, Context Next")
 - Simple, more legible syntax 
 - DWIM: Behaves more like `.` method of other languages 
 - No need for 'extract2' method
 - Avoids ugly:
   * `obj %>% .$name` 
 - Works with all recursive (non-atomic) objects: S3, S4, R6 and proto objects
   * Supports nested objects, e.g. list of lists
 - Supports replacement: `LHS %>% RHS <- newvalue`


## Usage

    library(magrittr.plus)    # Use instead of magrittr
     
    ll <- list( a=1, b=2 ) 
     
    # Accesor
    ll %>% a         # 1
     
    # Replacement
    ll %>% a <- 2  
    ll %>% a         # 2


## TLDR;

`magrittr.plus` promotes tidy-compliant, cleaner more legibly code eliminating 
the need for the `extract2` function or the ugly `obj %>% .$name` syntax. 
Consider, the common case of extracting a value from a list or data.frame by 
name. The way `magrittr` allows this is:

    ll <- list( a=1:10, b=rnorm(10) ) 
    ll %>% extract2('a')  # OR
    ll %>% .$a

`magrittr.plus` allows you to express this as:

    ll %>%  a

There are two good reasons for promoting this syntax. First, it makes `%>%` 
behave more like the `.` operator in other languages. In Python, JAVA, etc.  
The `.` is a dereferncing operator that looks inside the object first. This same
useful semantic is promoted by `magrittr.plus`.

Second, `magrittr.plus` favors the more common case. Especially when working 
interactively, the coder is interested in inspecting a recursive object. 
(This is one feature that has made `data.table` a success.) `magrittr.plus` 
follows the "Data First, Context Next" paradigm, but does not prevent the use 
of  `extract2` or `.$name` syntax. They work to promote backward compatibility. 


`magrittr.plus` also provides a natural replacement function. This allows syntax
such as the following to do the right thing.

    ll %>% a
    ll %>% a <- 5:10
    ll %>% a         # 5:10

The equivalent cannot be done with either `extract2` or `.$name` and instead 
requires the `inset2` function for extra cognitive bloat.  


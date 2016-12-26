#' do
#' 
#' Drop-in replacement for \code{do.call} that allow optionally.
#' 
#' @param what either a function or a non-empty character string naming the 
#'        function to be called.
#' @param args an optional list of arguments to the function call. The names 
#'        attribute of args gives the argument names
#' 
#' @details 
#' 
#' \code{do} is abbreviated for of \code{do.call} that makes do syntactically 
#' cleaner when using in a pipeline (cf. Magrittr). It:
#' 
#' - is shorter: \code{do} vs. \code{do.call} \cr
#' - allows for no arguments, by having an empty \code{args} list for the 
#' default
#'
#' @seealso 
#'   \code{\link[base]{do.call}}
#'   
#' @examples
#' 
#'   true <- function() TRUE
#'   do.call( true, list() )
#'   do(true)   # TRUE
#' 
#' @export

do <- function( what, args=list(), quote=FALSE, envir = parent.frame() )  
   do.call( what, args, quote, envir )


# #' @author
# #'   [Mr Flick](http://stackoverflow.com/users/2372064/mrflick)
# #'
# #' @references
# #' - [SO #1](http://stackoverflow.com/a/42561430/1504321)
# #' - [SO #2](http://stackoverflow.com/q/43050810/1504321)
# #' - [Github/lazyeval issue #95](https://github.com/hadley/lazyeval/issues/95)
# #'
# # not @export
#

find_chain_parts <- function() {
    i <- 1
    while(!("chain_parts" %in% ls(envir=parent.frame(i))) && i < sys.nframe()) {
          i <- i+1
      }
    parent.frame(i)
}


# printfirstname <- function(df){
#     ee <- find_chain_parts()
#     print(deparse(ee$lhs))
# }


# mean %>% identity %>% head %>% printfirstname
#' nm_mean <- mean %>% set_namer
#'
#' "price" %>% name_it( nm_mean )
#' Get source argument from a chain
#'
#' Magrittr pipe function
#'
#' @param x magrittr
#'
#' @details
#'
#'  `lazyeval::expr_text` does not work for pipes ...
#'
#' @seealso
#'
#' - `lazyeval::expr_text`
#'
#' @examples
#'
#'  f <- . %>% mean( na.rm = TRUE )
#'  nm_mean <-  mean %>% set_namer()
#'
#'  get_pipe_source(f)
#'
#' @export

get_pipe_source <- function(x) {
  cp <- find_chain_parts()
  deparse(cp$lhs)
}

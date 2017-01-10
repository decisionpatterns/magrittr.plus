#' inside_pipe
#'
#' Detects if the function is being used in a magrittr pipe
#'
#' @param ... arguments
#'
#' @details
#' Examines parent.frames to see if the function is being used in a magrittr
#' pipe. This is useful when the presence of a pipe effects what you need to
#' do.
#'
#' @return logical
#' @examples
#'
#' "foo" %>% ( function(x) inside_pipe() )
#' f <- function(x) inside_pipe(x)
#'
#' "foo" %>% f
#'
#' @export

inside_pipe <- function(...) {

  all( names(parent.frame(3)) %in%  c("value", "function_list") )

}

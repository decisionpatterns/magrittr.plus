#' @title two_dots
#'
#' @description Find value in parent environment
#'
#' @param .ignore unused useful for pipes
#' @param x name; unquote name
#' @param y envir
#'
#' @references
#'   \url{http://stackoverflow.com/a/21664128} applies the same principal to
#'   data.tables
#'
#' @examples
#'
#'  ll <- list( a=1:3, b=7)
#'  a = "ok"
#'  ll %>% a
#'  ll %>% ..(a)
#'
#' @rdname two-dots
#' @export

`..` <- function( .ignored, x, y=parent.frame(7) ) {

  get( deparse(substitute(x)), parent.frame(7) )

}

# makeActiveBinding( "..", two_dots, sys.frame(0) )



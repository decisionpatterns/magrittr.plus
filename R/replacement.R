#' Pipe Replacement
#'
#' @param value any; value for the LHS
#' @param ... additional arguments
#'
#' @examples
#'   ll <- list( a=1, b=2 )
#'   ll %>% a <- 3
#'   ll$a
#'
#' @rdname pipe-replace
#' @import lazyeval
#' @export

setGeneric( '%>%<-'
  , function(value, ...) {
      # browser()
      ld   <- lazyeval::lazy_dots(...)
      obj  <- lazyeval::lazy_eval( ld[[1]] )

      if( "R6" %in% class(obj) ) {                       # TEST: CLASS
        name <- as.character( ld[[ length(ld) ]]$expr )  # THE NAME WILL BE THE LAST THING
        obj[[name]] <- value
          return( invisible(obj) )  # VALUE ...
      }

      standardGeneric('%>%<-')

  }
)


#' @rdname pipe-replace
#' @aliases  '%>%<-', ANY
#' @export

setMethod(
  '%>%<-', c(value='ANY'), function(value, ...) {
    obj      <- eval( lazyeval::lazy_dots(...)[[1]]$expr )              # returns R6 object
    var_name <- lazy_dots(...)[[2]]$expr  %>% as.character()  # returns name

    obj[[ var_name ]] <- value                                # set value

    return( invisible(obj) )

  }
)

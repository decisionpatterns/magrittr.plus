#' Wrap an expression in a function
#'
#' @param body of the call
#' @param pipe character; the pipe used
#' @param env environment;
#'
#' This is a monkey patch of magrittr's wrap_function that extends the
#' functionality to perform non-standard-evaluation and introspect the RHS of
#' pipe within the LHS.
#'
#' @author magrittr authors + Chris Brown
#'
#' @examples
#'   ll <- list( a=1, b=2 )
#'   ll %>% a
#'   ll %>% b
#'
# @import magrittr

wrap_function <- function(body, pipe, env)
{

  if (is_tee(pipe)) {
    body <- call("{", body, quote(.))
  } else if (is_dollar(pipe)) {
    body <- substitute(with(., b), list(b = body))
  }

  # Introspective search
  #   modify body so that magrittr introspects recursive objects.
  #   1. test if this is an eligible call
  #   2. test if the name can be dereferenced.
  if(                                                # Requirement 1
      identical(pipe, quote(`%>%`)) &&                    # apply to %>% only
      ( length(body) == 2    &&                           # appears here as name(.)
        is.name( body[[1]] ) &&
        identical( body[[2]], quote(`.`)  )
       ) # dereferencing
   ) {
    nm = as.character( body[[1]] )
    body = bquote({
      if( is.recursive(.) && exists( .(nm), . ) )    # Requirement 2
        .[[ .(nm) ]] else
        .(body)                                      # AST: body.[[2]][[4]]
    })
  }

  eval( call("function", as.pairlist(alist(.=)), body), env, env)

}

# We have to place the function in the correct Namespace, i.e. magrittr.
environment(wrap_function) <- asNamespace('magrittr')

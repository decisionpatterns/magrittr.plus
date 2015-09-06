# @examples
#   load_all()
#   ll = list( a=1, b=2 )
#   ll %>% a
#   ll %>% b
#
#   ll %>% a <- 2
#   ll %>% a # 2

#

.onLoad <- function(libname, pkgname) {

  unlockBinding("wrap_function", getNamespace("magrittr"))
  assignInNamespace("wrap_function", wrap_function, ns="magrittr")
  lockBinding("wrap_function", getNamespace("magrittr"))

}

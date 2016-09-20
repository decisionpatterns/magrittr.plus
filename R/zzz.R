.onLoad <- function(libname, pkgname) {

  unlockBinding("wrap_function", getNamespace("magrittr"))
  assignInNamespace("wrap_function", wrap_function, ns="magrittr")
  lockBinding("wrap_function", getNamespace("magrittr"))

  if( interactive() )
    packageStartupMessage(
      pkgname ,
      "-" ,
      utils::packageVersion(pkgname, libname),
      " - Copyright \u00a9 ", substr(Sys.Date(),1,4),
      " Decision Patterns" ,
      domain = NA
    )


}

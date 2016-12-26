library(testthat)

context('do')

  true<- function() TRUE

  expect_true( do.call(true, list()) )
  expect_true( do(true) )

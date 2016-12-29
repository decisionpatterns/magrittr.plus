context('env')


ee <- new.env()
  ee$a <- 1
  ee$b <- 2

test_that( "env", {
  # Accessor
  ee %>% a %>% expect_equal(1)
  ee %>% b %>% expect_equal(2)

  # Replacement
  # ee %>% a <- 11
  # ee %>% a %>% expect_equal(11)

# NESTED LISTS
  ee$b <- new.env()
  ee$b$c <- 3
  ee %>% a %>% expect_equal(1)
  ee %>% b %>% c %>% expect_equal(3)
})

context('list')


ll <- list( a=1, b=2 )

  ll %>% a %>% expect_equal(1)
  ll %>% b %>% expect_equal(2)

# NESTED LISTS
  ll <- list( a = 1, b=list(c=3) )
  ll %>% a %>% expect_equal(1)
  ll %>% b %>% c %>% expect_equal(3)

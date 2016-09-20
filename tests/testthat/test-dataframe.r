context('data.frame')


df <- data.frame( a=1, b=2 )

  df %>% a %>% expect_equal(1)
  df %>% b %>% expect_equal(2)

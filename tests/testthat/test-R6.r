context('R6')

if( 'R6' %in% installed.packages() )
  test_that( "R6 reltated functionality", {

    library(R6)

    #'   # Person Class
    Person <- R6Class( public = list( first_name = character(), last_name = character() ))

    # Person Object
    author = Person$new()
    author$first_name = "Christopher"
    author$last_name  = "Brown"

    # Magrittr/R6 getter
    author %>% first_name %>% expect_equal("Christopher")
    author %>% last_name  %>% expect_equal("Brown")

    # Magrittr/R6 setter
    author %>% first_name = "Hermann"
    author %>% last_name  = "Hesse"

    author %>% first_name %>% expect_equal('Hermann')
    author %>% last_name %>% expect_equal('Hesse')


    # DEEPLY NESTED
    ## Book Class
    Book <- R6Class( public = list( author = Person$new() ) )
    book = Book$new()
    book$author = author

    ## Getters
    book %>% author %>% first_name %>% expect_equal('Hermann')
    book %>% author %>% last_name  %>% expect_equal('Hesse')



    ## Setters
    book %>% author %>% first_name = "Christopher"
    book %>% author %>% last_name  = "Brown"

    book %>% author %>% first_name %>% expect_equal("Christopher")
    book %>% author %>% last_name  %>% expect_equal("Brown")

    # R6 Produces Reference Classes so author was changed as well
    author %>% first_name %>% expect_equal("Christopher")
    author %>% last_name  %>% expect_equal("Brown")

  })

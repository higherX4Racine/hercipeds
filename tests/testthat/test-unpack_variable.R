example_lhs <- function() {
    tibble::tibble(
        Variable = rep(letters[1:3], each = 2),
        Foo = 1:6,
        Bar = LETTERS[1:6]
    )
}

example_rhs <- function() {
    tibble::tibble(
        Variable = letters[1:3],
        State = c("NH", "WI", "MN"),
        Age = c("Elementary", "Junior High", "High School"),
        Angst = c("Modest", "Low", "Bonkers")
    )
}

test_that("default behavior works", {
    B <- example_rhs()
    result <- unpack_variable(example_lhs(),
                              B,
                              "Variable")
    expect_equal(names(result),
                 c("Foo", "Bar", "State", "Age", "Angst"))
    
    for (.field in c("State", "Age", "Angst")) {
        expect_equal(result[[.field]],
                     rep(B[[.field]], each = 2))
    }
})

test_that("selecting with dynamic dots works", {
    
    for (.choice in c("State", "Age", "Angst")) {
        result <- unpack_variable(example_lhs(),
                                  example_rhs(),
                                  "Variable",
                                  .choice)
        expect_equal(names(result),
                     c("Foo", "Bar", .choice))
    }
})

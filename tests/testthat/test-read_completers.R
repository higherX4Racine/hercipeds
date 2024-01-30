# Copyright (C) 2024 by Higher Expectations for Racine County

test_that("the example completion table is readable", {
    require(withr)
    
    with_file(
        list(
            "c0099_c.csv" = write.csv(hercipeds::CORNELLS$Completers,
                                      "c0099_c.csv",
                                      row.names = FALSE),
            "C0099_C.zip" = zip("C0099_C.zip", "c0099_c.csv")
        ), {
            grads <- read_completers(99, ".", "C")
            expect_equal(nrow(grads), 119L)
            expect_equal(ncol(grads), 7L)
            expect_equal(names(grads),
                         c("UNITID",
                           "Completers",
                           "Population",
                           "Gender",
                           "Lower Age",
                           "Upper Age",
                           "Award Level"))
        })
})
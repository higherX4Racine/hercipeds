# Copyright (C) 2024 by Higher Expectations for Racine County

test_that("the example completion table is readable", {
    withr::with_tempdir({
        write.csv(hercipeds::CORNELLS$Completers,
                  "c0099_c.csv",
                  row.names = FALSE)
        zip("C0099_C.zip", "c0099_c.csv")
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
# Copyright (C) 2024 by Higher Expectations for Racine County

test_that("the example outcome table is readable", {
    withr::with_tempdir({
        write.csv(hercipeds::CORNELLS$Outcomes,
                  "om0099.csv",
                  row.names = FALSE)
        zip("OM0099.zip", "om0099.csv")
        folks <- read_outcomes(99, ".")
        expect_equal(nrow(folks), 100L)
        expect_equal(ncol(folks), 12)
        expect_equal(names(folks),
                     c("UNITID",
                       "OMRCHRT",
                       "OMACHRT",
                       "Entry Status",
                       "Time Status",
                       "Aid Status",
                       "Time to Degree",
                       "Degree",
                       "Enrollment",
                       "Count",
                       "Percent",
                       "Fall Year"))
    })
})
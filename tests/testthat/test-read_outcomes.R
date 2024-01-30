# Copyright (C) 2024 by Higher Expectations for Racine County

test_that("the example outcome table is readable", {
    require(withr)
    
    with_file(
        list(
            "om0099.csv" = write.csv(hercipeds::CORNELLS$Outcomes,
                                      "om0099.csv",
                                      row.names = FALSE),
            "OM0099.zip" = zip("OM0099.zip", "om0099.csv")
        ), {
            folks <- read_outcomes(99, ".")
            expect_equal(nrow(folks), 460L)
            expect_equal(ncol(folks), 10L)
            expect_equal(names(folks),
                         c("UNITID",
                           "OMRCHRT",
                           "OMACHRT",
                           "Students",
                           "Time to Degree",
                           "Degree",
                           "Entry Status",
                           "Time Status",
                           "Aid Status",
                           "Fall Year"))
        })
})
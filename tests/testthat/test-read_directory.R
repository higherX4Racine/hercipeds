test_that("the example directory data are readable", {
    withr::with_tempdir({
        write.csv(hercipeds::CORNELLS$Directory,
                  "hd0099.csv",
                  row.names = FALSE)
        zip("HD0099.zip", "hd0099.csv")
        schools <- read_directory(99, ".")
        expect_equal(nrow(schools), 3L)
        expect_equal(ncol(schools), 59L)
        expect_equal(names(schools)[1:5],
                     c("UNITID",
                       "INSTNM",
                       "ADDR",
                       "CITY",
                       "ZIP"))
        expect_equal(schools$ZIP,
                     c("52314-1098",
                       "14853",
                       "10065"))
    })
})
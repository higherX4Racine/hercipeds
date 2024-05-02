GRTYPE <- "extdata" |>
    system.file(
        "grtype.csv",
        package = "hercipeds"
    ) |>
    readr::read_csv(
        col_types = list(
            GRTYPE = "i",
            Definition = "c",
            `Institution Type` = "c",
            Subcohort = "c",
            Outcome = "c",
            Credential = "c",
            `Duration Ratio` = "n"
        )
    )

usethis::use_data(GRTYPE, overwrite = TRUE)

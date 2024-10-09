GRTYPE <- "extdata" |>
    system.file(
        "grtype.csv",
        package = "hercipeds"
    ) |>
    readr::read_csv(
        col_types = list(
            GRTYPE = "i",
            `Institution Level` = "c",
            `Credential Sought` = "c",
            `Credential Earned` = "c",
            `Relative Time` = "c",
            Status = "c",
            Definition = "c"
        )
    )

usethis::use_data(GRTYPE, overwrite = TRUE)

# Copyright (C) 2024 by Higher Expectations for Racine County

OMCHRT <- "extdata" |>
    system.file(
        "omchrt.csv",
        package = "hercipeds"
    ) |>
    readr::read_csv(
        col_types = list(
            OMCHRT = "i",
            .default = "c"
        )
    )

usethis::use_data(OMCHRT, overwrite = TRUE)

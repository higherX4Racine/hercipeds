# Copyright (C) 2024 by Higher Expectations for Racine County

AWLEVEL <- system.file("extdata",
                       "awlevel.csv",
                       package = "hercipeds"
) |>
    readr::read_csv(
        col_types = list(
            AWLEVEL = readr::col_integer(),
            `Award Level` = readr::col_character()
        )
    )

usethis::use_data(AWLEVEL, overwrite = TRUE)

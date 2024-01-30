# Copyright (C) 2024 by Higher Expectations for Racine County

OUTCOMES_SPEC <- "extdata" |>
    system.file("outcomes_spec.csv",
                package = "hercipeds") |>
    readr::read_csv(col_types = list(
        `Time to Degree` = "i",
        .default = "c"
    ))

usethis::use_data(OUTCOMES_SPEC, overwrite = TRUE)

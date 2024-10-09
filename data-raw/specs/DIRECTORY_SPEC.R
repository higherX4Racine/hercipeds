# Copyright (C) 2024 by Higher Expectations for Racine County

DIRECTORY_SPEC <- "extdata" |>
    system.file(
        "directory_spec.csv",
        package = "hercipeds"
    ) |>
    readr::read_csv(
        col_types = "c"
    )

## Copyright (C) 2025 by Higher Expectations for Racine County

GR_PELL_SSL_VARIABLES <- "extdata" |>
    system.file(
        "gr_pell_ssl_variables.csv",
        package = "hercipeds"
    ) |>
    readr::read_csv(
        col_types = c(
            varname = "c",
            Assistance = "c",
            Role = "c",
            Measure = "c",
            .default = "-"
        )
    )

usethis::use_data(GR_PELL_SSL_VARIABLES, overwrite = TRUE)

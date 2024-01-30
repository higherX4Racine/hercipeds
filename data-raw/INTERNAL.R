# Copyright (C) 2024 by Higher Expectations for Racine County

.EXTDATA_PATH <- system.file("extdata",
                             "Completer_Specs",
                             package = "hercipeds")

.COL_TYPES <- list(
    A = "c",
    B = "c",
    C = list(
        `Lower Age` = "i",
        `Upper Age` = "i",
        .default = "c"
    )
)

COMPLETERS_SPEC <- purrr::imap(
    .COL_TYPES,
    ~ .EXTDATA_PATH |>
        file.path(paste0(tolower(.y),
                         ".csv")) |>
        readr::read_csv(col_types = .x)
)

DIRECTORY_SPEC <- "extdata" |>
    system.file(
        "directory_spec.csv",
        package = "hercipeds"
    ) |>
    readr::read_csv(
        col_types = "c"
    )

usethis::use_data(COMPLETERS_SPEC,
                  DIRECTORY_SPEC,
                  overwrite = TRUE,
                  internal = TRUE)

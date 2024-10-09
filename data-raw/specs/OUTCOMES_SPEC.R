# Copyright (C) 2024 by Higher Expectations for Racine County

OUTCOMES_SPEC <- "extdata" |>
    system.file("outcomes_spec.csv",
                package = "hercipeds") |>
    readr::read_csv(col_types = list(
        `Time to Degree` = "i",
        .default = "c"
    ))

.OUTCOME_TYPES <- OUTCOMES_SPEC$DataType |>
    rlang::set_names(OUTCOMES_SPEC$Column) |>
    c(.default = "_")

.COLUMNS <- c("Common", "Count", "Percent") |>
    rlang::set_names() |>
    purrr::map(~ OUTCOMES_SPEC |>
                   dplyr::filter(.data$Measure == .x,
                                 .data$DataType != "_",
                                 .data$DataType != "-") |>
                   dplyr::pull("Column"))

.MEASURE_COLUMNS <- OUTCOMES_SPEC |>
    names() |>
    setdiff(c("Column",
              "DataType",
              "Definition",
              "Measure")
    )

.MEASURE_SPEC <- dplyr::select(OUTCOMES_SPEC,
                               tidyselect::all_of(c("Column",
                                                    .MEASURE_COLUMNS)))

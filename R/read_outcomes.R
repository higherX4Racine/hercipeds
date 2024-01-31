## Copyright (C) 2024 by Higher Expectations for Racine County

#' Load IPEDS data about 4-, 6-, and 8-year completion rates.
#'
#' @param .year <int> the academic year that the information describes
#' @param .path <chr> the full path to the zip archive that contains the file.
#'
#' @return a tibble of many columns
#' @importFrom archive archive_read
#' @importFrom readr read_csv
#' @importFrom dplyr mutate
#' @importFrom dplyr row_number
#' @importFrom purrr map
#' @importFrom dplyr select
#' @importFrom tidyselect all_of
#' @importFrom utils tail
#' @importFrom purrr imap
#' @importFrom tidyr pivot_longer
#' @importFrom purrr pluck
#' @importFrom dplyr inner_join
#' @export
read_outcomes <- function(.year, .path){
    .initial <- .path |>
        file.path(
            sprintf("OM%04d.zip", .year)
        ) |>
        archive::archive_read(
            file = 1L
        ) |>
        readr::read_csv(
            col_types = .OUTCOME_TYPES
        ) |>
        dplyr::mutate(
            Index = dplyr::row_number()
        )
    
    .subsets <- .COLUMNS |>
        purrr::map(
            ~ dplyr::select(.initial,
                            tidyselect::all_of(c("Index", .x)))
        )
    
    .measures <- .subsets |>
        utils::tail(2) |>
        purrr::imap(
            ~ tidyr::pivot_longer(.x,
                                  cols = !"Index",
                                  names_to = "Column",
                                  values_to = .y)
        ) |>
        purrr::map(
            ~ .join_and_drop_keys(.MEASURE_SPEC,
                                  .x,
                                  "Column")
        )
    
    .subsets |>
        purrr::pluck(
            "Common"
        ) |>
        .join_and_drop_keys(hercipeds::OMCHRT,
                            "OMCHRT") |>
        .join_and_drop_keys(
            dplyr::inner_join(.measures$Count,
                              .measures$Percent,
                              by = c("Index", .MEASURE_COLUMNS)),
            "Index"
        ) |>
        dplyr::mutate(
            `Fall Year` = .year - 8L
        )
}

## Helpers


#' A common task is to connect to tables by a common foreign key, then drop the key
#'
#' @param .lhs one table
#' @param .rhs another one to join it to
#' @param .keys the column(s) to join them by
#'
#' @return a new table
#' @importFrom dplyr inner_join
#' @importFrom dplyr select
#' @importFrom tidyselect any_of
.join_and_drop_keys <- function(.lhs, .rhs, .keys){
    .lhs |>
        dplyr::inner_join(.rhs, by = .keys) |>
        dplyr::select(!tidyselect::any_of(.keys))
}
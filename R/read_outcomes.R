## Copyright (C) 2024 by Higher Expectations for Racine County

#' Load IPEDS data about 4-, 6-, and 8-year completion rates.
#'
#' @param .year `<int>` the academic year that the information describes
#' @param .path `<chr>` the full path to the zip archive that contains the file.
#'
#' @return a tibble of many columns
#' @seealso [archive::archive_read()]
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
            \(.x) unpack_variable(.MEASURE_SPEC,
                                  .x,
                                  "Column")
        )
    
    .subsets |>
        purrr::pluck(
            "Common"
        ) |>
        unpack_variable(hercipeds::OMCHRT,
                        "OMCHRT") |>
        unpack_variable(
            dplyr::inner_join(.measures$Count,
                              .measures$Percent,
                              by = c("Index", .MEASURE_COLUMNS)),
            "Index"
        ) |>
        dplyr::mutate(
            `Fall Year` = .year - 8L
        )
}
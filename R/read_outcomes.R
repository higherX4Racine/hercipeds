#' Load IPEDS data about 4-, 6-, and 8-year completion rates.
#'
#' @param .year <int> the academic year that the information describes
#' @param .path <chr> the full path to the zip archive that contains the file.
#'
#' @return a tibble of many columns
#' @importFrom archive archive_read
#' @importFrom readr read_csv
#' @importFrom rlang set_names
#' @export
read_outcomes <- function(.year, .path){
    .path |>
        file.path(
            sprintf("OM%04d.zip", .year)
        ) |>
        archive::archive_read(
            file = 1L
        ) |>
        readr::read_csv(
            col_types = hercipeds::OUTCOMES_SPEC$DataType |>
                rlang::set_names(hercipeds::OUTCOMES_SPEC$Column) |>
                c(.default = "_")
        ) |>
        tidyr::pivot_longer(
            cols = !tidyselect::any_of(c("UNITID",
                                         "OMCHRT",
                                         "OMRCHRT",
                                         "OMEXCLS",
                                         "OMACHRT")),
            names_to = "Column",
            values_to = "Students"
        ) |>
        dplyr::inner_join(
            dplyr::select(OUTCOMES_SPEC,
                          !tidyselect::any_of(c("DataType",
                                                "Definition"))),
            by = "Column"
        ) |>
        dplyr::inner_join(
            hercipeds::OMCHRT,
            by = "OMCHRT"
        ) |>
        dplyr::select(
            !tidyselect::any_of(c("Column", "OMCHRT"))
        ) |>
        dplyr::mutate(
            `Fall Year` = .year - 8L
        )
}
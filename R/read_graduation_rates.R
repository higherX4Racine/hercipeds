## Copyright (C) 2024 by Higher Expectations for Racine County

#' Load IPEDS data about graduation rates.
#'
#' @param .year <int> the academic year that the information describes
#' @param .path <chr> the full path to the zip archive that contains the file.
#'
#' @return a tibble of many columns
#' @export
read_graduation_rates <- function(.year, .path){
    .initial <- .path |>
        file.path(
            sprintf("GR%04d.zip", .year)
        ) |>
        readr::read_csv(
            col_types = list(.default = "c")
        ) |>
        dplyr::rename_with(
            stringr::str_to_upper
        ) |>
        dplyr::select(
            !tidyselect::starts_with("X")
        ) |>
        dplyr::select(
            !tidyselect::any_of(c(
                "CHRTSTAT",
                "SECTION",
                "COHORT",
                "LINE"
            ))
        ) |>
        dplyr::mutate(
            Index = dplyr::row_number()
        ) |>
        tidyr::pivot_longer(
            cols = !tidyselect::any_of(c(
                "UNITID",
                "GRTYPE",
                "Index"
            )),
            names_to = "Variable",
            values_to = "Count"
        ) |>
        dplyr::mutate(
            dplyr::across(c("UNITID",
                            "GRTYPE"),
                          ~ as.integer(.)),
            Count = as.numeric(.data$Count)
        ) |>
        dplyr::left_join(
            hercipeds::GRTYPE,
            by = "GRTYPE"
        ) |>
        dplyr::left_join(
            dplyr::select(hercipeds::GR_VARIABLES,
                          "Variable" = "varName",
                          "Race/Ethnicity",
                          "Sex"),
            by = "Variable"
        )
}
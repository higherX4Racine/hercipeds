## Copyright (C) 2025 by Higher Expectations for Racine County

#' Read data about graduation rates by demographic groupings
#' 
#' This table reports numbers of students and graduates, and break down by
#' degree sought and granting institution.
#' Each file describes one graduation year, so the enrollment year is different
#' for 2- and 4-year programs.
#' These data include many different breakdowns, including degree sought, actual
#' degree earned, several different times to completion and demographic
#' information such as race/ethnicity, immigration status, and gender.
#' When you call this function with the "demographic" table option, the output
#'
#' The return value has two list-columns that contain nested data frames.
#' Their structures are:
#' 
#' ### Cohort
#' 
#' \describe{
#'   \item{Statistic}{`<chr>` the quantity being measured, like cohort size or number of students excluded.}
#'   \item{Count    }{`<chr>` the corresponding number of students. }
#' }
#' 
#' ### Completers
#' 
#' \describe{
#'   \item{Award Level}{`<chr>` one of "Associate's Degrees", "Bachelor's Degrees", or "All Degrees".}
#'   \item{Count      }{`<int>` the corresponding number of degrees earned}
#' }
#' 
#' @param .file the full path to the file
#'
#' @returns An object,
#' of class `spec_tbl_df` (inherits from `tbl_df`, `tbl`, `data.frame`),
#' with 9 columns.
#' \describe{
#'   \item{UNITID       }{`<int>` a seven digit unique identifier for a school}
#'   \item{Years        }{`<int>` Whether the cohort comes from a 2- or 4-year institution.}
#'   \item{Award Sought }{`<fct>`
#'   Cohorts are defined by their institution and the type of award their students enrolled to earn.
#'   Values include "Certificate", "Associate's", "Bachelor's", or "Any degree"
#'   }
#'   \item{Race/Ethnicity}{`<chr>` one of the OMB '97 categories}
#'   \item{Sex           }{`<chr>` all, men, or women.}
#'   \item{Cohort       }{`<tbl>` information about folks seeking credentials. See Details}
#'   \item{Completers   }{`<tbl>` information about folks earning credentials. See Details}
#' }
#' @seealso [read_graduates()] to see why the return value has such a weird structure.
#' @export
read_graduates_and_demographics <- function(.file){
    .initial <- .file |>
        readr::read_csv(
            col_types = c(.default = "c") # because column names might not be CAPS
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
                "COHORT", # redundant with "Credential Sought"
                "LINE"
            ))
        ) |>
        dplyr::mutate(
            dplyr::across(c("UNITID",
                            tidyselect::starts_with("GR")),
                          as.integer)
        ) |>
        tidyr::pivot_longer(
            cols = !tidyselect::any_of(c(
                "UNITID",
                "GRTYPE"
            )),
            names_to = "varName",
            values_to = "Count"
        )
    
    hercipeds::GLOSSARIES_FOR_GR_TYPES |>
        purrr::discard_at(
            "Assistance"
        ) |>
        purrr::map(
            \(.rhs) {
                .initial |>
                    unpack_variable(
                        .rhs,
                        .variable_name = "GRTYPE"
                    ) |>
                    unpack_variable(
                        hercipeds::GR_VARIABLES,
                        .variable_name = "varName",
                        "Race/Ethnicity",
                        "Sex"
                    ) |>
                    tidyr::nest(
                        .by = c("UNITID",
                                "Years",
                                "Award Sought",
                                "Race/Ethnicity",
                                "Sex"),
                        .key = "Details"
                    )
            }
        ) |>
        purrr::list_rbind(
            names_to = "Role"
        ) |>
        tidyr::pivot_wider(
            names_from = "Role",
            values_from = "Details"
        )
}
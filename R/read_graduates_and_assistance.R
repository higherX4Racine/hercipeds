#' Read data about graduation and financial assistance
#' 
#' IPEDS tables with names like "GRXXXX_PELL_SSL" contain data about
#' postsecondary completion and publicly-funded financial assistance.
#' 
#' All of these completion numbers report 150% graduation rates.
#' There are two list-columns that contain nested data frames.
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
#'   \item{Assistance   }{`<chr>` the type of assistance that students receive, if any}
#'   \item{Cohort       }{`<tbl>` information about folks seeking credentials. See Details}
#'   \item{Completers   }{`<tbl>` information about folks earning credentials. See Details}
#' }
#' @seealso [read_graduates()] to see why the return value has such a weird structure.
#' @export
read_graduates_and_assistance <- function(.file){

    .tmp <- .file |>
        readr::read_csv(
            col_types = "i"
        ) |>
        dplyr::select(
            !tidyselect::starts_with("X")
        ) |>
        tidyr::pivot_longer(
            cols = !tidyselect::any_of(c("UNITID", "PSGRTYPE")),
            names_to = "varname",
            values_to = "Count"
        ) |>
        unpack_variable(
            hercipeds::GR_PELL_SSL_VARIABLES,
            .variable_name = "varname"
        ) |>
        unpack_variable(
            hercipeds::GLOSSARIES_FOR_GR_TYPES$Assistance,
            .variable_name = "PSGRTYPE"
        )
    
    dplyr::inner_join(
        .tmp |>
            dplyr::filter(
                .data$Role == "Cohort"
            ) |>
            dplyr::select(
                "UNITID",
                "Years",
                "Award Sought",
                "Assistance",
                Statistic = "Measure",
                "Count"
            ) |>
            tidyr::nest(
                Cohort = c("Statistic",
                           "Count")
            ),
        .tmp |>
            dplyr::filter(
                .data$Role == "Completers"
            ) |>
            dplyr::select(
                "UNITID",
                "Years",
                "Award Sought",
                "Assistance",
                `Award Level` = "Measure",
                "Count"
            ) |>
            dplyr::mutate(
                `Time to Award` = "<=150%"
            ) |>
            tidyr::nest(
                Completers = c("Award Level",
                               "Time to Award",
                               "Count")
            ),
        by = c(
            "UNITID",
            "Years",
            "Award Sought",
            "Assistance"
        )
    )
}
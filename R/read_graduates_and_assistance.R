#' Load data about postsecondary completion by publicly-funded financial assistance
#' 
#' All of these completion numbers report 150% graduation rates.
#' 
#' @param .file the full path to the file
#'
#' @returns #' An object of class `spec_tbl_df`
#' (inherits from `tbl_df`, `tbl`, `data.frame`)
#' with 9 columns.
#' \describe{
#'   \item{UNITID}{`<int>` a seven digit unique identifier for a school}
#'   \item{PSGRTYPE}{`<int>` a one-digit code describing the type of credential earned}
#'   \item{Assistance}{`<chr>` the type of assistance that students receive, if any}
#'   \item{Revised Cohort}{`<int>` an overestimate of the number of students who could have graduated}
#'   \item{Exclusions}{`<int>` the number of students who should be removed from the denominator}
#'   \item{Adjusted Cohort}{`<int>` a better estimate of the number of students who could have graduated}
#'   \item{Bachelor's Degrees}{`<int>` the number of students who earned a 4-year degree}
#'   \item{Associate's Degrees}{`<int>` the number of students who earned a degree that took fewer than 4 years}
#'   \item{All Degrees}{`<int>` the total number of undegraduate degrees earned}
#' }
#' @export
read_graduates_and_assistance <- function(.file){
    .file |>
        readr::read_csv(
            col_types = "i"
        ) |>
        dplyr::select(
            !tidyselect::starts_with("X")
        ) |>
        tidyr::pivot_longer(
            cols = !tidyselect::any_of(c("UNITID", "PSGRTYPE")),
            names_to = "varname",
            values_to = "Number"
        ) |>
        dplyr::left_join(
            hercipeds::GR_PELL_SSL_VARIABLES,
            by = "varname"
        ) |>
        dplyr::select(
            "UNITID",
            "PSGRTYPE",
            "Assistance",
            "Measure",
            "Number"
        ) |>
        tidyr::pivot_wider(
            names_from = "Measure",
            values_from = "Number"
        )
}
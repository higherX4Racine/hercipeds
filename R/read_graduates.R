## Copyright (C) 2025 by Higher Expectations for Racine County

#' Load IPEDS data about graduation rates
#' 
#' The graduation data come in two tables.
#' One reports graduation numbers by race/ethnicity/immigration status and sex.
#' The other reports graduation by type of financial assistance.
#' Both tables report numbers of students and graduates, and break down by
#' degree sought and granting institution.
#' Each file describes one graduation year, so the enrollment year is different
#' for 2- and 4-year programs.
#' 
#' ## Graduation rates by demographic groupings
#' 
#' These data include many different breakdowns, including degree sought, actual
#' degree earned, several different times to completion and demographic
#' information such as race/ethnicity, immigration status, and gender.
#' When you call this function with the "demographic" table option, the output
#' is a data frame with 15 columns.
#' \describe{
#'   \item{UNITID            }{`<int>` a seven digit unique identifier for a school}
#'   \item{Index             }{`<int>` the }
#'   \item{Institution Level }{`<chr>`}
#'   \item{Credential Sought }{`<chr>`}
#'   \item{Credential Earned }{`<chr>`}
#'   \item{Relative Time     }{`<chr>`}
#'   \item{Race/Ethnicity    }{`<chr>`}
#'   \item{Sex               }{`<chr>`}
#'   \item{Adjusted Cohort   }{`<int>`}
#'   \item{Completed         }{`<int>`}
#'   \item{Transferred       }{`<int>`}
#'   \item{Full Cohort       }{`<int>`}
#'   \item{Still Enrolled    }{`<int>`}
#'   \item{No Longer Enrolled}{`<int>`}
#'   \item{Excluded          }{`<int>`}
#' }
#' 
#' ## Graduation rates by financial assistance
#' 
#' These data all deal with graduation within 150% of normal completion time.
#' That means 6 years for bachelor's programs and 3 years for associate's.
#' When you call this function with the "financial" table option, the output is
#' a data frame with 9 columns.
#' \describe{
#'   \item{UNITID             }{`<int>` a seven digit unique identifier for a school}
#'   \item{PSGRTYPE           }{`<int>` a one-digit code describing the type of credential earned}
#'   \item{Assistance         }{`<chr>` the type of assistance that students receive, if any}
#'   \item{Revised Cohort     }{`<int>` an overestimate of the number of students who could have graduated}
#'   \item{Exclusions         }{`<int>` the number of students who should be removed from the denominator}
#'   \item{Adjusted Cohort    }{`<int>` a better estimate of the number of students who could have graduated}
#'   \item{Bachelor's Degrees }{`<int>` the number of students who earned a 4-year degree}
#'   \item{Associate's Degrees}{`<int>` the number of students who earned a degree that took fewer than 4 years}
#'   \item{All Degrees        }{`<int>` the total number of undegraduate degrees earned}
#' }
#' 
#' @param .dem_file `<chr>` the full path to the file with graduation and demographic information.
#' @param .aid_file `<chr>` the full path to the file with graduation and financial aid information.
#'
#' @returns #' An object of class `spec_tbl_df`
#' (inherits from `tbl_df`, `tbl`, `data.frame`). See Details.
#' 
#' @seealso [read_graduates_and_demographics()]
#' @seealso [read_graduates_and_assistance()]
#' @export
read_graduates <- function(.dem_file, .aid_file){
    
    dplyr::bind_rows(
        .dem_file |>
            read_graduates_and_demographics() |>
            dplyr::rename(
                Population = "Race/Ethnicity"
            ),
        .aid_file |>
            read_graduates_and_assistance() |>
            dplyr::rename(
                Population = "Assistance"
            ) |>
            dplyr::mutate(
                Sex = "all"
            )
    )
}
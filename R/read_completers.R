#' Read data about college completers from one zipped file
#'
#' Each file contains the number of students receiving a degree or certificate.
#' Data cover awards granted between July 1, `.year - 1` and June 30, `.year`.
#' 
#' ### Aggregation C
#' 
#' This version of the table enumerates students by level of award and by
#' race/ethnicity, gender and age categories. Each file contains multiple
#' records per institution. Each record is uniquely defined by the variables
#' IPEDS ID (UNITID) and award level (AWLEVELC ). The 'C' is stripped from
#' "AWLEVELC" during post-read processing. Each record will contain:
#' 
#' * the total number of students receiving awards
#' * number of  men and women receiving awards
#' * number of students receiving awards for all nine race/ethnicity
#'   categories;
#' * number of students receiving awards are also available for the following
#'   age groups:
#'   * under 18
#'   * 18-24
#'   * 25-39
#'   * 40 and above.
#' 
#' Numbers are not available for combinations of race, gender and age.
#' Beginning with 2019-20, the certificate of less than 1 year was replaced by
#' the following 2 categories:
#' 
#' * certificates of less than 12 weeks
#' * certificates of at least 12-weeks but less-than 1-year.
#' 
#' @param .year <int> - the academic year the data correspond to
#' @param .path <chr>, optional - the location of the zipped file, defaults to "."
#' @param .aggregation <chr>, optional - "A", "B", or "C" (the default), see Notes
#'
#' @return a data frame with approximately 5 columns:
#' \description{
#'  \item{UNITID}{<int> The unique identifier of a single higher education institution}
#'  \item{Population}{<chr> A demographic group like "US Residents", "Asian", or "18-24"}
#'  \item{Gender}{<chr> Usually "Female" or "Male", but possibly "Another" or "Unknown"}
#'  \item{Completers}{<int> The number of people in this population-gender combination}
#' }
#' @export
read_completers <- function(.year, .path = ".", .aggregation = "C"){
    .year |>
        unzip_completers(
            .aggregation,
            .path
        ) |>
        wrangle_completers(
            hercipeds:::COMPLETERS_SPEC[[toupper(.aggregation)]]
        )
}
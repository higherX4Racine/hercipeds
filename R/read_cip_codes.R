## Copyright (C) 2024 by Higher Expectations for Racine County

#' Load a table of definitions for IPEDS CIP codes.
#' 
#' The Classification of Instructional Programs is a taxonomy of higher
#' education programs/majors/degrees/etc. It is maintained by the
#' [National Center for Education Statistics](https://nces.ed.gov/ipeds/cipcode/default.aspx)
#'
#' @param .path <chr> the full path to a file downloaded from NCES.
#'
#' @return a [`tibble::tibble()`] with five variables
#' \describe{
#'   \item{Family}{<chr> a two-digit code for the broadest categories of programs}
#'   \item{Code}{<chr> a 2-, 4-, or 6-digit code in ##\[.####\] format, family first.}
#'   \item{Title}{<chr> a short-ish label for the group or program}
#'   \item{Definition}{<chr> a longer description of the group or program}
#'   \item{Type}{<chr> whether the code has 2, 4, or 6 digits}
#' }
#' @importFrom readr read_csv
#' @importFrom dplyr select
#' @importFrom tidyselect starts_with
#' @importFrom dplyr rename_with
#' @importFrom stringr str_remove
#' @importFrom dplyr mutate
#' @importFrom dplyr across
#' @importFrom stringr str_extract
#' @importFrom stringr str_remove_all
#' @importFrom stringr str_squish
#' @export
read_cip_codes <- function(.path){
    .path |>
        readr::read_csv(
            col_types = "c"
        ) |>
        dplyr::select(
            tidyselect::starts_with("CIP")
        ) |>
        dplyr::rename_with(
            ~stringr::str_remove(., "^CIP")
        ) |>
        dplyr::mutate(
            dplyr::across(c("Family", "Code"),
                          ~ stringr::str_extract(., "[\\d\\.]+")),
            Type = factor(nchar(.data$Code),
                          labels = c("2-digit", "4-digit", "6-digit")
            ),
            Title = .data$Title |>
                stringr::str_remove_all("\\.") |>
                stringr::str_squish()
        )
}
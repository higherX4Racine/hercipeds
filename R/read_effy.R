## Copyright (C) 2025 by Higher Expectations for Racine County

.read_raw_effy <- function(.filename) {
    .filename |>
        readr::read_csv(
            col_types = "c",
            na = c("", "NA", ".")
        ) |>
        dplyr::rename_with(
            toupper
        ) |>
        dplyr::select(
            tidyselect::any_of(c(
                "UNITID",
                "EFFYALEV",
                "EFFYLEV",
                "LSTUDY"
            )),
            tidyselect::starts_with("EFY")
        )
}

#' Read 12-month headcount data
#'
#' @param .filename `<chr>` the full path to the file
#'
#' @returns a tibble with 6 or 7 columns
#' \describe{
#'  \item{UNITID}{`<int>` the 6-digit identifier of a postsecondary institution}
#'  \item{EFFYALEV}{`<int?>` indicates a narrow student subpopulation in later years}
#'  \item{EFFYLEV}{`<int>` indicates undegrad, grad, or all students}
#'  \item{LSTUDY}{`<int>` indicates undegrad, grad, or all students}
#'  \item{EFFYPOP}{`<chr>` 4-letter codes for several race/ethnicity/origin populations}
#'  \item{EFFYSEX}{`<chr>` 1-letter codes for gender identities}
#'  \item{Students}{`<int>` the number of students}
#' }
#' @export
read_effy <- function(.filename) {
    .filename |>
        .read_raw_effy() |>
        dplyr::mutate(
            dplyr::across(tidyselect::any_of(c("UNITID",
                                               "EFFYALEV",
                                               "EFFYLEV",
                                               "LSTUDY")),
                          as.integer)
        ) |>
        tidyr::pivot_longer(
            cols = tidyselect::starts_with("EFY"),
            names_to = c("EFFYPOP", "EFFYSEX"),
            names_pattern = "EFY(.+)(.)",
            values_to = "Students",
            values_ptypes = integer()
        )
}
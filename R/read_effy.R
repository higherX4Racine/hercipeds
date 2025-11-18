## Copyright (C) 2025 by Higher Expectations for Racine County

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
#'  \item{Population}{`<chr>` one of several race/ethnicity/origin populations}
#'  \item{Sex}{`<chr>` gender identities}
#'  \item{Students}{`<int>` the number of students}
#' }
#' @export
read_effy <- function(.filename) {
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
        ) |>
        dplyr::mutate(
            dplyr::across(tidyselect::any_of(c("UNITID",
                                               "EFFYALEV",
                                               "EFFYLEV",
                                               "LSTUDY")),
                          as.integer)
        ) |> 
        tidyr::pivot_longer(
            cols = tidyselect::starts_with("EFY"),
            names_to = "EFY",
            values_to = "Students",
            values_ptypes = integer()
        ) |>
        dplyr::left_join(
            dplyr::select(
                hercipeds::GLOSSARIES_FOR_EFFY$EFY,
                "EFY",
                "Population",
                "Sex"
            ),
            by = "EFY"
        ) |>
        dplyr::select(
            "UNITID",
            tidyselect::starts_with("EFFY"),
            "LSTUDY",
            "Population",
            "Sex",
            "Students",
        )
}
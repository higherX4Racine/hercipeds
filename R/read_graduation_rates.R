.COMMON_COLUMNS <- c(
    "UNITID",
    "GRTYPE",
    "CHRTSTAT",
    "SECTION",
    "COHORT",
    "LINE",
    "Index"
)

read_graduation_rates <- function(.year, .path){
    .initial <- .path |>
        file.path(
            sprintf("GR%04d.zip", .year)
        ) |>
        archive::archive_read(
            file = 1L
        ) |>
        readr::read_csv(
            col_types = list(
                UNITID = "i",
                GRTYPE = "i",
                CHRTSTAT = "i",
                SECTION = "i",
                COHORT = "i",
                .default = "n")
        ) |>
        dplyr::rename_with(
            stringr::str_to_upper
        ) |>
        dplyr::select(
            !tidyselect::starts_with("X")
        ) |>
        dplyr::mutate(
            Index = dplyr::row_number()
        ) |>
        tidyr::pivot_longer(
            cols = !tidyselect::any_of(.COMMON_COLUMNS),
            names_to = "Variable",
            values_to = "Count"
        )
}
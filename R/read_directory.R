#' Identity and overall characteristics of institutions of higher education
#'
#' @param .year <int> the academic year that the information describes
#' @param .path <chr> the full path to the zip archive that contains the file.
#'
#' @return a tibble of many columns
#' @importFrom archive archive_read
#' @importFrom readr read_csv
#' @importFrom rlang set_names
#' @importFrom dplyr mutate
#' @importFrom lubridate mdy
#' @export
read_directory <- function(.year, .path){
    .path |>
        file.path(
            sprintf("HD%04d.zip", .year)
        ) |>
        archive::archive_read(
            file = 1L
        ) |>
        readr::read_csv(
            col_types = DIRECTORY_SPEC$DataType |>
                rlang::set_names(DIRECTORY_SPEC$Column) |>
                c(.default = "_"),
            na = c("", -1:-9)
        ) |>
        dplyr::mutate(
            CLOSEDAT = lubridate::mdy(.data$CLOSEDAT)
        )
}
#' Identity and overall characteristics of institutions of higher education
#'
#' @param .year *&lt;int&gt;* the academic year that the information describes
#' @param .path *&lt;chr&gt;* the full path to the zip archive that contains the file.
#'
#' @return a tibble of many columns
#' @seealso [archive::archive_read()]
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
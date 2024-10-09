.STATUS_OPTIONS <- rlang::set_names(c("Final", "Provisional"))

#' Download an Access-formatted database of IPEDs data for one year
#'
#' @param .year <int> the starting year the data describe. Usually July-June. 
#' @param .folder_path <str> the location to save the downloaded files to.
#'
#' @return <null> no return value
#' @importFrom purrr keep
#' @importFrom utils head
#' @importFrom purrr walk
#' @importFrom curl curl_download
#' @importFrom purrr map
#' @importFrom purrr map_chr
#' @importFrom purrr map_int
#' @importFrom httr HEAD
#' @importFrom httr status_code
#' 
#' @export
fetch_annual_database <- function(.year, .folder_path) {
    version <- .year |>
        get_annual_status() |>
        purrr::keep( ~ . == 200L) |>
        utils::head(1) |>
        names()
    
    if (is.null(version)) {
        stop("No valid data files found on server.")
    }
    
    .year |>
        make_db_url(version) |>
        c(
            make_dict_url(.year)
        ) |>
        purrr::walk(
            ~ curl::curl_download(url = .,
                                  destfile = file.path(.folder_path,
                                                       basename(.)))
        )
}

make_annual_stem <- function(.year, first_sep, second_sep){
    sprintf("IPEDS%s%04d%s%02d", first_sep,
            .year, second_sep,
            (.year + 1L) %% 100L)
}

make_db_url <- function(.year, .version){
    paste0("https://nces.ed.gov/ipeds/tablefiles/zipfiles/",
           make_annual_stem(.year, "_", "-"),
           "_", .version, ".zip")
}

make_dict_url <- function(.year) {
    paste0("https://nces.ed.gov/ipeds/tablefiles/tableDocs/",
           make_annual_stem(.year, "", ""),
           "Tablesdoc.xlsx")
}

get_annual_status <- function(.year){
    .STATUS_OPTIONS |> 
        purrr::map_chr(~ make_db_url(.year, .)) |>
        purrr::map(httr::HEAD) |>
        purrr::map_int(httr::status_code)
}
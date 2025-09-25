#' Download one data table from IPEDS
#'
#' @param .year `<int>` the year that the table describes
#' @param .prefix `<chr>` a prefix that describes the type of data, like "GR" or "EFFY"
#' @param .suffix `<chr>` the rest of the file name, like ".zip" or "_PELL_SSL.zip"
#' @param .destination_path `<chr>` the folder where the file should be saved
#'
#' @returns `<str>` the full path to the saved file
#' @export
fetch_ipeds_table <- function(.year, .prefix, .suffix, .destination_path) {

    if (!stringr::str_ends(.suffix, "\\.zip")) {
        .suffix <- paste(.suffix, ".zip", sep = "")
    }
    .basename <- paste(.prefix,
                       .year,
                       .suffix,
                       sep = "")
    .url <- paste("https://nces.ed.gov/ipeds/datacenter/data/",
                  .basename,
                  sep = "")
    curl::curl_download(.url,
                        destfile = file.path(.destination_path,
                                             .basename))
}
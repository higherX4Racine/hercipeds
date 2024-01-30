#' Read a zipped file of completion data
#'
#' [IPEDS](https://nces.ed.gov/ipeds/datacenter/DataFiles.aspx) files come as
#' giant, zipped csv files. There's no reason to store them on your local
#' machine in an unzipped format when this function can unzip a file as it reads
#' its contents into memory.
#' 
#' @param .year <int> the academic year that the completion data come from
#' @param .aggregation <chr> one of "A", "B", or "C"
#' @param .path <chr> the full path to the zip file
#'
#' @return a file-like connection to the csv in the zipped archive
#' @seealso [wrangle_completers()]
#' @importFrom archive archive_read
unzip_completers <- function(.year, .aggregation, .path){
    .agg <- toupper(.aggregation)
    .path |>
        file.path(
            sprintf("C%04d_%s.zip", .year, .agg)
        ) |>
        archive::archive_read(
            file = 1L
        )
}
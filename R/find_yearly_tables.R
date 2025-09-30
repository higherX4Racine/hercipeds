## Copyright (C) 2025 by Higher Expectations for Racine County

#' Search a path for files with IPEDS-type names
#'
#' Files that are downloaded from IPEDS typically have a constant format within
#' each type of table.
#' The only difference among files is a year number.
#' For example, a file for graduation rates from 1998 would be "GR1998.xlsx"
#' 
#' @param .path `<chr>` the path to search for. 
#' @param .prefix `<chr>` the prefix for this type of table
#' @param .suffix `<chr?>` an optional suffix to file names. Defaults to "" 
#' @inheritDotParams base::dir -path -pattern 
#'
#' @returns `<chr[]>` a vector of file names, with names set to matching years
#' @export
find_yearly_tables <- function(.path, .prefix, .suffix = "", ...) {
    
    .files <- dir(.path,
                  pattern = paste0(.prefix, "\\d{4}", .suffix),
                  ...)

    .yearmatches <- regexec("\\d{4}", .files)

    names(.files) <- regmatches(.files, .yearmatches)
    
    .files
}
#' Higher Education Award Levels in IPEDS
#' 
#' Integer codes for the different kinds of degrees that students may earn.
#' 
#' @format ## `AWLEVEL`
#' An object of class \code{spec_tbl_df} (inherits from \code{tbl_df}, \code{tbl}, \code{data.frame}) with 16 rows and 2 columns.
#' \describe{
#' \item{AWLEVEL}{<int> Code value for a degree type}
#' \item{Award Level}{<chr> Human-readable name for a degree type}
#' }
#' @source <https://nces.ed.gov/ipeds/datacenter/DataFiles.aspx>
"AWLEVEL"

#' IPEDS data from 2022 for schools with "Cornell" in their names.
#' @format ## `CORNELLS`
#' 
#' A list with two elements.
#' 
#' ### Directory
#' 
#' An object of class \code{spec_tbl_df} (inherits from \code{tbl_df}, \code{tbl}, \code{data.frame}) with 3 rows and 73 columns.
#' Detailed characteristics of each institution in 2022.
#' 
#' ### Completers
#' 
#' An object of class \code{spec_tbl_df} (inherits from \code{tbl_df}, \code{tbl}, \code{data.frame}) with 7 rows and 36 columns.
#' Graduates in 2022 by population from each institution.
#' 
#' @source <https://nces.ed.gov/ipeds/datacenter/DataFiles.aspx>
"CORNELLS"

#' Layout information about the tables that report completion data
#' 
#' @format ## `COMPLETERS_SPEC`
#' 
#' A list with three elements.
#' 
#' ### A
#' 
#' **Completion by major**
#' 
#' This is a huge file because of the highly detailed breakdown of majors.
#' 
#' ### B
#' 
#' **Completion by Population and Gender**
#' 
#' This table reports graduates in combinations of sex and race/ethnicity
#' 
#' ### C
#' 
#' **Completion by Population**
#' 
#' This table reports graduates by single population, like sex, race/ethnicity, or age
#' 
#' @source <https://nces.ed.gov/ipeds/datacenter/DataFiles.aspx>
"COMPLETERS_SPEC"

#' Layout information about the tables that report institutional characteristics
#' @format ## `DIRECTORY_SPEC`
#' In addition to the basic ID and name info, lots of fields about location and programming
#' @source <https://nces.ed.gov/ipeds/datacenter/DataFiles.aspx>
"DIRECTORY_SPEC"
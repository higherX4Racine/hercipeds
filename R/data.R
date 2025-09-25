#' Higher Education Award Levels in IPEDS
#' 
#' Integer codes for the different kinds of degrees that students may earn.
#' 
#' @format ## `AWLEVEL`
#' An object of class `spec_tbl_df`
#' (inherits from `tbl_df`, `tbl`, `data.frame`)
#' with 16 rows and 2 columns.
#' \describe{
#' \item{AWLEVEL}{`int` Code value for a degree type}
#' \item{Award Level}{`chr` Human-readable name for a degree type}
#' }
#' @source <https://nces.ed.gov/ipeds/datacenter/DataFiles.aspx>
"AWLEVEL"

#' Cohort details for counting 4-, 6-, and 8-year completion dates
#' 
#' Integer codes for different combinations of first-time, full-time, and financial aid statuses
#' 
#' @format ## `OMCHRT`
#' An object of class `spec_tbl_df`
#' (inherits from `tbl_df`, `tbl`, `data.frame`)
#' with 15 rows and 4 columns.
#' \describe{
#' \item{OMCHRT}{`int` Code value for cohort type}
#' \item{Entry Status}{`chr` All, First-time, or Not-first-time}
#' \item{Time Status}{`chr` All, Full-time, or Part-time}
#' \item{Aid Status}{`chr` All, Pell recipient, or not Pell recipient}
#' }
#' @source <https://nces.ed.gov/ipeds/datacenter/DataFiles.aspx>
"OMCHRT"

#' IPEDS data from 2022 for schools with "Cornell" in their names.
#' @format ## `CORNELLS`
#' 
#' A list with two elements.
#' 
#' ### Directory
#' 
#' An object of class `spec_tbl_df`
#' (inherits from `tbl_df`, `tbl`, `data.frame`)
#' with 3 rows and 73 columns.
#' Detailed characteristics of each institution in 2022.
#' 
#' ### Completers
#' 
#' An object of class `spec_tbl_df`
#' (inherits from `tbl_df`, `tbl`, `data.frame`)
#' with 7 rows and 36 columns.
#' Graduates in 2022 by population from each institution.
#' 
#' ### Outcomes
#' 
#' An object of class `spec_tbl_df`
#' (inherits from `tbl_df`, `tbl`, `data.frame`)
#' with 20 rows and 54 columns.
#' Overall 4-, 6-, and 8-year completion from each institution
#'  
#' @source <https://nces.ed.gov/ipeds/datacenter/DataFiles.aspx>
"CORNELLS"

#' Very broad categories of subject areas for post-secondary credentials.
#' @format ## `CIP_FAMILIES`
#' 
#' An object of class `spec_tbl_df`
#' (inherits from `tbl_df`, `tbl`, `data.frame`)
#' with 50 rows and 3 columns.
#' 
#' ### Code
#' 
#' A character vector of two-digit numeric codes
#' 
#' ### Title
#' 
#' A somewhat short description of the subject area. IN ALL CAPS FOR DRAMA
#' 
#' ### Definition
#' 
#' A somewhat longer description of each subject area. In sentence case.
#' 
#' @source <https://nces.ed.gov/ipeds/cipcode/resources.aspx>
"CIP_FAMILIES"

#' Narrow categories of subject areas for post-secondary credentials.
#' @format ## `CIP_PROGRAMS`
#' 
#' An object of class `spec_tbl_df`
#' (inherits from `tbl_df`, `tbl`, `data.frame`)
#' with 473 rows and 3 columns.
#' 
#' ### Code
#' 
#' A character vector of two-digit numeric codes
#' 
#' ### Title
#' 
#' A somewhat short description of the subject area. In title case.
#' 
#' ### Definition
#' 
#' A somewhat longer description of each subject area. In sentence case.
#' 
#' @source <https://nces.ed.gov/ipeds/cipcode/resources.aspx>
"CIP_PROGRAMS"

#' Mapping details about credentials and success from a complex field in the table of graduation rates.
#' @format ## `GRTYPE`
#' An object of class `spec_tbl_df`
#' (inherits from `tbl_df`, `tbl`, `data.frame`)
#' with 40 rows and 7 columns.
#' \describe{
#'   \item{GRTYPE}{`int` a code that maps to the rest of the columns}
#'   \item{Institution Level}{`chr` either "4-year" or "2-year"}
#'   \item{Credential Sought}{`chr` the original degree a person sought: "Any," "Certificate," "Associate's," or "Bachelor's."}
#'   \item{Credential Earned}{`chr` the actual credential a person earned, with the same options as above}
#'   \item{Relative Time}{`dbl` The ratio of the time it took to complete the degree to the expected time to complete the degree, e.g. finishing a Bachelor's degree in 6 years counts as 1.5}
#'   \item{Status}{`chr` The state students are in to be counted in this GRTYPE. E.g. "Completed," "Still Enrolled," or "Transferred"}
#'   \item{Definition}{`chr` the definition from the IPEDs dictionary file.}
#' }
#' @source <https://nces.ed.gov/ipeds/datacenter/DataFiles.aspx>
"GRTYPE"

#' Definitions of columns found in data that describes postsecondary completers
#' @format ## `GR_VARIABLES`
#' An object of class `spec_tbl_df`
#' (inherits from `tbl_df`, `tbl`, `data.frame`)
#' with 74 rows and 8 columns.
#' \describe{
#'   \item{varNumber}{`int` a code for mapping from raw data to this table.}
#'   \item{varName}{`chr` a seven-character name for each variable}
#'   \item{varTitle}{`chr` a human-readable name for each variable}
#'   \item{DataType}{`chr` "N" for data and "A" for metadata}
#'   \item{format Time}{`dbl` either "Cont" (count or continuous) or "Disc" (numeric or character categories)}
#'   \item{Race/Ethnicity}{`chr` The OMB racial/ethnic category for people counted by this variable}
#'   \item{Sex}{`chr` The OMB gender category for people counted by this variable}
#'   \item{longDescription}{`chr` a verbose explanation of the variable}
#' }
#' @source <https://nces.ed.gov/ipeds/datacenter/DataFiles.aspx>
"GR_VARIABLES"

#' Metadata about postsecondary completion by publicly-funded financial assistance
#' @format ## `GR_PELL_SSL_VARIABLES`
#' An object of class `spec_tbl_df`
#' (inherits from `tbl_df`, `tbl`, `data.frame`)
#' with 26 rows and 3 columns.
#' \describe{
#'   \item{varname}{`chr` a seven-character name for each variable}
#'   \item{Assistance}{`chr` The type of financial assistance (if any) students received}
#'   \item{Measure}{`chr` The quantity reported by the column}
#' }
#' @source <https://nces.ed.gov/ipeds/datacenter/DataFiles.aspx>
"GR_PELL_SSL_VARIABLES"
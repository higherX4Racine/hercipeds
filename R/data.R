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

#' Cohort details for counting 4-, 6-, and 8-year completion dates
#' 
#' Integer codes for different combinations of first-time, full-time, and financial aid statuses
#' 
#' @format ## `OMCHRT`
#' An object of class `spec_tbl_df` (inherits from `tbl_df`, `tbl`, `data.frame`), with 15 rows and 4 columns.
#' \describe{
#' \item{OMCHRT}{<int> Code value for cohort type}
#' \item{Entry Status}{<chr> All, First-time, or Not-first-time}
#' \item{Time Status}{<chr> All, Full-time, or Part-time}
#' \item{Aid Status}{<chr> All, Pell recipient, or not Pell recipient}
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
#' An object of class \code{spec_tbl_df} (inherits from \code{tbl_df}, \code{tbl}, \code{data.frame}) with 3 rows and 73 columns.
#' Detailed characteristics of each institution in 2022.
#' 
#' ### Completers
#' 
#' An object of class \code{spec_tbl_df} (inherits from \code{tbl_df}, \code{tbl}, \code{data.frame}) with 7 rows and 36 columns.
#' Graduates in 2022 by population from each institution.
#' 
#' ### Outcomes
#' 
#' An object of class \code{spec_tbl_df} (inherits from \code{tbl_df}, \code{tbl}, \code{data.frame}) with 20 rows and 54 columns.
#' Overall 4-, 6-, and 8-year completion from each institution
#'  
#' @source <https://nces.ed.gov/ipeds/datacenter/DataFiles.aspx>
"CORNELLS"

#' Very broad categories of subject areas for post-secondary credentials.
#' @format ## `CIP_FAMILIES`
#' 
#' An object of class \code{spec_tbl_df} (inherits from \code{tbl_df}, \code{tbl}, \code{data.frame}) with 50 rows and 3 columns.
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
#' An object of class \code{spec_tbl_df} (inherits from \code{tbl_df}, \code{tbl}, \code{data.frame}) with 473 rows and 3 columns.
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
#' An object of class \code{spec_tbl_df} (inherits from \code{tbl_df},
#' \code{tbl}, \code{data.frame}) with 40 rows and 7 columns.
#' \describe{
#'   \item{GRTYPE}{<int> a code that maps to the rest of the columns}
#'   \item{Definition}{<chr> the definition from the IPEDs dictionary file.}
#'   \item{Institution Type}{<chr> either "4-year" or "2-year"}
#'   \item{Subcohort}{<chr> the original degree a person sought: "All," "Bachelor's," "Degree/certificate", or "Other degree/certificate"}
#'   \item{Outcome}{<chr> An endpoint such as "Completed," "No longer enrolled," or "Transferred out."}
#'   \item{Credential}{<chr> The kind of degree the person ultimately earned.}
#'   \item{`Duration Ratio`}{<dbl> The ratio of the time it took to complete the degree to the expected time to complete the degree, e.g. finishing a Bachelor's degree in 6 years counts as 1.5}
#' }
#' @source <https://nces.ed.gov/ipeds/datacenter/DataFiles.aspx>
"GRTYPE"

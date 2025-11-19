## Copyright (C) 2025 by Higher Expectations for Racine County

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

#' Mapping details about enrollment from a complex field in the table of head counts.
#' @format ## `GLOSSARIES_FOR_EFFY`
#' A list of five data frames.
#'
#' ### EFFYALEV
#' 
#' An object of class `spec_tbl_df`
#' (inherits from `tbl_df`, `tbl`, `data.frame`)
#' with 27 rows and 4 columns.
#' 
#' \describe{
#'   \item{EFFYALEV}{`<int>` a code that maps to the rest of the columns}
#'   \item{Time}{`<chr>` whether full-time, part-time, or all students}
#'   \item{Level}{`<chr>` undergraduate, graduate, or all students}
#'   \item{Goal}{`<chr>` degree-seeking, non-degree-seeking, or all}
#'   \item{Enrollment}{`<chr>` first-time, transfer, continuing, or all students}
#' }
#' 
#' ### EFFYLEV
#' 
#' An object of class `spec_tbl_df`
#' (inherits from `tbl_df`, `tbl`, `data.frame`)
#' with 4 rows and 2 columns.
#' 
#' \describe{
#'   \item{EFFYLEV}{`<int>` a code that maps to the rest of the columns}
#'   \item{Stage}{`<chr>` All, Graduate, Undergraduate, or Detail}
#' }
#' 
#' ### LSTUDY
#' 
#' An object of class `spec_tbl_df`
#' (inherits from `tbl_df`, `tbl`, `data.frame`)
#' with 3 rows and 2 columns.
#' 
#' \describe{
#'   \item{LSTUDY}{`<int>` a code that maps to the rest of the columns}
#'   \item{Original Stage}{`<chr>` TOtal, Graduate, or Undergraduate}
#' }
#' 
#' ### EFY
#' 
#' An object of class `spec_tbl_df`
#' (inherits from `tbl_df`, `tbl`, `data.frame`)
#' with 34 rows and 4 columns.
#' 
#' \describe{
#'   \item{EFY}{`<int>` a 7- or 7-letter code that maps to the rest of the columns}
#'   \item{Population}{`<chr>` A population name similar to those from OMB97}
#'   \item{Sex}{`<chr>` Female, male, all, or another gender identity}
#'   \item{Description}{`<chr>` The population description from the dictionary file}
#' }
#' 
#' @source <https://nces.ed.gov/ipeds/datacenter/DataFiles.aspx>
"GLOSSARIES_FOR_EFFY"

#' Mapping details about credentials and success from a complex field in the table of graduation rates.
#' @format ## `GLOSSARIES_FOR_GR_TYPES`
#' A list of three data frames.
#'
#' ### Cohort
#' 
#' An object of class `spec_tbl_df`
#' (inherits from `tbl_df`, `tbl`, `data.frame`)
#' with 28 rows and 4 columns.
#' 
#' \describe{
#'   \item{GRTYPE}{`<int>` a code that maps to the rest of the columns}
#'   \item{Years}{`<int>` Whether the cohort comes from a 2- or 4-year institution.}
#'   \item{Award Sought}{`<fct>`
#'   Cohorts are defined by their institution and the type of award their students enrolled to earn.
#'   Values include "Certificate," "Associate's," "Bachelor's," or "Any." }
#'   \item{Statistic}{`<fct>`
#'    The quantity reported in rows with this GRTYPE code.
#'    Possible values are:
#'    "Everyone",
#'    "Excluded from cohort",
#'    "Adjusted cohort",
#'    "Transferred out",
#'    "Still enrolled",
#'    "No longer enrolled".
#'    }
#' }
#' 
#' ### Completers
#' 
#' An object of class `spec_tbl_df`
#' (inherits from `tbl_df`, `tbl`, `data.frame`)
#' with 18 rows and 5 columns.
#' \describe{
#'   \item{GRTYPE}{`<int>` a code that maps to the rest of the columns}
#'   \item{Years}{`<int>` Whether the cohort comes from a 2- or 4-year institution.}
#'   \item{Award Sought}{`<fct>`
#'   Cohorts are defined by their institution and the type of award their students enrolled to earn.
#'   Values include "Certificate", "Associate's", "Bachelor's", or "Any degree" }
#'   \item{Award Level}{`<chr>` the actual credential a person earned, with the same options as above}
#'   \item{Time to Award}{`<fct>` Relative to the normal completion time. Values are "<=100%", "==125%", "<=150%", and "==150%".}
#' }
#' 
#' ### Assistance
#' 
#' An object of class `spec_tbl_df`
#' (inherits from `tbl_df`, `tbl`, `data.frame`)
#' with 4 rows and 3 columns.
#' \describe{
#'   \item{PSGRTYPE}{`<int>` a code that maps to the rest of the columns}
#'   \item{Years}{`<int>` Whether the cohort comes from a 2- or 4-year institution.}
#'   \item{Award Sought}{`<fct>`
#'   Cohorts are defined by their institution and the type of award their students enrolled to earn.
#'   Values include "Certificate", "Associate's", "Bachelor's", or "Any degree" }
#' }
#' @source <https://nces.ed.gov/ipeds/datacenter/DataFiles.aspx>
"GLOSSARIES_FOR_GR_TYPES"

#' Higher Education Award Levels in IPEDS
#' 
#' Integer codes for the different kinds of degrees that students may earn.
#' Every different table in IPEDS has a slightly different way of labeling
#' credentials like certificates or degrees.
#' This table attempts to connect them into a single, semi-coherent, system.
#' 
#' @format ## `GLOSSARY_OF_AWARDS`
#' An object of class `spec_tbl_df`
#' (inherits from `tbl_df`, `tbl`, `data.frame`)
#' with 16 rows and 7 columns.
#' \describe{
#'   \item{Award Level       }{`<int>` a 4-digit code that captures AWLEVEL and Stage}
#'   \item{AWLEVEL           }{`<int>` essentially the primary key, mostly reflects the order of awards in terms of credits required}
#'   \item{CIP_LEVEL         }{`<chr>` mostly integer codes that are similar to AWLEVEL, except for some short certificates}
#'   \item{Consolidated Level}{`<chr>` short labels derived from documentation for Completers tables. Take with a grain of salt.}
#'   \item{Credential        }{`<fct>` either "Certificate" or "Degree"}
#'   \item{Stage             }{`<fct>` either "Undergraduate" or "Graduate"}
#'   \item{Label             }{`<chr>` a long description of the specific award}
#' }
#' @source <https://nces.ed.gov/ipeds/datacenter/DataFiles.aspx>
"GLOSSARY_OF_AWARDS"

#' Definitions of columns found in data that describes postsecondary completers
#' @format ## `GR_VARIABLES`
#' An object of class `spec_tbl_df`
#' (inherits from `tbl_df`, `tbl`, `data.frame`)
#' with 74 rows and 8 columns.
#' \describe{
#'   \item{varNumber}{`<int>` a code for mapping from raw data to this table.}
#'   \item{varName}{`<chr>` a seven-character name for each variable}
#'   \item{varTitle}{`<chr>` a human-readable name for each variable}
#'   \item{DataType}{`<chr>` "N" for data and "A" for metadata}
#'   \item{format Time}{`<dbl>` either "Cont" (count or continuous) or "Disc" (numeric or character categories)}
#'   \item{Race/Ethnicity}{`<chr>` The OMB racial/ethnic category for people counted by this variable}
#'   \item{Sex}{`<chr>` The OMB gender category for people counted by this variable}
#'   \item{longDescription}{`<chr>` a verbose explanation of the variable}
#' }
#' @source <https://nces.ed.gov/ipeds/datacenter/DataFiles.aspx>
"GR_VARIABLES"

#' Metadata about postsecondary completion by publicly-funded financial assistance
#' @format ## `GR_PELL_SSL_VARIABLES`
#' An object of class `spec_tbl_df`
#' (inherits from `tbl_df`, `tbl`, `data.frame`)
#' with 26 rows and 3 columns.
#' \describe{
#'   \item{varname}{`<chr>` a seven-character name for each variable}
#'   \item{Assistance}{`<chr>` The type of financial assistance (if any) students received}
#'   \item{Role}{`<chr>` Whether the `Measure` is for the whole "Cohort" or for specific "Completers"}
#'   \item{Measure}{`<chr>` The quantity reported by the column}
#' }
#' @source <https://nces.ed.gov/ipeds/datacenter/DataFiles.aspx>
"GR_PELL_SSL_VARIABLES"

#' Cohort details for counting 4-, 6-, and 8-year completion dates
#' 
#' Integer codes for different combinations of first-time, full-time, and financial aid statuses
#' 
#' @format ## `OMCHRT`
#' An object of class `spec_tbl_df`
#' (inherits from `tbl_df`, `tbl`, `data.frame`)
#' with 15 rows and 4 columns.
#' \describe{
#' \item{OMCHRT}{`<int>` Code value for cohort type}
#' \item{Entry Status}{`<chr>` All, First-time, or Not-first-time}
#' \item{Time Status}{`<chr>` All, Full-time, or Part-time}
#' \item{Aid Status}{`<chr>` All, Pell recipient, or not Pell recipient}
#' }
#' @source <https://nces.ed.gov/ipeds/datacenter/DataFiles.aspx>
"OMCHRT"

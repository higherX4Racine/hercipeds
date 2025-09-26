## Copyright (C) 2025 by Higher Expectations for Racine County

#' Read data about college completers from one zipped file
#'
#' Each file contains the number of students receiving a degree or certificate.
#' Data cover awards granted between July 1, `.year - 1` and June 30, `.year`.
#' 
#' There are three possible aggregations of completer data.
#' The type of aggregation determines the specific layout of the return value.
#'
#' ### Aggregation A
#' 
#' This aggregation reports about graduates by field of study, primary major,
#' gender, race/ethnicity, immigration status, and type of degree.
#' Choosing this aggregation results in a return value with 7 columns.
#' 
#' \describe{
#'   \item{UNITID      }{ `<int>` the seven-digit code for an institution}
#'   \item{CIPCODE     }{ `<chr>` a 2-, 4-, or 6-digit code for a field of study}
#'   \item{MAJORNUM    }{ `<int>` whether this was a first or second major}
#'   \item{Completers  }{ `<int>` the number of degrees awarded in a calendar year}
#'   \item{Population  }{ `<chr>` the race/ethnicity or other demographic category of people counted by this row}
#'   \item{Gender      }{ `<chr>` all, female, or male}
#'   \item{Award Level }{ `<chr>` Associate's, Bachelor's, Certificate, etc.}
#' }
#' 
#' ### Aggregation B
#'
#' This aggregation reports about graduates by gender, race/ethnicity, and
#' immigration status.
#' Choosing this aggregation results in a return value with 4 columns.
#' 
#' \describe{
#'   \item{UNITID     }{`<int>` the seven-digit code for an institution}
#'   \item{Completers }{`<int>` the number of degrees awarded in a calendar year}
#'   \item{Population }{`<chr>` the race/ethnicity or other demographic category of people counted by this row}
#'   \item{Gender     }{`<chr>` all, female, or male}
#' }
#' 
#' ### Aggregation C
#' 
#' This version of the table enumerates students by level of award and by
#' race/ethnicity, gender and age categories. Each file contains multiple
#' records per institution. Each record is uniquely defined by the variables
#' IPEDS ID (UNITID) and award level (AWLEVELC ). The 'C' is stripped from
#' "AWLEVELC" during post-read processing. Each record will contain:
#'
#' Choosing this aggregation results in a return value with 7 columns.
#' 
#' \describe{
#'   \item{UNITID      }{`<int>` the seven-digit code for an institution}
#'   \item{Completers  }{`<int>` the number of degrees awarded in a calendar year}
#'   \item{Population  }{`<chr>` the race/ethnicity or other demographic category of people counted by this row}
#'   \item{Gender      }{`<chr>` all, female, or male}
#'   \item{Lower Age   }{`<int>` the lowest age in the age bracket described by this row}
#'   \item{Upper Age   }{`<int>` the highest age in the age bracket described by this row}
#'   \item{Award Level }{`<chr>` Associate's, Bachelor's, Certificate, etc.}
#' }
#' 
#' Numbers are not available for combinations of race, gender and age.
#' Beginning with 2019-20, "certificate of less than 1 year" was replaced by
#' the following 2 categories:
#' 
#' * certificates of less than 12 weeks
#' * certificates of at least 12-weeks but less-than 1-year.
#' 
#' @param .path `<chr>` the full path to a csv file with completer data.
#' @param .spec `<tbl>` either "A," "B," or "C."
#'
#' @return An object of class `spec_tbl_df`
#' (inherits from `tbl_df`, `tbl`, `data.frame`).
#' The exact nature of the value depends upon `.spec`.
#' See Details
#' @export
read_completers <- function(.path, .spec){
    .spec_frame <- COMPLETERS_SPEC[[.spec]]
    .result <- .path |>
        readr::read_csv(
            col_types = .spec_frame$DataType |>
                rlang::set_names(.spec_frame$Column) |>
                c(.default = "_")
        ) |>
        tidyr::pivot_longer(
            cols = .spec_frame |>
                dplyr::filter(!is.na(.data$Population)) |>
                dplyr::pull("Column") |>
                tidyselect::all_of(),
            names_to = "Column",
            values_to = "Completers"
        ) |>
        dplyr::inner_join(
            dplyr::select(.spec_frame,
                          !tidyselect::any_of(c("DataType", "Definition"))),
            by = "Column"
        )
    if ("AWLEVEL" |> grepl(names(.result)) |> any()) {
        .result <- .result |>
            dplyr::rename_with(
                .fn = ~ "AWLEVEL",
                .cols = tidyselect::starts_with("AWLEVEL")
            ) |>
            dplyr::inner_join(
                hercipeds::AWLEVEL,
                by = "AWLEVEL"
            )
    }
    dplyr::select(.result,
                  !tidyselect::any_of(c("Column", "AWLEVEL"))
    )
}
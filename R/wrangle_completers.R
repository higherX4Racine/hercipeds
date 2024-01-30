#' Render IPEDS college completion data into a long, tidy tibble. 
#'
#' @param .conn <chr> a suitable input to [readr::read_csv()], as from [unzip_completers()]
#' @param .spec <tibble> one of the elements of [hercipeds::COMPLETERS_SPEC]
#'
#' @return a tibble of college completion data, aggregated according to `.spec`
#' @seealso [unzip_completers()]
#' @seealso [read_completers()]
#' @importFrom readr read_csv
#' @importFrom rlang set_names
#' @importFrom tidyr pivot_longer
#' @importFrom dplyr filter
#' @importFrom dplyr pull
#' @importFrom tidyselect all_of
#' @importFrom dplyr inner_join
#' @importFrom dplyr select
#' @importFrom tidyselect any_of
#' @importFrom dplyr rename_with
#' @importFrom tidyselect starts_with
wrangle_completers <- function(.conn, .spec){
    .result <- .conn |>
        readr::read_csv(
            col_types = .spec$DataType |>
                rlang::set_names(.spec$Column) |>
                c(.default = "_")
        ) |>
        tidyr::pivot_longer(
            cols = .spec |>
                dplyr::filter(!is.na(.data$Population)) |>
                dplyr::pull("Column") |>
                tidyselect::all_of(),
            names_to = "Column",
            values_to = "Completers"
        ) |>
        dplyr::inner_join(
            dplyr::select(.spec,
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
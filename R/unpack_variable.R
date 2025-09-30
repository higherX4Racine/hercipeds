## Copyright (C) 2025 by Higher Expectations for Racine County

#' Expand a compact coded variable into its multiple meanings in a lookup table
#'
#' Many situations arise where a single variable, like "GRTYPE" in IPEDS,
#' actually encodes a specific combination of values from several other
#' variables.
#' This function is a utility for adding all of those meanings to a table that
#' originally just has the compact one.
#'  
#' @param .table_with_variable `<tbl>` the table where the variable appears without elaboration
#' @param .variable_definitions `<tbl>` the table of definitions for the variable
#' @param .variable_name `<any>` the name of the variable field, which should be the same in both of the other inputs
#' @param ... `<chr>` fields from `variable_definitions` to keep. Leaving this empty means "use all columns in `.variable_definitions`"
#'
#' @returns `<tbl>` a data frame with all columns in `.table_with_variable` (except `.variable_name`) and the `...` columns from `.variable_definitions`.
#' @export
unpack_variable <- function(.table_with_variable,
                            .variable_definitions,
                            .variable_name,
                            ...) {
    
    .names_to_keep <- c(...)
    
    if (length(.names_to_keep) == 0) {
        .names_to_keep <- setdiff(names(.variable_definitions),
                                        .variable_name)
    }
    
    .table_with_variable |>
        dplyr::inner_join(
            dplyr::select(
                .variable_definitions,
                tidyselect::all_of(c(.variable_name,
                                     .names_to_keep))
            ),
            by = .variable_name
        ) |>
        dplyr::select(
            !tidyselect::any_of(.variable_name)
        )
}
## Copyright (C) 2025 by Higher Expectations for Racine County

fetch_all_completers <- function(.destination,
                                 .begin_year = 2012,
                                 .final_year = NULL,
                                 show_progress = FALSE) {
    if (is.null(.final_year)) {
        .final_year <- (lubridate::today() |> lubridate::year()) - 1L
    }
    .existing_files <- dir(.destination,
                           pattern = ".+\\.zip")
    .possible_files <- LETTERS[1:3] |>
        outer(
            .begin_year:.final_year,
            \(.suffix, .year) paste0("C", .year, "_", .suffix, ".zip")
        ) |>
        as.character() |>
        setdiff(
            .existing_files
        )
    
    curl::multi_download(
        urls = paste0(
            "https://nces.ed.gov/ipeds/datacenter/data/",
            .possible_files
        ),
        destfiles = file.path(
            .destination,
            .possible_files
        ),
        resume = FALSE,
        progress = show_progress
    )
}

# Copyright (C) 2024 by Higher Expectations for Racine County

fn <- tempfile()

CORNELLS <- list()

withr::with_file(fn, {
    
    curl::curl_download("https://nces.ed.gov/ipeds/datacenter/data/HD2022.zip",
                        destfile = fn)
    
    CORNELLS$Directory <- fn |>
        archive::archive_read(file = 1L) |>
        readr::read_csv(col_types = "c") |>
        dplyr::filter(stringr::str_detect(.data$INSTNM, "Cornell"))
})

withr::with_file(fn, {
    
    curl::curl_download("https://nces.ed.gov/ipeds/datacenter/data/C2022_C.zip",
                        destfile = fn)
    
    CORNELLS$Completers <- fn |>
        archive::archive_read(file = 1L) |>
        readr::read_csv(col_types = "c") |>
        dplyr::semi_join(CORNELLS$Directory,
                         by = "UNITID")
})

usethis::use_data(CORNELLS, overwrite = TRUE)

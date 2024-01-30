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

list(
    Completers = "C2022_C",
    Outcomes = "OM2022"
) |>
    purrr::iwalk(function(.base, .key){
        withr::with_file(fn, {
            
            "https://nces.ed.gov/ipeds/datacenter/data/{.base}.zip" |>
                glue::glue() |>
                curl::curl_download(destfile = fn)
            
            CORNELLS[[.key]] <<- fn |>
                archive::archive_read(file = 1L) |>
                readr::read_csv(col_types = "c") |>
                dplyr::semi_join(CORNELLS$Directory,
                                 by = "UNITID")
        })
        
    })

usethis::use_data(CORNELLS, overwrite = TRUE)
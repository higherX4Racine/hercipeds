## Copyright (C) 2025 by Higher Expectations for Racine County

GLOSSARIES_FOR_EFFY <- list(
    EFFYALEV = tibble::tribble(
        ~ EFFYALEV, ~ Label,
         1L,        "All students total",
         2L,        "Undergraduate total",             
         3L,        "Degree/certificate-seeking total",
         4L,        "First time",                      
         5L,        "Other degree/certificate-seeking",
        11L,        "Non-degree/certificate-seeking",  
        12L,        "Graduate",                        
        19L,        "Transfer-ins",                    
        20L,        "Continuing",                      
        21L,        "Full time students total",        
        22L,        "Full-time undergraduate total",   
        23L,        "Degree/certificate-seeking total",
        24L,        "First time",                      
        25L,        "Other degree/certificate-seeking",
        31L,        "Non-degree/certificate-seeking",  
        32L,        "Graduate",                        
        39L,        "Transfer-ins",                    
        40L,        "Continuing",                      
        41L,        "Part time students total",        
        42L,        "Part-time undergraduate total",   
        43L,        "Degree/certificate-seeking total",
        44L,        "First time",                      
        45L,        "Other degree/certificate-seeking",
        51L,        "Non-degree/certificate-seeking",  
        52L,        "Graduate",                        
        59L,        "Transfer-ins",                    
        60L,        "Continuing"
    ),
    
    EFFYLEV = tibble::tribble(
        ~ EFFYLEV, ~ `Level of Study`,
        1L,        "Total",
        2L,        "Undergraduate",
        4L,        "Graduate",
        -2,        "Detail"
    ),
    
    LSTUDY = tibble::tribble(
        ~ LSTUDY, ~ `Original Level of Study`,
        1L,       "Undergraduate",
        3L,       "Graduate",
        999L,     "Total"
    ),
    
    EFY = tibble::tribble(
        ~ EFYPOP, ~ Description,                                ~ Population,
        "TOTL",   "Grand Total",                                "All",
        "AIAN",   "American Indian or Alaska Native",            NA,
        "ASIA",   "Asian",                                       NA,
        "BKAA",   "Black or African American",                   NA,
        "HISP",   "Hispanic or Latino",                          NA,
        "NHPI",   "Native Hawaiian or Other Pacific Islanders",  NA,
        "WHIT",   "White",                                       NA,
        "2MOR",   "Two or more races",                           NA,
        "UNKN",   "Unknown",                                     "Race/ethnicity unknown",
        "NRAL",   "Nonresident Alien",                           "Nonresident",
    ) |>
        dplyr::mutate(
            Population = dplyr::coalesce(.data$Population,
                                         .data$Description)
        ) |>
        tidyr::expand_grid(
            tibble::tribble(
                ~ EFYSEX, ~ Sex,
                "T",      "All",
                "M",      "Male",
                "W",      "Female"
            )
        ) |>
        dplyr::bind_rows(
            tibble::tribble(
                ~ EFYPOP, ~ EFYSEX, ~ Population, ~ Description,                                 ~ Sex,
                "GUU",    "N",      "All",        "Gender Unknown",                              "Unknown",
                "GUA",    "N",      "All",        "Another Gender",                              "Another",
                "GUTO",   "T",      "All",        "Total of gender unknown and another gender",  "Unknown and Another",
                "GUK",    "N",      "All",        "Total mutually exclusive binary (men/women)", "Binary"
            )
        ) |>
        dplyr::mutate(
            EFY = paste0("EFY", .data$EFYPOP, .data$EFYSEX)
        ) |>
        dplyr::select(
            "EFY",
            "Population",
            "Sex",
            "Description"
        )
)
    
usethis::use_data(GLOSSARIES_FOR_EFFY, overwrite = TRUE)

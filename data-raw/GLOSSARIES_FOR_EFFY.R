## Copyright (C) 2025 by Higher Expectations for Racine County

GLOSSARIES_FOR_EFFY <- list(
    EFFYALEV = tidyr::expand_grid(
        tibble::tribble(
            ~ Index, ~ Level,         ~ Goal,       ~ Enrollment,     ~ Label,
                 1L, "All",           "All",        "All",            "All students total",
                 2L, "Undergraduate", "All",        "All",            "Undergraduate total",             
                 3L, "Undergraduate", "Credential", "All",            "Degree/certificate-seeking total",
                 4L, "Undergraduate", "Credential", "First-time",     "First time",                      
                 5L, "Undergraduate", "Credential", "Not first-time", "Other degree/certificate-seeking",
                11L, "Undergraduate", "Non-degree", "Non-degree",     "Non-degree/certificate-seeking",  
                12L, "Graduate",      "Credential", "Graduate",       "Graduate",                        
                19L, "Undergraduate", "Credential", "Transfer",       "Transfer-ins",                    
                20L, "Undergraduate", "Credential", "Continuing",     "Continuing"
        ),
        tibble::tribble(
            ~ Offset, ~ Time,
                  0L, "All",
                 20L, "Full",
                 40L, "Part"
        )
    ) |>
        dplyr::mutate(
            EFFYALEV = .data$Index + .data$Offset
        ) |>
        dplyr::select(
            "EFFYALEV",
            "Time",
            "Level",
            "Goal",
            "Enrollment"
        ) |>
        dplyr::arrange(
            .data$EFFYALEV
        ),

    EFFYLEV = tibble::tribble(
        ~ EFFYLEV, ~ Stage,
        1L,        "Total",
        2L,        "Undergraduate",
        4L,        "Graduate",
        -2,        "Detail"
    ),
    
    LSTUDY = tibble::tribble(
        ~ LSTUDY, ~ `Original Stage`,
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

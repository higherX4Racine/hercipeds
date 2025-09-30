# Copyright (C) 2025 by Higher Expectations for Racine County

GLOSSARY_OF_AWARDS <- tibble::tribble(
    ~ `Award Level`, ~ AWLEVEL, ~ CIP_LEVEL, ~ `Consolidated Level`,          ~ Credential,  ~ Stage,         ~ Label,
            1100L,          2L,         "2", "Certificate of >30 credits",    "Certificate", "Undergraduate", "Certificates of at least 1 but less than 2 years",
            1110L,          3L,         "3", "Associate's degree",            "Degree",      "Undergraduate", "Associate's degree",
            1200L,          4L,         "4", "Certificate of >30 credits",    "Certificate", "Undergraduate", "Certificates of at least 2 but less than 4 years",
            1210L,          5L,         "5", "Bachelor's degree",             "Degree",      "Undergraduate", "Bachelor's degree",
            2100L,          6L,         "6", "Postbaccalaureate certificate", "Certificate", "Graduate",      "Postbaccalaureate certificate",
            2110L,          7L,         "7", "Master's degree",               "Degree",      "Graduate",      "Master's degree",
            2200L,          8L,         "8", "Postbaccalaureate certificate", "Certificate", "Graduate",      "Post-master's certificate",
            2210L,          9L,          NA, "Doctor's degree",               "Degree",      "Graduate",      "Doctor's degree",
            2050L,         10L,          NA, "Postbaccalaureate certificate", "Certificate", "Graduate",      "Postbaccalaureate or Post-master's certificate",
            1000L,         11L,        "1a", "Certificate of <=9 credits",    "Certificate", "Undergraduate", "Certificate of less than 12 weeks",
            1002L,         12L,        "1b", "Certificate of 9-29 credits",   "Certificate", "Undergraduate", "Certificate of at least 12 weeks but less than 1 year",
            2210L,         17L,        "17", "Doctor's degree",               "Degree",      "Graduate",      "Doctor's degree - research/scholarship",
            2210L,         18L,        "18", "Doctor's degree",               "Degree",      "Graduate",      "Doctor's degree - professional practice",
            2210L,         19L,        "19", "Doctor's degree",               "Degree",      "Graduate",      "Doctor's degree - other",
            1000L,         20L,        "1a", "Certificate of <=9 credits",    "Certificate", "Undergraduate", "Certificates of less than 12 weeks",
            1002L,         21L,        "1b", "Certificate of 9-29 credits",   "Certificate", "Undergraduate", "Certificates of at least 12 weeks but less than 1 year"
) |>
    dplyr::mutate(
        dplyr::across(c("Credential", "Stage"),
                      forcats::fct_inorder)
    )

usethis::use_data(GLOSSARY_OF_AWARDS, overwrite = TRUE)

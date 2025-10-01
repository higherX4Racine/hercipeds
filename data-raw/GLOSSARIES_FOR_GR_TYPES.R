## Copyright (C) 2025 by Higher Expectations for Racine County

COHORT_STATS <- tibble::tribble(
    ~ GRTYPE, ~ Years, ~ `Award Sought`, ~ Statistic,
          1L,      4L, "Any degree",     "Everyone",
          2L,      4L, "Any degree",     "Adjusted cohort",
          4L,      4L, "Any degree",     "Transferred out",
          5L,      4L, "Any degree",     "Still enrolled",
          6L,      4L, "Bachelor's",     "Everyone",
          7L,      4L, "Bachelor's",     "Excluded from cohort",
          8L,      4L, "Bachelor's",     "Adjusted cohort",
         16L,      4L, "Bachelor's",     "Transferred out",
         17L,      4L, "Bachelor's",     "Still enrolled",
         18L,      4L, "Certificate",    "Everyone",
         19L,      4L, "Certificate",    "Excluded from cohort",
         20L,      4L, "Certificate",    "Adjusted cohort",
         25L,      4L, "Certificate",    "Transferred out",
         26L,      4L, "Certificate",    "Still enrolled",
         27L,      2L, "Any degree",     "Everyone",
         28L,      2L, "Any degree",     "Excluded from cohort",
         29L,      2L, "Any degree",     "Adjusted cohort",
         33L,      2L, "Any degree",     "Transferred out",
         34L,      2L, "Any degree",     "Still enrolled",
         40L,      4L, "Any degree",     "Excluded from cohort",
         41L,      4L, "Any degree",     "Still enrolled",
         42L,      4L, "Any degree",     "No longer enrolled",
         43L,      4L, "Bachelor's",     "Still enrolled",
         44L,      4L, "Bachelor's",     "No longer enrolled",
         45L,      4L, "Certificate",    "Still enrolled",
         46L,      4L, "Certificate",    "No longer enrolled",
         47L,      2L, "Any degree",     "Still enrolled",
         48L,      2L, "Any degree",     "No longer enrolled"
) |>
    dplyr::mutate(
        Statistic = factor(.data$Statistic,
                           levels = c("Everyone",
                                      "Excluded from cohort",
                                      "Adjusted cohort",
                                      "Transferred out",
                                      "Still enrolled",
                                      "No longer enrolled"))
    )

COMPLETERS <- tibble::tribble(
    ~ GRTYPE, ~ Years, ~ `Award Sought`, ~ `Award Level`, ~ `Time to Award`,
          3L,      4L, "Any degree",     "Any degree",    "<=150%",
          9L,      4L, "Bachelor's",     "Any degree",    "<=150%",
         12L,      4L, "Bachelor's",     "Bachelor's",    "<=150%",
         13L,      4L, "Bachelor's",     "Bachelor's",    "<=100%",
         14L,      4L, "Bachelor's",     "Bachelor's",    "==125%",
         15L,      4L, "Bachelor's",     "Bachelor's",    "==150%",
         10L,      4L, "Bachelor's",     "Certificate",   "<=150%",
         11L,      4L, "Bachelor's",     "Associate's",   "<=150%",
         30L,      2L, "Any degree",     "Any degree",    "<=150%",
         35L,      2L, "Any degree",     "Any degree",    "<=100%",
         31L,      2L, "Any degree",     "Certificate",   "<=150%",
         36L,      2L, "Any degree",     "Certificate",   "<=100%",
         32L,      2L, "Any degree",     "Associate's",   "<=150%",
         37L,      2L, "Any degree",     "Associate's",   "<=100%",
         21L,      4L, "Certificate",    "Any degree",    "<=150%",
         24L,      4L, "Certificate",    "Bachelor's",    "<=150%",
         22L,      4L, "Certificate",    "Certificate",   "<=150%",
         23L,      4L, "Certificate",    "Associate's",   "<=150%"
) |>
    dplyr::mutate(
        `Time to Award` = factor(.data$`Time to Award`,
                                 levels = c("<=100%",
                                            "==125%",
                                            "<=150%",
                                            "==150%"))
        )

PS_GR_TYPES <- tibble::tribble(
    ~ PSGRTYPE, ~ Years, ~ `Award Sought`,
            1L,      4L, "Any degree",
            2L,      4L, "Bachelor's",
            3L,      4L, "Certificate",
            4L,      2L, "Any degree"
)

GLOSSARIES_FOR_GR_TYPES <- list(
    "Cohort" = COHORT_STATS,
    "Completers" = COMPLETERS,
    "Assistance" = PS_GR_TYPES
) |>
    purrr::map(
        \(.df) dplyr::mutate(
            .df,
            dplyr::across(tidyselect::starts_with("Award"),
                          \(.) factor(.,
                                      levels = c("Certificate",
                                                 "Associate's",
                                                 "Bachelor's",
                                                 "Any degree")))
        )
    )

usethis::use_data(GLOSSARIES_FOR_GR_TYPES, overwrite = TRUE)

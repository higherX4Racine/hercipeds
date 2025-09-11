EFFY_SPEC <- list(
    UNITID = "c",
    EFFYALEV = "c",
    EFFYLEV = "i",
    LSTUDY = "-",
    EFYTOTLT = "i",
    EFYTOTLM = "i",
    EFYTOTLW = "i",
    EFYAIANT = "i",
    EFYAIANM = "i",
    EFYAIANW = "i",
    EFYASIAT = "i",
    EFYASIAM = "i",
    EFYASIAW = "i",
    EFYBKAAT = "i",
    EFYBKAAM = "i",
    EFYBKAAW = "i",
    EFYHISPT = "i",
    EFYHISPM = "i",
    EFYHISPW = "i",
    EFYNHPIT = "i",
    EFYNHPIM = "i",
    EFYNHPIW = "i",
    EFYWHITT = "i",
    EFYWHITM = "i",
    EFYWHITW = "i",
    EFY2MORT = "i",
    EFY2MORM = "i",
    EFY2MORW = "i",
    EFYUNKNT = "i",
    EFYUNKNM = "i",
    EFYUNKNW = "i",
    EFYNRALT = "i",
    EFYNRALM = "i",
    EFYNRALW = "i",
    .default = "-"
)

EFFYLEV_MAPPING <- tibble::tribble(
    ~ EFFYLEV, ~ `Level of Study`,
    1L,        "Total",
    2L,        "Undergraduate",
    4L,        "Graduate"
)

LSTUDY_MAPPING <- tibble::tribble(
    ~ LSTUDY, ~ `Original Level of Study`,
    1L,       "Undergraduate",
    3L,       "Graduate"
)

EFFY_RACES <- tibble::tribble(
    ~ FCAN, ~ SOURCE_RACE,                                ~ `Race/Ethnicity`,
    "TOTL", "Grand Total",                                "All",
    "AIAN", "American Indian or Alaska Native",           "Indigenous",
    "ASIA", "Asian",                                      "Asian",
    "BKAA", "Black or African American",                  "Black",
    "HISP", "Hispanic or Latino",                         "Latine",
    "NHPI", "Native Hawaiian or Other Pacific Islanders", "Pacific Islander",
    "WHIT", "White",                                      "White",
    "2MOR", "Two or more races",                          "Multiracial",
    "UNKN", "Unknown",                                    "Unknown",
    "NRAL", "Nonresident Alien",                          "International"
)

EFFY_SEXES <- tibble::tribble(
    ~ Code, ~ Sex,
    "T",    "All",
    "M",    "Male",
    "W",    "Female"
)

wrangle_effy <- function(.raw_effy) {
    .raw_effy |>
        tidyr::pivot_longer(
            cols = tidyselect::starts_with("EFY"),
            names_to = c("FCAN", "Code"),
            names_pattern = "EFY(.{4})(.)"
        ) |>
        dplyr::inner_join(
            EFFY_RACES,
            by = "FCAN"
        ) |>
        dplyr::inner_join(
            EFFY_SEXES,
            by = "Code"
        ) |>
        dplyr::select(
            !tidyselect::any_of(c("FCAN", "Code"))
        )
}
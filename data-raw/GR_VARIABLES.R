## code to prepare `GR_VARIABLES` dataset goes here

GR_VARIABLES <- "extdata" |>
    system.file(
        "grvariables.csv",
        package = "hercipeds"
    ) |>
    readr::read_csv(
        col_types = list(
            varNumber = "i",
            varName = "c",
            varTitle = "c",
            DataType = "c",
            format = "c",
            `Race/Ethnicity` = "c",
            Sex = "c",
            longDescription = "c"
        )
    )

usethis::use_data(GR_VARIABLES, overwrite = TRUE)

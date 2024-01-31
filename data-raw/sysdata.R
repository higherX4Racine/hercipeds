# Copyright (C) 2023 by Higher Expectations for Racine County

source("data-raw/specs/COMPLETERS_SPEC.R")
source("data-raw/specs/DIRECTORY_SPEC.R")
source("data-raw/specs/OUTCOMES_SPEC.R")

usethis::use_data(COMPLETERS_SPEC,
                  DIRECTORY_SPEC,
                  OUTCOMES_SPEC,
                  .OUTCOME_TYPES,
                  .COLUMNS,
                  .MEASURE_SPEC,
                  .MEASURE_COLUMNS,
                  overwrite = TRUE,
                  internal = TRUE)

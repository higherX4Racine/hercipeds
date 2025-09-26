## Copyright (C) 2025 by Higher Expectations for Racine County


find_yearly_tables <- function(.path, .prefix, .suffix) {
    dir(.path,
        pattern = paste0(.prefix, "\\d{4}", .suffix),
        full.names = TRUE)
}
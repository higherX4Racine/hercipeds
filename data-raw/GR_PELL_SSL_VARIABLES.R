## Copyright (C) 2025 by Higher Expectations for Racine County

GR_PELL_SSL_VARIABLES <- tibble::tribble(
    ~ varname,	~ Assistance,	          ~ Role,	    ~ Measure,
    "UNITID",	"",	                      "",	        "",
    "PSGRTYPE",	"",	                      "",	        "",
    "PGREVCT",	"Pell Grant",	          "Cohort",	    "Revised cohort",
    "PGEXCLU",	"Pell Grant",	          "Cohort",	    "Excluded from cohort",
    "PGADJCT",	"Pell Grant",	          "Cohort",	    "Adjusted cohort",
    "PGCMBAC",	"Pell Grant",	          "Completers", "Bachelor's",
    "PGCMOBA",	"Pell Grant",	          "Completers", "Associate's",
    "PGCMTOT",	"Pell Grant",	          "Completers", "Any degree",
    "SSREVCT",	"Direct Subsidized Loan", "Cohort",     "Revised cohort",
    "SSEXCLU",	"Direct Subsidized Loan", "Cohort",     "Excluded from cohort",
    "SSADJCT",	"Direct Subsidized Loan", "Cohort",     "Adjusted cohort",
    "SSCMBAC",	"Direct Subsidized Loan", "Completers", "Bachelor's",
    "SSCMOBA",	"Direct Subsidized Loan", "Completers", "Associate's",
    "SSCMTOT",	"Direct Subsidized Loan", "Completers", "Any degree",
    "NRREVCT",	"None",	                  "Cohort",     "Revised cohort",
    "NREXCLU",	"None",	                  "Cohort",     "Excluded from cohort",
    "NRADJCT",	"None",	                  "Cohort",     "Adjusted cohort",
    "NRCMBAC",	"None",	                  "Completers", "Bachelor's",
    "NRCMOBA",	"None",	                  "Completers", "Associate's",
    "NRCMTOT",	"None",	                  "Completers", "Any degree",
    "TTREVCT",	"Any",                    "Cohort",     "Revised cohort",
    "TTEXCLU",	"Any",                    "Cohort",     "Excluded from cohort",
    "TTADJCT",	"Any",                    "Cohort",     "Adjusted cohort",
    "TTCMBAC",	"Any",                    "Completers", "Bachelor's",
    "TTCMOBA",	"Any",                    "Completers", "Associate's",
    "TTCMTOT",	"Any",                    "Completers", "Any degree"
)

usethis::use_data(GR_PELL_SSL_VARIABLES, overwrite = TRUE)

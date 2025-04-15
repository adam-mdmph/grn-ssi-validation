library(tidyverse)

# Create empty data set for combined patients
combined_data <- data.frame()  # Initializing an empty dataframe to store the combined data

for (year in years) {
  # Construct path names for each year
  puf_name <- paste0("P:/Pro00113988 - PAD Risk Models/DataRepo/NSQIP/Data/acs_nsqip_puf/rds/acs_nsqip_puf", year, "_clean.rds")
  puf_cpt_name  <- paste0("P:/Pro00113988 - PAD Risk Models/DataRepo/NSQIP/Data/acs_nsqip_puf/rds/acs_nsqip_puf", year, "_cpt.rds")
  
  
  # Read data sets for the current year
  puf <- readRDS(puf_name)
  puf_cpt <- readRDS(puf_cpt_name)
  
  # Filter patients with specific PRIMARY CPT codes
  selected_patients <- puf %>%
    filter(caseid %in% unlist(puf_cpt %>% 
                                filter((cpt %in% cpt_codes) & nproc == 1) %>% 
                                select(caseid)))
  
  # Add primary CPT to puf data set
  prim_cpt <- filter(puf_cpt, nproc == 1)
  
  selected_patients <- merge(selected_patients, prim_cpt, by = 'caseid')
  
  # Combine data with previously selected cases
  combined_data <- bind_rows(combined_data, selected_patients)
  
  # Remove objects from environment
  rm(year, puf_name, puf_cpt_name, puf, puf_cpt, selected_patients, puf_cpt_name, prim_cpt, puf_cpt)
  
}

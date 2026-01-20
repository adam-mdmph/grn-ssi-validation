# Combine procedure targeted data sets across years

tar_years <- c("13", "14", "15", "16", "17", "18", "19", "20", "21")

# Combine aio data sets across years

combined_aio <- data.frame()  # Initializing an empty dataframe to store the combined data

for (year in tar_years) {
  # Construct path names for each year
  tar_name <- paste0("P:/Pro00113988 - PAD Risk Models/DataRepo/NSQIP/Data/puf_tar_aio/rds/puf_tar_aio_20", year, "_clean.rds")
  
  # Read data sets for the current year
  tar_puf <- readRDS(tar_name)
  
  #combine across years
  combined_aio <- bind_rows(combined_aio, tar_puf)
  
  # Remove objects
  rm(tar_name, year, tar_puf)

}

# Combine leo data sets across years

combined_leo <- data.frame()  # Initializing an empty dataframe to store the combined data

for (year in tar_years) {
  # Construct path names for each year
  tar_name <- paste0("P:/Pro00113988 - PAD Risk Models/DataRepo/NSQIP/Data/puf_tar_leo/rds/puf_tar_leo_20", year, "_clean.rds")
  
  # Read data sets for the current year
  tar_puf <- readRDS(tar_name)
  
  #combine across years
  combined_leo <- bind_rows(combined_leo, tar_puf)
  
  # Remove objects
  rm(tar_name, year, tar_puf)
  
}

# Rename columns with generic 'pad'

combined_aio_pad <- combined_aio %>%
  rename_with(~sub("^aio", "pad", .), starts_with("aio"))

combined_leo_pad <- combined_leo %>%
  rename_with(~sub("^leo", "pad", .), starts_with("leo"))

combined_leo_pad <- combined_leo_pad %>%
  rename(pad_mrtas = pad_mrb)

combined_pad <- bind_rows(combined_leo_pad, combined_aio_pad)

rm(tar_years, combined_aio, combined_aio_pad, combined_leo, combined_leo_pad)

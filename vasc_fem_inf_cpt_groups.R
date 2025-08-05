#Create separate data set with CPT counts

#count_cpt <- puf_pad_grninf_clean %>% group_by(cpt, proc) %>% summarise(count = n())

#Create CPT vectors related to conduit

cpt_vein <-  c("34520", "35521", "35533", "35539", "35540", "35556",
              "35558", "35565", "35566", "35583", "35585", "35884")
cpt_patch <- c("35355", "35363", "35371", "35372")
cpt_prsth <- c("35131", "35132", "35646", "35647", "35654", "35656",
               "35661", "35665", "35666", "35884")

#Create CPT vector related to procedure AI
cpt_ai <-       c("35331", "35351", "35355", "35361", "35537",
                  "35538", "35539", "35540", "35563", "35565", "35621", "35623", 
                  "35637", "35638", "35646", "35647", "35663", "35665")
cpt_aortofem <- c("35539", "35540", "35546", "35548", "35551", "35582", "35646", "35647", "35651")
cpt_iliofem <- c("35565", "35665")
cpt_axfem <- c("35521", "35533", "35621", "35654")
cpt_femfem <- c("34520", "35558", "35661")

#Create CPT vector related to procedure LER
cpt_le <- c("35556", "35566", "35571", "35583", "35585", "35587", "35656", "35666", "35671")
cpt_cfea <- c("35355", "35363", "35371", "35372", "35381")
cpt_femaneur <- c("35131", "35132", "35721")
cpt_fempop <- c("35556", "35583", "35656")
cpt_femtib <- c("35566", "35585", "35666")
cpt_embo <- c("34201")

#Create vector related to redo operations
cpt_prrevasc <- c("35883", "35884")
cpt_redo <- c("35700", "35883", "35884")

#Create CPT vector related to all procedures AI and LER
cpt_codes <- c(cpt_aortofem, cpt_iliofem, cpt_axfem, cpt_femfem, cpt_embo, cpt_cfea, cpt_femaneur, cpt_fempop, cpt_femtib, cpt_redo)



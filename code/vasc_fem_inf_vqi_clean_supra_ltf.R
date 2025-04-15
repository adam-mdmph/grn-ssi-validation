

############################### Proc Data Types ################################
##Revised code from Leila Mureebe

supra_ltf <- read_csv("P:/Pro00113988 - PAD Risk Models/DataRepo/VQI/SUPRA_International_20231201/SUPRA_International_LTF_20231201.csv")

supra_ltf <- supra_ltf %>% rename(
  LTF_SSI=LTF_INFECTION
)

numVars <- c('LTF_DAYS')

charVars <- c('PRIMPROCID')

logicalVars <- c('D30_WOUNDCOMP_NECROSIS', 'D30_WOUNDCOMP_HEMATOMA', 'D30_WOUNDCOMP_SEROMA',
                 'D30_WOUNDCOMP_LYMPH_LEAK', 'D30_WOUNDCOMP_DEHISCENCE', 'D30_WOUNDCOMP_OTHER',
                 'D30_VASCCOMP_BLEEDING')

factorVars <- c('LTF_SSI','FWP_TIMEPOINT', 'D30_ADMISSION_REASON',
                'D30_SSI')

#apply data types
supra_ltf[numVars] <- lapply(supra_ltf[numVars], as.numeric)
supra_ltf[charVars] <- lapply(supra_ltf[charVars], as.character)
supra_ltf[logicalVars] <- lapply(supra_ltf[logicalVars], as.logical)
supra_ltf[factorVars] <- lapply(supra_ltf[factorVars], as.factor)

allVars_supra_ltf <- c(numVars, charVars, logicalVars, factorVars)

########################### Remove duplicate and retired variables ###########################
duplicate <- c()

supra_ltf <- supra_ltf %>%
  select(-all_of(duplicate))

retired <- c()

#NEED TO ADD PRIOR CEA, CABGPTA, and ANTIBIOTICSTART/END variables back into data set

supra_ltf <- supra_ltf %>%
  select(-all_of(retired))

error <- c()

supra_ltf <- supra_ltf %>%
  select(-all_of(error))

############################# Recode Proc factors ##############################-----

supra_ltf$LTF_SSI <- factor(supra_ltf$LTF_SSI, labels = c("No", 
                                                                "Superficial", #Superficial Cellulitis
                                                                "Deep", #Deep Abscess
                                                                "Organ Space" #Infection Involving Artery or Graft
                                                                ))

supra_ltf$D30_ADMISSION_REASON <- factor(supra_ltf$D30_ADMISSION_REASON, labels = c("Surgical Site Infection", 
                                                                                    "Other Infection", 
                                                                                    "Wound Complication",
                                                                                    "Cardiac Complication",
                                                                                    "Vascular Complication",
                                                                                    "VTE Complication",
                                                                                    "Respiratory Complication",
                                                                                    "CNS Complication",
                                                                                    "Renal Complication",
                                                                                    "GI Complication",
                                                                                    "Other"
                                                                                    ))


supra_ltf$D30_SSI <- factor(supra_ltf$D30_SSI, labels = c("Superficial",
                                                          "Deep",
                                                          "Organ Space"
                                                          ))


# Remove objects

rm(list = c("charVars", "duplicate", "error", "factorVars", "logicalVars", "numVars", "retired"))



############################### Proc Data Types ################################
##Revised code from Leila Mureebe

infra_ltf <- read_csv("../../DataRepo/VQI/INFRA_International_20231201/INFRA_International_LTF_20231201.csv")

numVars <- c('LTF_DAYS')

charVars <- c('PRIMPROCID')

logicalVars <- c('LTF_SSIGRAFT',
                 'D30_WOUNDCOMP_NECROSIS', 'D30_WOUNDCOMP_HEMATOMA', 'D30_WOUNDCOMP_SEROMA',
                 'D30_WOUNDCOMP_LYMPH_LEAK', 'D30_WOUNDCOMP_DEHISCENCE', 'D30_WOUNDCOMP_OTHER',
                 'D30_VASCCOMP_BLEEDING',
                 'R_D30_GRAFT')

factorVars <- c('LTF_SSI','FWP_TIMEPOINT', 'D30_ADMISSION_REASON',
                'D30_SSI', 'R_D30_SSI')

#apply data types
infra_ltf[numVars] <- lapply(infra_ltf[numVars], as.numeric)
infra_ltf[charVars] <- lapply(infra_ltf[charVars], as.character)
infra_ltf[logicalVars] <- lapply(infra_ltf[logicalVars], as.logical)
infra_ltf[factorVars] <- lapply(infra_ltf[factorVars], as.factor)

allVars_infra_ltf <- c(numVars, charVars, logicalVars, factorVars)

########################### Remove duplicate and retired variables ###########################
duplicate <- c()

infra_ltf <- infra_ltf %>%
  select(-all_of(duplicate))

retired <- c()

#NEED TO ADD PRIOR CEA, CABGPTA, and ANTIBIOTICSTART/END variables back into data set

infra_ltf <- infra_ltf %>%
  select(-all_of(retired))

error <- c()

infra_ltf <- infra_ltf %>%
  select(-all_of(error))

############################# Recode Proc factors ##############################-----

infra_ltf$LTF_SSI <- factor(infra_ltf$LTF_SSI, labels = c("No", "Superficial", "Deep", 
                                                          "Organ Space"
                                                          #"Return to OR" # Retired since 9/30/2014
                                                          ))

infra_ltf$D30_ADMISSION_REASON <- factor(infra_ltf$D30_ADMISSION_REASON, labels = c("Surgical Site Infection", 
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


infra_ltf$D30_SSI <- factor(infra_ltf$D30_SSI, labels = c("Superficial",
                                                          "Deep",
                                                          "Organ Space"
                                                          ))

infra_ltf$R_D30_SSI <- factor(infra_ltf$R_D30_SSI, labels = c("No",
                                                          "Superficial",
                                                          "Deep",
                                                          "Organ Space"
                                                          #"Return to OR" # Retired since 9/30/14
))



# Remove objects

rm(list = c("charVars", "duplicate", "error", "factorVars", "logicalVars", "numVars", "retired"))

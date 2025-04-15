# This script is for feature engineering for prediction of wound infections in the NSQIP data set based on previous publications

# Create outcome variable - grninf
# puf_pad_grninf_clean <- puf_pad_grninf_clean %>%
# mutate(grninf = supinfec | wndinfd | orgspcssi)

# Create variable for operative year
# puf_pad_grninf_clean$operyr_trunc <- substr(puf_pad_grninf_clean$operyr, 1, 4)
# puf_pad_grninf_clean$operyr_trunc <- as.factor(puf_pad_grninf_clean$operyr_trunc)

# Create female variable
#puf_pad_grninf_clean$female <- ifelse(puf_pad_grninf_clean$sex == "Female", TRUE, FALSE)

## Create the variable for BMI - Gwilym
#puf_pad_grninf_clean$BMI <- 703*(puf_pad_grninf_clean$weight/(puf_pad_grninf_clean$height^2))

#puf_pad_grninf_clean$underweight <- ifelse(puf_pad_grninf_clean$BMI < "18.5", TRUE, FALSE)
#puf_pad_grninf_clean$underweight <- ifelse(is.na(puf_pad_grninf_clean$underweight), 
#                                         FALSE, puf_pad_grninf_clean$underweight)

#puf_pad_grninf_clean$overweight <- ifelse(puf_pad_grninf_clean$BMI > "25" & puf_pad_grninf_clean$BMI < "30", TRUE, FALSE)
#puf_pad_grninf_clean$overweight <- ifelse(is.na(puf_pad_grninf_clean$overweight), 
#                                           FALSE, puf_pad_grninf_clean$overweight)

#puf_pad_grninf_clean$obese <- ifelse(puf_pad_grninf_clean$BMI > "30", TRUE, FALSE)
#puf_pad_grninf_clean$obese <- ifelse(is.na(puf_pad_grninf_clean$obese), 
#                                          FALSE, puf_pad_grninf_clean$obese)

## Create variable ischemic heart disease using presence of HTN or CHF. 
## Unfortunately, both hxmi and hxangina are retired variables and missing in this dataset.  
## The pad_hrf_phys includes whether there is a recent MI, but this is a composite variable 
## and it does not distinguish whether the high risk feature is related to ischemic heart disease. - Gwilym

#puf_pad_grninf_clean$heart_dz <- ifelse(puf_pad_grninf_clean$hxchf == "TRUE" | 
#                                          puf_pad_grninf_clean$hypermed == 'TRUE', TRUE, FALSE)

## Create variable Skin_preparation.  
## The common practice in the US is to utilize alcoholic chlorhexidine, which seemed to be the majority of 
## cases in this study and there was no difference when compared with aqueous chlorhexidine, alcoholic 
## betadine or two solutions.  The only solution strongly associated with wound infection would be aqueous betadine.  
## In my practice, I only use these when there is an open wound.  Therefore, I think it would be reasonable 
## to utilize wndinf variable as a proxy for this. - Gwilym


## Create CPT groups

#source("P:/Pro00113988 - PAD Risk Models/Vasc Fem Inf/vasc_fem_inf/code/vasc_fem_inf_cpt_groups.R")

## Create variable for vein bypass material - Gwilym

#puf_pad_grninf_clean$vein <- ifelse(puf_pad_grninf_clean$cpt %in% cpt_vein, TRUE, FALSE)

## Create variable for xenograft material - most often used for patches - Gwilym

#puf_pad_grninf_clean$patch <- ifelse(puf_pad_grninf_clean$cpt %in% cpt_patch, TRUE, FALSE)

## Create variable for prosthetic material - Gwilym

#puf_pad_grninf_clean$prsth <- ifelse(puf_pad_grninf_clean$cpt %in% cpt_prsth, TRUE, FALSE)

## Create variable for aortoiliac

#puf_pad_grninf_clean$cpt_ai <- ifelse(puf_pad_grninf_clean$cpt %in% cpt_ai, TRUE, FALSE)

##Create variable for lower extremity bypass

#puf_pad_grninf_clean$cpt_le <- ifelse(puf_pad_grninf_clean$cpt %in% cpt_le, TRUE, FALSE)

##Create variable for embolectomy

#puf_pad_grninf_clean$cpt_embo <- ifelse(puf_pad_grninf_clean$cpt %in% cpt_embo, TRUE, FALSE)

## Create variable for ax-fem

#puf_pad_grninf_clean$cpt_axfem <- ifelse(puf_pad_grninf_clean$cpt %in% cpt_axfem, TRUE, FALSE)

##Create variable for fem-fem

#puf_pad_grninf_clean$cpt_femfem <- ifelse(puf_pad_grninf_clean$cpt %in% cpt_femfem, TRUE, FALSE)

## Create variable for CFEA

#puf_pad_grninf_clean$cpt_cfea <- ifelse(puf_pad_grninf_clean$cpt %in% cpt_cfea, TRUE, FALSE)

## Create variable for operative time - Gwilym
#puf_pad_grninf_clean$optime_hrs <- ((puf_pad_grninf_clean$optime)/60)

#puf_pad_grninf_clean$optime1h <- ifelse(puf_pad_grninf_clean$optime_hrs < "1", TRUE, FALSE)
#puf_pad_grninf_clean$optime1h <- ifelse(is.na(puf_pad_grninf_clean$optime1h), 
#                                           FALSE, puf_pad_grninf_clean$optime1h)

#puf_pad_grninf_clean$optime13h <- ifelse(puf_pad_grninf_clean$optime_hrs > "1" & puf_pad_grninf_clean$optime_hrs < "3", TRUE, FALSE)
#puf_pad_grninf_clean$optime13h <- ifelse(is.na(puf_pad_grninf_clean$optime13h), 
#                                          FALSE, puf_pad_grninf_clean$optime13h)
#puf_pad_grninf_clean$optime36h <- ifelse(puf_pad_grninf_clean$optime_hrs > "3" & puf_pad_grninf_clean$optime_hrs < "6", TRUE, FALSE)
#puf_pad_grninf_clean$optime36h <- ifelse(is.na(puf_pad_grninf_clean$optime36h), 
#                                         FALSE, puf_pad_grninf_clean$optime36h)
#puf_pad_grninf_clean$optime6h <- ifelse(puf_pad_grninf_clean$optime_hrs > "6", TRUE, FALSE)
#puf_pad_grninf_clean$optime6h <- ifelse(is.na(puf_pad_grninf_clean$optime6h), 
#                                         FALSE, puf_pad_grninf_clean$optime6h)

## Create variable critical limb ischemia based on PAD symptom variable in NSQIP. 
## PAD symptoms is divided into rest pain, tissue loss, asymptomatic, or claudication. 
## For critical limb ischemia, will include rest pain and tissue loss. - Leekha

#puf_pad_grninf_clean$cli <- ifelse(puf_pad_grninf_clean$pad_sympt == "Rest pain" | 
#                                     puf_pad_grninf_clean$pad_sympt == "Tissue loss", TRUE, FALSE)

#source("P:/Pro00113988 - PAD Risk Models/Vasc Fem Inf/vasc_fem_inf/code/vasc_fem_inf_icd_groups.R")

#puf_pad_grninf_clean$claudication <- ifelse(puf_pad_grninf_clean$pad_sympt == "Claudication" |
#                                              puf_pad_grninf_clean$podiag %in% icd_claudication |
#                                              puf_pad_grninf_clean$podiag10 %in% icd_claudication, TRUE, FALSE)
#puf_pad_grninf_clean$claudication <- ifelse(is.na(puf_pad_grninf_clean$claudication), 
#                                            FALSE, puf_pad_grninf_clean$claudication)

#puf_pad_grninf_clean$rest_pain <- ifelse(puf_pad_grninf_clean$pad_sympt == "Rest pain" |
#                                              puf_pad_grninf_clean$podiag %in% icd_rest_pain |
#                                              puf_pad_grninf_clean$podiag10 %in% icd_rest_pain, TRUE, FALSE)
#puf_pad_grninf_clean$rest_pain <- ifelse(is.na(puf_pad_grninf_clean$rest_pain), 
#                                            FALSE, puf_pad_grninf_clean$rest_pain)

#puf_pad_grninf_clean$tissue <- ifelse(puf_pad_grninf_clean$pad_sympt == "Tissue loss" |
#                                           puf_pad_grninf_clean$podiag %in% icd_tissue |
#                                           puf_pad_grninf_clean$podiag10 %in% icd_tissue, TRUE, FALSE)
#puf_pad_grninf_clean$tissue <- ifelse(is.na(puf_pad_grninf_clean$tissue), 
#                                         FALSE, puf_pad_grninf_clean$tissue)

#puf_pad_grninf_clean$clti <-  ifelse(puf_pad_grninf_clean$pad_sympt == "Rest pain" |
#                                       puf_pad_grninf_clean$podiag %in% icd_rest_pain |
#                                       puf_pad_grninf_clean$podiag10 %in% icd_rest_pain |
#                                       puf_pad_grninf_clean$pad_sympt == "Tissue loss" |
#                                       puf_pad_grninf_clean$podiag %in% icd_tissue |
#                                       puf_pad_grninf_clean$podiag10 %in% icd_tissue, TRUE, FALSE)
#puf_pad_grninf_clean$clti <- ifelse(is.na(puf_pad_grninf_clean$clti), 
#                                      FALSE, puf_pad_grninf_clean$clti)

## Utilize hxCOPD variable for COPD. No need to create a new variable. - Leekha

#puf_pad_grninf_clean$copd <- ifelse(puf_pad_grninf_clean$hxcopd == "TRUE", TRUE, FALSE)

## Create previous revascularization variable based on "PAD high risk features anatomic". 
## High risk features anatomic is divided into anatomic bypass, percutaneous intervention, 
## and prior abdominal surgery. Leekha et al defines prior revascularization as either a 
## prior surgical or percutaneous revascularization procedure. - Leekha

#puf_pad_grninf_clean$prrevasc <- ifelse(puf_pad_grninf_clean$pad_hrf_anat == "Prior ipsilateral bypass" | 
#                                          puf_pad_grninf_clean$pad_hrf_anat == "Prior ipsilateral percutaneous intervention" |
#                                          puf_pad_grninf_clean$podiag %in% icd_prrevasc |
#                                          puf_pad_grninf_clean$podiag10 %in% icd_prrevasc|
#                                          puf_pad_grninf_clean$cpt %in% cpt_prrevasc, TRUE, FALSE)
#puf_pad_grninf_clean$prrevasc <- ifelse(is.na(puf_pad_grninf_clean$prrevasc), 
#                                      FALSE, puf_pad_grninf_clean$prrevasc)

## For reoperative groin, will utilize the hrf_anat feature. 
## Bennett et al defined reoperative groin as "presence of previous groin incision on ipsilateral side." 
## We will use hrf_anat for previous ipsilateral bypass. - Bennett
#puf_pad_grninf_clean$reop_groin <- ifelse(puf_pad_grninf_clean$pad_hrf_anat == "Prior ipsilateral bypass"| 
#                                            puf_pad_grninf_clean$podiag %in% icd_prrevasc |
#                                            puf_pad_grninf_clean$podiag10 %in% icd_prrevasc|
#                                            puf_pad_grninf_clean$cpt %in% cpt_prrevasc, TRUE, FALSE)
#puf_pad_grninf_clean$reop_groin <- ifelse(is.na(puf_pad_grninf_clean$reop_groin), 
#                                        FALSE, puf_pad_grninf_clean$reop_groin)

## We will use dialysis variable. - Bennett
#puf_pad_grninf_clean$esrd <- ifelse(puf_pad_grninf_clean$dialysis == "TRUE", TRUE, FALSE)

## Create a variable for malnutrition that aligns with PONS (Wischmeyer 2018). We will measure this as albumin level less than 3.0, 
## weightless > 10%, or BMI < 18.5 in the previous 6mo. - Bennett
#puf_pad_grninf_clean$malnut <- ifelse(puf_pad_grninf_clean$pralbum < "3.0" | 
#                                        puf_pad_grninf_clean$wtloss == "TRUE" | 
#                                        puf_pad_grninf_clean$BMI < "18.5", TRUE, FALSE)
#puf_pad_grninf_clean$malnut <- ifelse(is.na(puf_pad_grninf_clean$malnut), 
#                                          FALSE, puf_pad_grninf_clean$malnut)

#No need to create a new variable for urgent. Will use emergncy variable. - Bennett
#puf_pad_grninf_clean$urgnt <- ifelse(puf_pad_grninf_clean$emergncy == "TRUE", TRUE, FALSE)

#Utilize optime variable and optime6h already created for Gwilym et al, but create variable for optime between 4-6hr - Wiseman
#puf_pad_grninf_clean$optime46h <- ifelse(puf_pad_grninf_clean$optime_hrs > "4" & 
#                                               puf_pad_grninf_clean$optime_hrs < "6", TRUE, FALSE) 

## Create insulin dependent diabetes variable. 
## The false value represent the patients with diabetes who are not insulin dependent. - Wiseman
#puf_pad_grninf_clean$dm_ins <- ifelse(puf_pad_grninf_clean$insulin == "TRUE", TRUE, FALSE)
#puf_pad_grninf_clean$dm_ins <- ifelse(is.na(puf_pad_grninf_clean$dm_ins), 
#                                        FALSE, puf_pad_grninf_clean$dm_ins)

#puf_pad_grninf_clean$dm_nonins <- ifelse(puf_pad_grninf_clean$insulin == "FALSE", TRUE, FALSE)
#puf_pad_grninf_clean$dm_nonins <- ifelse(is.na(puf_pad_grninf_clean$dm_nonins), 
#                                      FALSE, puf_pad_grninf_clean$dm_nonins)

#Create variable for dyspnea with moderate exertion. Can utilize the when_dyspnea variable. - Wiseman
#puf_pad_grninf_clean$dysp_mod <- ifelse(puf_pad_grninf_clean$when_dyspnea == "Moderate exertion", TRUE, FALSE)
#puf_pad_grninf_clean$dysp_mod <- ifelse(is.na(puf_pad_grninf_clean$dysp_mod), 
#                                         FALSE, puf_pad_grninf_clean$dysp_mod)

#puf_pad_grninf_clean$dysp_rest <- ifelse(puf_pad_grninf_clean$when_dyspnea == "At rest", TRUE, FALSE)
#puf_pad_grninf_clean$dysp_rest <- ifelse(is.na(puf_pad_grninf_clean$dysp_rest), 
#                                        FALSE, puf_pad_grninf_clean$dysp_rest)

#Create variables for ASA class 4 or for ASA class 5. Can utilize asaclas variable. - Wiseman
#puf_pad_grninf_clean$asa_class_45 <-ifelse(puf_pad_grninf_clean$asaclas == "4"| 
#                                             puf_pad_grninf_clean$asaclas == "5", TRUE, FALSE)

#Create variable for age greater than 65. - Wiseman
#puf_pad_grninf_clean$age1845 <- ifelse(puf_pad_grninf_clean$age > "18" & puf_pad_grninf_clean$age < "45", TRUE, FALSE)
#puf_pad_grninf_clean$age1845 <- ifelse(is.na(puf_pad_grninf_clean$age1845), 
#                                          FALSE, puf_pad_grninf_clean$age1845)

#puf_pad_grninf_clean$age4565 <- ifelse(puf_pad_grninf_clean$age > "45" & puf_pad_grninf_clean$age < "65", TRUE, FALSE)
#puf_pad_grninf_clean$age4565 <- ifelse(is.na(puf_pad_grninf_clean$age4565), 
#                                       FALSE, puf_pad_grninf_clean$age4565)

#puf_pad_grninf_clean$age65 <- ifelse(puf_pad_grninf_clean$age > "65", TRUE, FALSE)

#Create Black race variable from on race variable in NSQIP. - Wiseman
#puf_pad_grninf_clean$blkrace <- ifelse(puf_pad_grninf_clean$race == "Black", TRUE, FALSE)

#Totally dependent functional status (fnstatus2).Based on the variables listed in fnstatus1 vs fnstatus2, 
## I think we would want to use fnstatus2 - Wiseman

#Create variable for level of sepsis present at time of procedure - not in previous model
#puf_pad_grninf_clean$prsepsis_shock <- ifelse(puf_pad_grninf_clean$type_prsepis == "Septic shock", TRUE, FALSE)
#puf_pad_grninf_clean$prsepsis_shock <- ifelse(is.na(puf_pad_grninf_clean$prsepsis_shock), 
#                                         FALSE, puf_pad_grninf_clean$prsepsis_shock)

#puf_pad_grninf_clean$prsepsis_sepsis <- ifelse(puf_pad_grninf_clean$type_prsepis == "Sepsis", TRUE, FALSE)
#puf_pad_grninf_clean$prsepsis_sepsis <- ifelse(is.na(puf_pad_grninf_clean$prsepsis_sepsis), 
#                                              FALSE, puf_pad_grninf_clean$prsepsis_sepsis)

#puf_pad_grninf_clean$prsepsis_SIRS <- ifelse(puf_pad_grninf_clean$type_prsepis == "SIRS", TRUE, FALSE)
#puf_pad_grninf_clean$prsepsis_SIRS <- ifelse(is.na(puf_pad_grninf_clean$prsepsis_SIRS), 
#                                               FALSE, puf_pad_grninf_clean$prsepsis_SIRS)

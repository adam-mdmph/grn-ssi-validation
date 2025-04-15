# This script is for feature engineering for prediction of wound infections in the VQI data set based on previous publications

# Create outcome variable - grninf
vqi_pad_grninf_clean$grninf <- ifelse(vqi_pad_grninf_clean$POSTOP_SSI == "TRUE" |
                                        vqi_pad_grninf_clean$GRAFTINF == "TRUE" |
                                        vqi_pad_grninf_clean$RTORINF == "TRUE", TRUE, FALSE)

# Create variable for operative year
vqi_pad_grninf_clean$operyr_trunc <- substr(vqi_pad_grninf_clean$operyr, 1, 4)
vqi_pad_grninf_clean$operyr_trunc <- as.factor(vqi_pad_grninf_clean$operyr_trunc)

# Create female variable
vqi_pad_grninf_clean$female <- ifelse(vqi_pad_grninf_clean$GENDER == "Female", TRUE, FALSE)

## Create the variable for BMI - Gwilym
vqi_pad_grninf_clean$BMI <- vqi_pad_grninf_clean$WTKG/((vqi_pad_grninf_clean$HTCM/100)^2)

vqi_pad_grninf_clean$underweight <- ifelse(vqi_pad_grninf_clean$BMI < "18.5", TRUE, FALSE)
vqi_pad_grninf_clean$underweight <- ifelse(is.na(vqi_pad_grninf_clean$underweight), 
                                         FALSE, vqi_pad_grninf_clean$underweight)

vqi_pad_grninf_clean$overweight <- ifelse(vqi_pad_grninf_clean$BMI > "25" & vqi_pad_grninf_clean$BMI < "30", TRUE, FALSE)
vqi_pad_grninf_clean$overweight <- ifelse(is.na(vqi_pad_grninf_clean$overweight), 
                                           FALSE, vqi_pad_grninf_clean$overweight)

vqi_pad_grninf_clean$obese <- ifelse(vqi_pad_grninf_clean$BMI > "30", TRUE, FALSE)
vqi_pad_grninf_clean$obese <- ifelse(is.na(vqi_pad_grninf_clean$obese), 
                                          FALSE, vqi_pad_grninf_clean$obese)

## Create variable ischemic heart disease using multiple variables related to ischemic heart
## disease.  CAD, PRIOR_CABG, PRIOR_PCI are all related to ischemic heart disease.  We will not
## include HTN, PRIOR_CHF, and PREOP_DYSRHYTHMIA because these are heart diseases not necessarily
## related to underlying ischemic disease.

vqi_pad_grninf_clean$heart_dz <- ifelse(vqi_pad_grninf_clean$CAD == "Hx MI but no sx" | 
                                          vqi_pad_grninf_clean$CAD == "Stable angina" |
                                          vqi_pad_grninf_clean$CAD == "Unstable angina or MI < 6 mos (retired since 09/12/2012)" |
                                          vqi_pad_grninf_clean$CAD == "MI < 6 mos" |
                                          vqi_pad_grninf_clean$CAD == "Unstable angina" |
                                          vqi_pad_grninf_clean$CAD == "CAD, asymptomatic" |
                                          vqi_pad_grninf_clean$PRIOR_CABG == "<5yr ago" |
                                          vqi_pad_grninf_clean$PRIOR_CABG == ">= 5yrs ago" |
                                          vqi_pad_grninf_clean$PRIOR_PCI == "<5yr ago" |
                                          vqi_pad_grninf_clean$PRIOR_PCI == ">= 5yrs ago", TRUE, FALSE)


## Create variable Skin_preparation.  VQI includes this as a variable SKINPREP.  "Alcohol" was not mentioned
## in the Gwilym article so this was not mapped

vqi_pad_grninf_clean$prep_aq_chlo <- ifelse(vqi_pad_grninf_clean$SKINPREP == "Chlorhexidine", TRUE, FALSE)
vqi_pad_grninf_clean$prep_al_beta <- ifelse(vqi_pad_grninf_clean$SKINPREP == "Iodine + alcohol", TRUE, FALSE)
vqi_pad_grninf_clean$prep_aq_beta <- ifelse(vqi_pad_grninf_clean$SKINPREP == "Iodine", TRUE, FALSE)
vqi_pad_grninf_clean$prep_two_thr <- ifelse(vqi_pad_grninf_clean$SKINPREP == "Chlor + iodine" |
                                              vqi_pad_grninf_clean$SKINPREP == "All 3", TRUE, FALSE)

## Create variable for vein bypass material - Gwilym

vqi_pad_grninf_clean$vein <- ifelse(vqi_pad_grninf_clean$GRFTVTYPE == "Reversed GSV" |
                                      vqi_pad_grninf_clean$GRFTVTYPE == "In Situ GSV" |
                                      vqi_pad_grninf_clean$GRFTVTYPE == "Non-reversed Transposed GSV" |
                                      vqi_pad_grninf_clean$GRFTVTYPE == "Lesser Saph" |
                                      vqi_pad_grninf_clean$GRFTVTYPE == "Cephalic" |
                                      vqi_pad_grninf_clean$GRFTVTYPE == "Basilic" |
                                      vqi_pad_grninf_clean$R_GRAFTVEINTYPE == "Reversed GSV" |
                                      vqi_pad_grninf_clean$R_GRAFTVEINTYPE == "In Situ GSV" |
                                      vqi_pad_grninf_clean$R_GRAFTVEINTYPE == "Non-reversed Transposed GSV" |
                                      vqi_pad_grninf_clean$R_GRAFTVEINTYPE == "Lesser Saph" |
                                      vqi_pad_grninf_clean$R_GRAFTVEINTYPE == "Cephalic" |
                                      vqi_pad_grninf_clean$R_GRAFTVEINTYPE == "Basilic" |
                                      vqi_pad_grninf_clean$R_GRAFTVEINTYPE == "Composite Vein", TRUE, FALSE)

## Create variable for xenograft material - most often used for patches - Gwilym

vqi_pad_grninf_clean$patch <- ifelse(vqi_pad_grninf_clean$PROSTHETIC == "Non-Autologous Biologic" |
                                       vqi_pad_grninf_clean$R_PROSTHETIC == "Non-Autologous Biologic", TRUE, FALSE)

## Create variable for prosthetic material - Gwilym

summary(vqi_pad_grninf_clean$R_PROSTHETIC)

vqi_pad_grninf_clean$prsth <- ifelse(vqi_pad_grninf_clean$PROSTHETIC == "Dacron" |
                                       vqi_pad_grninf_clean$PROSTHETIC == "PTFE" |
                                       vqi_pad_grninf_clean$PROSTHETIC == "Other" |
                                       vqi_pad_grninf_clean$R_PROSTHETIC == "Dacron" |
                                       vqi_pad_grninf_clean$R_PROSTHETIC == "PTFE" |
                                       vqi_pad_grninf_clean$R_PROSTHETIC == "Composite w/ vein", TRUE, FALSE)


## Create variable for aortoiliac

vqi_pad_grninf_clean$cpt_ai <- ifelse(vqi_pad_grninf_clean$cpt %in% cpt_ai, TRUE, FALSE)

##Create variable for lower extremity bypass

vqi_pad_grninf_clean$cpt_le <- ifelse(vqi_pad_grninf_clean$cpt %in% cpt_le, TRUE, FALSE)

##Create variable for embolectomy

vqi_pad_grninf_clean$cpt_embo <- ifelse(vqi_pad_grninf_clean$cpt %in% cpt_embo, TRUE, FALSE)

## Create variable for ax-fem

vqi_pad_grninf_clean$cpt_axfem <- ifelse(vqi_pad_grninf_clean$cpt %in% cpt_axfem, TRUE, FALSE)

##Create variable for fem-fem

vqi_pad_grninf_clean$cpt_femfem <- ifelse(vqi_pad_grninf_clean$cpt %in% cpt_femfem, TRUE, FALSE)

## Create variable for CFEA

vqi_pad_grninf_clean$cpt_cfea <- ifelse(vqi_pad_grninf_clean$cpt %in% cpt_cfea, TRUE, FALSE)

## Create variable for operative time - Gwilym
vqi_pad_grninf_clean$optime_hrs <- ((vqi_pad_grninf_clean$optime)/60)

vqi_pad_grninf_clean$optime1h <- ifelse(vqi_pad_grninf_clean$optime_hrs < "1", TRUE, FALSE)
vqi_pad_grninf_clean$optime1h <- ifelse(is.na(vqi_pad_grninf_clean$optime1h), 
                                           FALSE, vqi_pad_grninf_clean$optime1h)

vqi_pad_grninf_clean$optime13h <- ifelse(vqi_pad_grninf_clean$optime_hrs > "1" & vqi_pad_grninf_clean$optime_hrs < "3", TRUE, FALSE)
vqi_pad_grninf_clean$optime13h <- ifelse(is.na(vqi_pad_grninf_clean$optime13h), 
                                          FALSE, vqi_pad_grninf_clean$optime13h)
vqi_pad_grninf_clean$optime36h <- ifelse(vqi_pad_grninf_clean$optime_hrs > "3" & vqi_pad_grninf_clean$optime_hrs < "6", TRUE, FALSE)
vqi_pad_grninf_clean$optime36h <- ifelse(is.na(vqi_pad_grninf_clean$optime36h), 
                                         FALSE, vqi_pad_grninf_clean$optime36h)
vqi_pad_grninf_clean$optime6h <- ifelse(vqi_pad_grninf_clean$optime_hrs > "6", TRUE, FALSE)
vqi_pad_grninf_clean$optime6h <- ifelse(is.na(vqi_pad_grninf_clean$optime6h), 
                                         FALSE, vqi_pad_grninf_clean$optime6h)

## Create variable critical limb ischemia based on PAD symptom variable in NSQIP. 
## PAD symptoms is divided into rest pain, tissue loss, asymptomatic, or claudication. 
## For critical limb ischemia, will include rest pain and tissue loss. - Leekha

vqi_pad_grninf_clean$cli <- ifelse(vqi_pad_grninf_clean$pad_sympt == "Rest pain" | 
                                     vqi_pad_grninf_clean$pad_sympt == "Tissue loss", TRUE, FALSE)

source("P:/Pro00113988 - PAD Risk Models/Vasc Fem Inf/vasc_fem_inf/code/vasc_fem_inf_icd_groups.R")

vqi_pad_grninf_clean$claudication <- ifelse(vqi_pad_grninf_clean$pad_sympt == "Claudication" |
                                              vqi_pad_grninf_clean$podiag %in% icd_claudication |
                                              vqi_pad_grninf_clean$podiag10 %in% icd_claudication, TRUE, FALSE)
vqi_pad_grninf_clean$claudication <- ifelse(is.na(vqi_pad_grninf_clean$claudication), 
                                            FALSE, vqi_pad_grninf_clean$claudication)

vqi_pad_grninf_clean$rest_pain <- ifelse(vqi_pad_grninf_clean$pad_sympt == "Rest pain" |
                                              vqi_pad_grninf_clean$podiag %in% icd_rest_pain |
                                              vqi_pad_grninf_clean$podiag10 %in% icd_rest_pain, TRUE, FALSE)
vqi_pad_grninf_clean$rest_pain <- ifelse(is.na(vqi_pad_grninf_clean$rest_pain), 
                                            FALSE, vqi_pad_grninf_clean$rest_pain)

vqi_pad_grninf_clean$tissue <- ifelse(vqi_pad_grninf_clean$pad_sympt == "Tissue loss" |
                                           vqi_pad_grninf_clean$podiag %in% icd_tissue |
                                           vqi_pad_grninf_clean$podiag10 %in% icd_tissue, TRUE, FALSE)
vqi_pad_grninf_clean$tissue <- ifelse(is.na(vqi_pad_grninf_clean$tissue), 
                                         FALSE, vqi_pad_grninf_clean$tissue)

vqi_pad_grninf_clean$clti <-  ifelse(vqi_pad_grninf_clean$pad_sympt == "Rest pain" |
                                       vqi_pad_grninf_clean$podiag %in% icd_rest_pain |
                                       vqi_pad_grninf_clean$podiag10 %in% icd_rest_pain |
                                       vqi_pad_grninf_clean$pad_sympt == "Tissue loss" |
                                       vqi_pad_grninf_clean$podiag %in% icd_tissue |
                                       vqi_pad_grninf_clean$podiag10 %in% icd_tissue, TRUE, FALSE)
vqi_pad_grninf_clean$clti <- ifelse(is.na(vqi_pad_grninf_clean$clti), 
                                      FALSE, vqi_pad_grninf_clean$clti)

## Utilize hxCOPD variable for COPD. No need to create a new variable. - Leekha

vqi_pad_grninf_clean$copd <- ifelse(vqi_pad_grninf_clean$hxcopd == "TRUE", TRUE, FALSE)

## Create previous revascularization variable based on "PAD high risk features anatomic". 
## High risk features anatomic is divided into anatomic bypass, percutaneous intervention, 
## and prior abdominal surgery. Leekha et al defines prior revascularization as either a 
## prior surgical or percutaneous revascularization procedure. - Leekha

vqi_pad_grninf_clean$prrevasc <- ifelse(vqi_pad_grninf_clean$pad_hrf_anat == "Prior ipsilateral bypass" | 
                                          vqi_pad_grninf_clean$pad_hrf_anat == "Prior ipsilateral percutaneous intervention" |
                                          vqi_pad_grninf_clean$podiag %in% icd_prrevasc |
                                          vqi_pad_grninf_clean$podiag10 %in% icd_prrevasc|
                                          vqi_pad_grninf_clean$cpt %in% cpt_prrevasc, TRUE, FALSE)
vqi_pad_grninf_clean$prrevasc <- ifelse(is.na(vqi_pad_grninf_clean$prrevasc), 
                                      FALSE, vqi_pad_grninf_clean$prrevasc)

## For reoperative groin, will utilize the hrf_anat feature. 
## Bennett et al defined reoperative groin as "presence of previous groin incision on ipsilateral side." 
## We will use hrf_anat for previous ipsilateral bypass. - Bennett
vqi_pad_grninf_clean$reop_groin <- ifelse(vqi_pad_grninf_clean$pad_hrf_anat == "Prior ipsilateral bypass"| 
                                            vqi_pad_grninf_clean$podiag %in% icd_prrevasc |
                                            vqi_pad_grninf_clean$podiag10 %in% icd_prrevasc|
                                            vqi_pad_grninf_clean$cpt %in% cpt_prrevasc, TRUE, FALSE)
vqi_pad_grninf_clean$reop_groin <- ifelse(is.na(vqi_pad_grninf_clean$reop_groin), 
                                        FALSE, vqi_pad_grninf_clean$reop_groin)

## We will use dialysis variable. - Bennett
vqi_pad_grninf_clean$esrd <- ifelse(vqi_pad_grninf_clean$dialysis == "TRUE", TRUE, FALSE)

## Create a variable for malnutrition. We will measure this as albumin level less than 3.5, 
## weightless > 10%, or BMI < 18.5 in the previous 6mo. - Bennett
vqi_pad_grninf_clean$malnut <- ifelse(vqi_pad_grninf_clean$pralbum < "3.5" | 
                                        vqi_pad_grninf_clean$wtloss == "TRUE" | 
                                        vqi_pad_grninf_clean$BMI < "18.5", TRUE, FALSE)
vqi_pad_grninf_clean$malnut <- ifelse(is.na(vqi_pad_grninf_clean$malnut), 
                                          FALSE, vqi_pad_grninf_clean$malnut)

#No need to create a new variable for urgent. Will use emergncy variable. - Bennett
vqi_pad_grninf_clean$urgnt <- ifelse(vqi_pad_grninf_clean$emergncy == "TRUE", TRUE, FALSE)

#Utilize optime variable and optime6h already created for Gwilym et al, but create variable for optime between 4-6hr - Wiseman
vqi_pad_grninf_clean$optime46h <- ifelse(vqi_pad_grninf_clean$optime_hrs > "4" & 
                                               vqi_pad_grninf_clean$optime_hrs < "6", TRUE, FALSE) 

## Create insulin dependent diabetes variable. 
## The false value represent the patients with diabetes who are not insulin dependent. - Wiseman
vqi_pad_grninf_clean$dm_ins <- ifelse(vqi_pad_grninf_clean$insulin == "TRUE", TRUE, FALSE)
vqi_pad_grninf_clean$dm_ins <- ifelse(is.na(vqi_pad_grninf_clean$dm_ins), 
                                        FALSE, vqi_pad_grninf_clean$dm_ins)

vqi_pad_grninf_clean$dm_nonins <- ifelse(vqi_pad_grninf_clean$insulin == "FALSE", TRUE, FALSE)
vqi_pad_grninf_clean$dm_nonins <- ifelse(is.na(vqi_pad_grninf_clean$dm_nonins), 
                                      FALSE, vqi_pad_grninf_clean$dm_nonins)

#Create variable for dyspnea with moderate exertion. Can utilize the when_dyspnea variable. - Wiseman
vqi_pad_grninf_clean$dysp_mod <- ifelse(vqi_pad_grninf_clean$when_dyspnea == "Moderate exertion", TRUE, FALSE)
vqi_pad_grninf_clean$dysp_mod <- ifelse(is.na(vqi_pad_grninf_clean$dysp_mod), 
                                         FALSE, vqi_pad_grninf_clean$dysp_mod)

vqi_pad_grninf_clean$dysp_rest <- ifelse(vqi_pad_grninf_clean$when_dyspnea == "At rest", TRUE, FALSE)
vqi_pad_grninf_clean$dysp_rest <- ifelse(is.na(vqi_pad_grninf_clean$dysp_rest), 
                                        FALSE, vqi_pad_grninf_clean$dysp_rest)

#Create variables for ASA class 4 or for ASA class 5. Can utilize asaclas variable. - Wiseman
vqi_pad_grninf_clean$asa_class_45 <-ifelse(vqi_pad_grninf_clean$asaclas == "4"| 
                                             vqi_pad_grninf_clean$asaclas == "5", TRUE, FALSE)

#Create variable for age greater than 65. - Wiseman
vqi_pad_grninf_clean$age1845 <- ifelse(vqi_pad_grninf_clean$age > "18" & vqi_pad_grninf_clean$age < "45", TRUE, FALSE)
vqi_pad_grninf_clean$age1845 <- ifelse(is.na(vqi_pad_grninf_clean$age1845), 
                                          FALSE, vqi_pad_grninf_clean$age1845)

vqi_pad_grninf_clean$age4565 <- ifelse(vqi_pad_grninf_clean$age > "45" & vqi_pad_grninf_clean$age < "65", TRUE, FALSE)
vqi_pad_grninf_clean$age4565 <- ifelse(is.na(vqi_pad_grninf_clean$age4565), 
                                       FALSE, vqi_pad_grninf_clean$age4565)

vqi_pad_grninf_clean$age65 <- ifelse(vqi_pad_grninf_clean$age > "65", TRUE, FALSE)

#Create Black race variable from on race variable in NSQIP. - Wiseman
vqi_pad_grninf_clean$blkrace <- ifelse(vqi_pad_grninf_clean$race == "Black", TRUE, FALSE)

#Totally dependent functional status (fnstatus2).Based on the variables listed in fnstatus1 vs fnstatus2, 
## I think we would want to use fnstatus2 - Wiseman
vqi_pad_grninf_clean$fnstdep <- ifelse(vqi_pad_grninf_clean$fnstatus2 == "Totally dependent", TRUE, FALSE)

#Create variable for level of sepsis present at time of procedure - not in previous model
vqi_pad_grninf_clean$prsepsis_shock <- ifelse(vqi_pad_grninf_clean$type_prsepis == "Septic shock", TRUE, FALSE)
vqi_pad_grninf_clean$prsepsis_shock <- ifelse(is.na(vqi_pad_grninf_clean$prsepsis_shock), 
                                         FALSE, vqi_pad_grninf_clean$prsepsis_shock)

vqi_pad_grninf_clean$prsepsis_sepsis <- ifelse(vqi_pad_grninf_clean$type_prsepis == "Sepsis", TRUE, FALSE)
vqi_pad_grninf_clean$prsepsis_sepsis <- ifelse(is.na(vqi_pad_grninf_clean$prsepsis_sepsis), 
                                              FALSE, vqi_pad_grninf_clean$prsepsis_sepsis)

vqi_pad_grninf_clean$prsepsis_SIRS <- ifelse(vqi_pad_grninf_clean$type_prsepis == "SIRS", TRUE, FALSE)
vqi_pad_grninf_clean$prsepsis_SIRS <- ifelse(is.na(vqi_pad_grninf_clean$prsepsis_SIRS), 
                                               FALSE, vqi_pad_grninf_clean$prsepsis_SIRS)

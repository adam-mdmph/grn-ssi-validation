

############################### Proc Data Types ################################
##Revised code from Leila Mureebe
##Listed in the order of data dictionary _20231201

numVars <- c('ADI_NATRANK_MEDIAN',
             'PROC_SURVIVALDAYS',
             'TOTAL_LOS','POSTOP_LOS',
             'HTCM','WTKG',
             'AGE',
             'PREOP_CREAT',
             'QUIT_SMKG_DAYS',
             'HEMO',
             'PREOP_ABI_R','PREOP_ABI_L','PREOP_TOEPRESSURE_R', 'PREOP_TOEPRESSURE_L',
             'PREOP_TCPO2_R', 'PREOP_TCPO2_L', 'R_PREOP_TBIR','R_PREOP_TBIL',
             'EBL','TOTALPROCTIME',
             'GRFT_ORIGIN_DIA','GRFT_RECP1_GRFT_DIA','GRFT_RECP2_GRFT_DIA',
             'DAYS_INTUBATED',
             'ICU','TXFUSION',
             'R_DC_ABI_R','R_DC_ABI_L','R_DC_TBI_R','R_DC_TBI_L'
             )

charVars <- c('PATIENTID',
              'PRIMPROCID',
              'REGIONID','CENTERID','PHYSICIANID',
              'NEGATIVE_PRESSURE_DEVICE_R','NEGATIVE_PRESSURE_DEVICE_L')

logicalVars <- c('DEAD','ETHNICITY',
                 'R_PRIOR_BYPASS',
                 'R_ANEURREP',
                 'R_PRIOR_PVI', 'R_PRIOR_CEA',
                 'PINBYPASS_R','PINBYPASS_L','PINPTASTENT_R','PINPTASTENT_L',
                 'PLEGBYPASS_R', 'PLEGBYPASS_L','PLEGPTASTENT_R','PLEGPTASTENT_L',
                 'R_PRIOR_MAJOR_AMP_R','R_PRIOR_MAJOR_AMP_L','R_PRIOR_MINOR_AMP_R','R_PRIOR_MINOR_AMP_L',
                 'PREOP_NOABI_R', 'PREOP_NOABI_L','PREOP_NOTOE_R', 'PREOP_NOTOE_L','PREOP_NOTCPO2_R', 'PREOP_NOTCPO2_L',
                 'PREOP_DUP', 'PREOP_MRA','PREOP_CTA',
                 'ARTERIO','VMAP',
                 'CHLOHEXIDINE_SHOWER',
                 'ANESTHESIA_LOCAL', 'ANESTHESIA_CONSCIOUS_SEDATION', 'ANESTHESIA_REGIONAL', 'ANESTHESIA_GENERAL',
                 'DRESSING_R_1','DRESSING_R_2','DRESSING_R_3','DRESSING_R_4',
                 'DRESSING_L_1','DRESSING_L_2','DRESSING_L_3','DRESSING_L_4',
                 'CCBYPASS_R','CCBYPASS_L',
                 'COMPLETION_DOPPLER','COMPLETION_ANGIO',
                 'INTERV_PERF_NO', 'INTERV_PERF_INFLOW_ARTERY', 'INTERV_PERF_PROX_ANASTOMOSIS', 'INTERV_PERF_BYPASS_CONDUIT',
                 'INTERV_PERF_DIS_ANASTOMOSIS', 'INTERV_PERF_OUTFLOW_ARTERY',
                 'SMOKING_CESS_RX_0', 'SMOKING_CESS_RX_1', 'SMOKING_CESS_RX_2', 'SMOKING_CESS_RX_3',
                 'POSTOP_VASO',
                 'DC_PATJUDGE_DOPLLER', 'DC_PATJUDGE_PALPABLE_GRAFT_PULSE',
                 'DC_PATJUDGE_PALPABLE_DISTAL_PULSE', 'DC_PATJUDGE_ABI_INC_GT_0_15', 'DC_PATJUDGE_DUPLEX', 'DC_PATJUDGE_OTHER',
                 'PROC_DUPLEX',
                 'POSTOP_DYSRHYTHMIA','POSTOP_CHF',
                 'GRAFTINF',
                 'RTOR','RTORBLEED','RTORTHROMB','RTORINF','RTORREV'
                 )

factorVars <- c('RUCA1','RUCA2',
                'SURGYEAR', 'SURGMONTH', 'SURGWEEKDAY',
                'GENDER',
                'PRIMARYINSURER',
                'PREOP_SMOKING', 'HX_SMOKING_COUNSELING',
                'HTN','PREOP_DIABETES', 'PRIOR_CAD','PRIOR_CABG','PRIOR_PCI','PRIOR_CHF','PRIOR_CVD',
                'PREOP_DYSRHYTHMIA','COPD','PREOP_DIALYSIS', 'R_PRIOR_CABGPTCA',
                'STRESS', 'LIVINGSTATUS','PREOP_FUNCSTATUS',
                'PREOP_AMBUL', 'ASACLASS',
                'PRIOR_CEACAS',
                'PRIOR_ANEURREP','EXERCISE_PROGRAM',
                'R_PRIOR_MAJOR_AMP',
                'PREOP_ASA','PREOP_P2Y','PREOP_STATIN','PREOP_BETABLOCKER','PREOP_ACE','C_PREOP_ANTICOAG',
                'R_INDICATIONR','R_INDICATIONL',
                'INDICATION_OCCLUSIVE_R','INDICATION_OCCLUSIVE_L','ACUTE_ISCHEMIA_R', 'ACUTE_ISCHEMIA_L',
                'TISSUE_LOSS_SEV_R', 'TISSUE_LOSS_SEV_L','INFECTION_R', 'INFECTION_L', 'R_PATH_R','R_PATH_L',
                'AMPUTATION_HX_R', 'AMPUTATION_HX_L',
                'TASC_GRADE_AORTO_ILIAC_R','TASC_GRADE_AORTO_ILIAC_L',
                'TASC_GRADE_FEM_POPLITEAL_R','TASC_GRADE_FEM_POPLITEAL_L',
                'TASC_GRADE_INFRAPOPLITEAL_R','TASC_GRADE_INFRAPOPLITEAL_L',
                'POS_COVID_STAT',
                'URGENCY','R_ANESTHESIA', 'SKINPREP',
                'INCISION_SIDE', 'GROIN_INCISION_R','GROIN_INCISION_L',
                'CLOSURE_R','CLOSURE_L',
                'GRFT_ORIGIN_ARTERY','SURGERYSIDE',
                'GRFT_RECP1_ARTERY','GRFT_RECP1_SIDE','GRFT_RECP1_GRFT_TYPE','GRFT_RECP1_ENDART',
                'GRFT_RECP2_ARTERY','GRFT_RECP2_SIDE','GRFT_RECP2_GRFT_TYPE','GRFT_RECP2_ENDART',
                'DC_STATUS','POSTOP_MORTCAUSE','RACE',
                'CCPVI_R','CCPVI_L',
                'EXTUB',
                'MYOCARDIAL_INFARCTION',
                'POSTOP_STROKE',
                'TRANSFER',
                'RESPIRATORY', 'POSTOP_RENAL', 'WCOMP',
                'LEGIEMB',
                'R_POSTOP_AMP_R', 'R_POSTOP_AMP_L', 'RTOR_AMPUTATION_R','RTOR_AMPUTATION_L',
                'DC_PAT','R_JUDGE',
                'DC_AMB',
                'R_ANTIBIOTICGEN', 'R_ANTIBIOTICSTART','R_ANTIBIOTICEND',
                'ABX','ABX_START','ABX_STOP',
                'DC_ASA','DC_STATIN','DC_P2Y','DC_BETABLOCKER','DC_ACE','C_DC_ANTICOAG','LTF_CALC'
                )

#apply data types
supra_proc[numVars] <- lapply(supra_proc[numVars], as.numeric)
supra_proc[charVars] <- lapply(supra_proc[charVars], as.character)
supra_proc[logicalVars] <- lapply(supra_proc[logicalVars], as.logical)
supra_proc[factorVars] <- lapply(supra_proc[factorVars], as.factor)

########################### Remove duplicate and retired variables ###########################
duplicate <- c('HTIN', 'WTLB',
               'AGECAT',
               'PREOP_CREAT_UMOL', 'HEMO_L')

supra_proc <- supra_proc %>%
  select(-all_of(duplicate))

retired <- c('R_ARRIVALBPM', 'R_HIGHBPM',
             'R_COVID_HISTORY', 'R_COVID_STATUS', 'R_COVID_SYMPTOMS', 'R_COVID_DELAY', 'R_COVID_DELAY_IMPACT',
             'R_COVID_VACCINATION', 'R_COVID_VACCINE_DAYS', 'R_COVID_BOOSTER', 'R_COVID_BOOSTER_DAYS'
             )

supra_proc <- supra_proc %>%
  select(-all_of(retired))

error <- c('POSTOP_PLANNED_AMP_LVL_R', # Coded as logical variable
           'POSTOP_PLANNED_AMP_LVL_L', # Coded as logical variable
           'POSTOP_UNPLANNED_AMP_LVL_R', # Coded as logical variable
           'POSTOP_UNPLANNED_AMP_LVL_L' # Coded as logical variable
           )

supra_proc <- supra_proc %>%
   select(-all_of(error))

############################# Recode Proc factors ##############################

#Demographics 
supra_proc$SURGWEEKDAY <- factor(supra_proc$SURGWEEKDAY, labels = c("Sunday", "Monday", "Tuesday", "Wednesday", "Thursday", "Friday", "Saturday"))

supra_proc$GENDER <- factor(supra_proc$GENDER, labels = c("Male", "Female", "Other"))

supra_proc$RACE <- factor(supra_proc$RACE, labels = c("American Indian or Alaskan Native","Asian","Black or African American",
                                                      "Native Hawaiian or other Pacific Islander","White","More than 1 race","Unknown / Other"))

supra_proc$PRIMARYINSURER <- factor(supra_proc$PRIMARYINSURER, labels = c("Medicare", "Medicaid", "Commercial", "Military.VA", "Non US insurance", "Self pay", "Medicare Advantage"))
                                                                          
supra_proc$LIVINGSTATUS <- factor(supra_proc$LIVINGSTATUS, labels = c("Home", "Nursing home", "Homeless"))

#Comorbidities 

supra_proc$PREOP_SMOKING <- factor(supra_proc$PREOP_SMOKING, labels = c("Never", "Prior", "Current"))

infra_proc$HX_SMOKING_COUNSELING <- factor(infra_proc$HX_SMOKING_COUNSELING, labels = c("No", "Yes, Physician/Healthcare Provider Counseling",
                                                                                        "Yes, Professional Referral", "Yes, NRT",
                                                                                        "Yes, Varenicline/Chantix", "Yes, Buproprion/Wellbutrin",
                                                                                        "Unknown"))

supra_proc$HTN <- factor(supra_proc$HTN, labels = c("No", "Yes (>=140/90 or history - retired since 11/15/2016)", "Yes, controlled [added on 04/13/2020]", "Yes, uncontrolled [added on 04/13/2020]"))

supra_proc$PREOP_DIABETES <- factor(supra_proc$PREOP_DIABETES, labels = c("None", "Diet", "Non-insulin meds", "Insulin"))

supra_proc$PRIOR_CAD <- factor(supra_proc$PRIOR_CAD, labels = c("None", "Hx MI but no sx", "Stable angina", 
                                                                           "Unstable angina or MI < 6 mos (retired since 09/12/2012)",
                                                                           "MI < 6 mos", "Unstable angina", "CAD, asymptomatic"))

supra_proc$PRIOR_CABG <- factor(supra_proc$PRIOR_CABG, labels = c("None", "<5yr ago", ">= 5yrs ago"))

supra_proc$PRIOR_PCI <- factor(supra_proc$PRIOR_PCI, labels = c("None", "<5yr ago", ">= 5yrs ago"))

supra_proc$R_PRIOR_CABGPTCA <- factor(supra_proc$R_PRIOR_CABGPTCA, labels = c("None", "<5yr ago", ">= 5yrs ago"))


supra_proc$PRIOR_CHF <- factor(supra_proc$PRIOR_CHF, labels = c("None", "Asymptomatic, hx only", "Mild" ,"Moderate", "Severe"))

supra_proc$PRIOR_CVD <- factor(supra_proc$PRIOR_CVD, labels = c("None", "Hx stroke, asymptomatic", "Hx stroke, minor deficit" ,"Hx stroke, major deficit"))

supra_proc$PREOP_DYSRHYTHMIA <- factor(supra_proc$PREOP_DYSRHYTHMIA, labels = c("No", "Yes, ventricular", "A-V block w pacemaker", "Yes, with ICD",
                                                                                "Yes, atrial", "Other"))
supra_proc$COPD <- factor(supra_proc$COPD, labels = c("No", "Not treated", "On meds", "On home oxygen"))

supra_proc$PREOP_DIALYSIS <- factor(supra_proc$PREOP_DIALYSIS, labels = c("No", "Functioning transplant", "On dialysis"))

supra_proc$STRESS <- factor(supra_proc$STRESS, labels = c("Not done", "Normal", "Ischemia", "Infarction", "Both"))

supra_proc$PREOP_FUNCSTATUS <- factor(supra_proc$PREOP_FUNCSTATUS, labels = c("Full", "Light work", "Self care", "Assisted care", "Bed bound"))

supra_proc$PREOP_AMBUL <- factor(supra_proc$PREOP_AMBUL, labels = c("Ambulates",
                                                                    "Ambulates w/ assistance or prosthesis", #retired since 10/31/2022
                                                                    "Wheelchair", "Bedridden", #retired since 10/31/2022
                                                                    "Ambulates w/ prosthesi", "Ambulates w/ assistance"))

supra_proc$DC_AMB <- factor(supra_proc$DC_AMB, labels = c("Amb", "Amb w/ assistance or prosthesis (retired since 10/31/2022)", "Wheelchair", "Bedridden (retired since 10/31/2022)", "Amb w/ prosthesis", "Amb w/ assistance"))

supra_proc$ASACLASS <- factor(supra_proc$ASACLASS, labels = c("1", "2", "3", "4", "5"))

supra_proc$PRIOR_CEACAS <- factor(supra_proc$PRIOR_CEACAS, labels = c("No", "Yes", #retired since 03/29/2023
                                                                      "CEA", "CAS", "Both"))

supra_proc$PRIOR_ANEURREP <- factor(supra_proc$PRIOR_ANEURREP, labels = c("None", "Aortic", "Other", "Both"))

supra_proc$EXERCISE_PROGRAM <- factor(supra_proc$EXERCISE_PROGRAM, labels = c("No", "Yes, unsupervised exercise",
                                                                              "Yes, supervised exercise"))
supra_proc$R_PRIOR_MAJOR_AMP <- factor(supra_proc$R_PRIOR_MAJOR_AMP, labels = c("No", 
                                                                                "Yes", #retired since 09/12/2012
                                                                                "BK/thru knee", "AK or higher"))

#Medications
supra_proc$PREOP_ASA <- factor(supra_proc$PREOP_ASA, labels = c("No", "Yes", "No, for medical reason", "Non-compliant"))

supra_proc$PREOP_P2Y <- factor(supra_proc$PREOP_P2Y, labels = c("None", "Clopidogrel", "Prasugrel", "Ticlopidine", #retired since 10/31/2022
                                                                "Ticagrelor", "Other", "No, for medical reason", "Non-compliant"))

supra_proc$PREOP_STATIN <- factor(supra_proc$PREOP_STATIN, labels = c("No", "Yes","No, for medical reason","Non-compliant"))

supra_proc$PREOP_BETABLOCKER <- factor(supra_proc$PREOP_BETABLOCKER, labels = c("No","Pre-op 1-30 days","Chronic > 30 days","No, for medical reason","Op day only","Non-compliant"))

supra_proc$PREOP_ACE <- factor(supra_proc$PREOP_ACE, labels = c("No","Yes","No, for medical reason","Non-compliant"))

supra_proc$C_PREOP_ANTICOAG <- factor(supra_proc$C_PREOP_ANTICOAG, labels = c("None","Warfarin","Dabigatran","Other","No, for medical reason","Non-compliant"))

#Procedure
supra_proc$R_INDICATIONR <- factor(supra_proc$R_INDICATIONR, labels = c("Asymptomatic","Claudication","Rest Pain","Tissue Loss","Acute Ischemia","Not Treated"))

supra_proc$R_INDICATIONL <- factor(supra_proc$R_INDICATIONL, labels = c("Asymptomatic","Claudication","Rest Pain","Tissue Loss","Acute Ischemia","Not Treated"))

supra_proc$INDICATION_OCCLUSIVE_R <- factor(supra_proc$INDICATION_OCCLUSIVE_R, labels = c("Asymptomatic","Mild Claudication","Moderate Claudication","Severe Claudication","Rest Pain","Ulcer/necrosis", "Non-healing amputation", "Both ulcer and non-healing amp", "Acute Ischemia"))

supra_proc$INDICATION_OCCLUSIVE_L <- factor(supra_proc$INDICATION_OCCLUSIVE_L, labels = c("Asymptomatic","Mild Claudication","Moderate Claudication","Severe Claudication","Rest Pain","Ulcer/necrosis", "Non-healing amputation", "Both ulcer and non-healing amp", "Acute Ischemia"))

supra_proc$ACUTE_ISCHEMIA_R <- factor(supra_proc$ACUTE_ISCHEMIA_R, labels = c("Viable","Marginally threatened","Immediately threatened","Irreversible (nonviable)"))

supra_proc$ACUTE_ISCHEMIA_L <- factor(supra_proc$ACUTE_ISCHEMIA_L, labels = c("Viable","Marginally threatened","Immediately threatened","Irreversible (nonviable)"))

supra_proc$TISSUE_LOSS_SEV_R <- factor(supra_proc$TISSUE_LOSS_SEV_R, labels = c("Grade 1, shallow", "Grade 2, deep", "Grade 3, extensive"))

supra_proc$TISSUE_LOSS_SEV_L <- factor(supra_proc$TISSUE_LOSS_SEV_L, labels = c("Grade 1, shallow", "Grade 2, deep", "Grade 3, extensive"))

supra_proc$INFECTION_R <- factor(supra_proc$INFECTION_R, labels = c("Grade 0, none", "Grade 1, mild", "Grade 2, moderate" , "Grade 3, severe"))

supra_proc$INFECTION_L <- factor(supra_proc$INFECTION_L, labels = c("Grade 0, none", "Grade 1, mild", "Grade 2, moderate" , "Grade 3, severe"))

supra_proc$R_PATH_R <- factor(supra_proc$R_PATH_R, labels = c("None", "Occlusive", "Aneurysm"))

supra_proc$R_PATH_L <- factor(supra_proc$R_PATH_L, labels = c("None", "Occlusive", "Aneurysm"))

supra_proc$AMPUTATION_HX_R <- factor(supra_proc$AMPUTATION_HX_R, labels = c("No" , "Toe(s)" , "Transmet or midfoot", "BK or thru knee" , "AK or higher" , "Partial or Full calcanectomy" ))

supra_proc$AMPUTATION_HX_L <- factor(supra_proc$AMPUTATION_HX_L, labels = c("No" , "Toe(s)" , "Transmet or midfoot", "BK or thru knee" , "AK or higher" , "Partial or Full calcanectomy" ))

supra_proc$TASC_GRADE_AORTO_ILIAC_R <- factor(supra_proc$TASC_GRADE_AORTO_ILIAC_R, labels = c("None" , "A" , "B", "C" , "D" , "Protect Adjacent Artery"))

supra_proc$TASC_GRADE_AORTO_ILIAC_L <- factor(supra_proc$TASC_GRADE_AORTO_ILIAC_L, labels = c("None" , "A" , "B", "C" , "D" , "Protect Adjacent Artery"))

supra_proc$TASC_GRADE_FEM_POPLITEAL_R <- factor(supra_proc$TASC_GRADE_FEM_POPLITEAL_R, labels = c("None" , "A" , "B", "C" , "D" , "Protect Adjacent Artery"))

supra_proc$TASC_GRADE_FEM_POPLITEAL_L <- factor(supra_proc$TASC_GRADE_FEM_POPLITEAL_L, labels = c("None" , "A" , "B", "C" , "D" , "Protect Adjacent Artery"))

supra_proc$TASC_GRADE_INFRAPOPLITEAL_R <- factor(supra_proc$TASC_GRADE_INFRAPOPLITEAL_R, labels = c("None" , "A" , "B", "C" , "D" , "Protect Adjacent Artery"))

supra_proc$TASC_GRADE_INFRAPOPLITEAL_L <- factor(supra_proc$TASC_GRADE_INFRAPOPLITEAL_L, labels = c("None" , "A" , "B", "C" , "D" , "Protect Adjacent Artery"))

supra_proc$URGENCY <- factor(supra_proc$URGENCY, labels = c("Elective","Urgent","Emergent"))

supra_proc$R_ANESTHESIA <- factor(supra_proc$R_ANESTHESIA, labels = c("Spinal", "Epidural", "General"))

supra_proc$SKINPREP <- factor(supra_proc$SKINPREP, labels = c("Chlorhexidine", "Alcohol", "Iodine", "Chlor + iodine", "Chlor + alcohol", "Iodine + alcohol", "All 3"))

supra_proc$INCISION_SIDE <- factor(supra_proc$INCISION_SIDE, labels = c("None", "Right", "Left", "Bilateral"))

supra_proc$GROIN_INCISION_R <- factor(supra_proc$GROIN_INCISION_R, labels = c("None (retired since 04/09/2020)", "Vertical", "Horizontal"))

supra_proc$GROIN_INCISION_L <- factor(supra_proc$GROIN_INCISION_L, labels = c("None (retired since 04/09/2020)", "Vertical", "Horizontal"))

supra_proc$CLOSURE_R <- factor(supra_proc$CLOSURE_R, labels = c("Absorbable subcuticular", "Staples", "Removable interrupted", "Removable continuous", "Open with VAC", "Open with packing"))

supra_proc$CLOSURE_L <- factor(supra_proc$CLOSURE_L, labels = c("Absorbable subcuticular", "Staples", "Removable interrupted", "Removable continuous", "Open with VAC", "Open with packing"))

supra_proc$GRFT_ORIGIN_ARTERY <- factor(supra_proc$GRFT_ORIGIN_ARTERY, labels = c("Axillary", "Thoracic Aorta", "Abdominal Aorta, end-side", "Abdominal Aorta, end-end", "Com iliac", "Ext iliac", "Com Fem", "Profunda", "SFA"))

supra_proc$SURGERYSIDE <- factor(supra_proc$SURGERYSIDE, labels = c("Right", "Left"))

supra_proc$GRFT_RECP1_ARTERY <- factor(supra_proc$GRFT_RECP1_ARTERY, labels = c("Com iliac", "Ext iliac", "Com Fem", "Profunda", "SFA", "AK Pop", "BK Pop", "Tibial/pedal"))

supra_proc$GRFT_RECP1_SIDE <- factor(supra_proc$GRFT_RECP1_SIDE, labels = c("Right", "Left"))

supra_proc$GRFT_RECP1_GRFT_TYPE <- factor(supra_proc$GRFT_RECP1_GRFT_TYPE, labels = c("Dacron", "PTFE", "Non-autologous Biologic", "Saphenous Vein", "Deep Vein", "Composite Prosthetic-vein", "Spliced Vein"))

supra_proc$GRFT_RECP1_ENDART <- factor(supra_proc$GRFT_RECP1_ENDART, labels = c("None", "Yes", #retired since 10/31/2022
                                                                                "Inflow", "Outflow", "Both"))

supra_proc$GRFT_RECP2_ARTERY <- factor(supra_proc$GRFT_RECP2_ARTERY, labels = c("None", "Com iliac", "Ext iliac", "Com Fem", "Profunda", "SFA", "AK Pop", "BK Pop", "Tibial/pedal"))

supra_proc$GRFT_RECP2_SIDE <- factor(supra_proc$GRFT_RECP2_SIDE, labels = c("Right", "Left"))

supra_proc$GRFT_RECP2_GRFT_TYPE <- factor(supra_proc$GRFT_RECP2_GRFT_TYPE, labels = c("Dacron", "PTFE", "Non-autologous Biologic", "Saphenous Vein", "Deep Vein", "Composite Prosthetic-vein", "Spliced Vein"))

supra_proc$GRFT_RECP2_ENDART <- factor(supra_proc$GRFT_RECP2_ENDART, labels = c("None", "Yes", #retired since 10/31/2022) 
                                                                                "Inflow", "Outflow", "Both"))

supra_proc$DC_STATUS <- factor(supra_proc$DC_STATUS, labels = c("Home", "Rehab unit", "Nursing home", "Other hospital", "Homeless", "Dead"))

supra_proc$POSTOP_MORTCAUSE <- factor(supra_proc$POSTOP_MORTCAUSE, labels = c("Related to disease or treatment", "Unrelated to disease or treatment", "Unsure"))

supra_proc$CCPVI_R <- factor(supra_proc$CCPVI_R, labels = c("No", "Yes", #retired since 11/13/2022)
                                                            "Yes, Inflow", "Yes, Outflow", "Both"))

supra_proc$CCPVI_L <- factor(supra_proc$CCPVI_L, labels = c("No", "Yes", #retired since 11/13/2022)
                                                            "Yes, Inflow", "Yes, Outflow", "Both"))

supra_proc$EXTUB <- factor(supra_proc$EXTUB, labels = c("In OR", "<12 hrs", "12-24 hrs", ">24 hrs"))


#PostOp Outcomes
supra_proc$MYOCARDIAL_INFARCTION <- factor(supra_proc$MYOCARDIAL_INFARCTION, labels = c("No", "Troponin only", "EKG or clinical"))

supra_proc$POSTOP_STROKE <- factor(supra_proc$POSTOP_STROKE, labels = c("None", "Minor", "Major"))

supra_proc$TRANSFER <- factor(supra_proc$TRANSFER, labels = c("No", "Hospital", "Rehab unit"))

supra_proc$RESPIRATORY <- factor(supra_proc$RESPIRATORY, labels = c("No", "Pneumonia", "Re-intubation", "Both"))

supra_proc$POSTOP_RENAL <- factor(supra_proc$POSTOP_RENAL, labels = c("None", "Creat. Increase > 0.5 mg/dl (44.2 umol/L)", "Temp. Dialysis", "Perm. Dialysis", "Yes (retired since 10/14/2010)"))

supra_proc$WCOMP <- factor(supra_proc$WCOMP, labels = c("No", "Superficial Separation / Infection", "Return to OR"))

supra_proc$LEGIEMB <- factor(supra_proc$LEGIEMB, labels = c("No", "Yes, rx w/o Surgery", "Required Surgery", "Amputation"))

supra_proc$R_POSTOP_AMP_R <- factor(supra_proc$R_POSTOP_AMP_R, labels = c("No", "Minor Amp", "BK Amp", "AK Amp"))

supra_proc$R_POSTOP_AMP_L <- factor(supra_proc$R_POSTOP_AMP_L, labels = c("No", "Minor Amp", "BK Amp", "AK Amp"))

supra_proc$RTOR_AMPUTATION_R <- factor(supra_proc$RTOR_AMPUTATION_R, labels = c("None", "Planned", "Unplanned"))

supra_proc$RTOR_AMPUTATION_L <- factor(supra_proc$RTOR_AMPUTATION_L, labels = c("None", "Planned", "Unplanned"))

supra_proc$DC_PAT <- factor(supra_proc$DC_PAT, labels = c("Occluded", "Patent", "Not Assessed"))

supra_proc$R_JUDGE <- factor(supra_proc$R_JUDGE, labels = c("Doppler Only", "Palpable Graft Pulse", "Palpable Distal Pulse", "ABI Increase > 0.15", "Duplex"))

supra_proc$R_ANTIBIOTICGEN <- factor(supra_proc$R_ANTIBIOTICGEN, labels = c("No", "Yes", "No, for medical reason"))

supra_proc$R_ANTIBIOTICSTART <- factor(supra_proc$R_ANTIBIOTICSTART, labels = c("No", "Yes", "No, for medical reason"))

supra_proc$R_ANTIBIOTICEND <- factor(supra_proc$R_ANTIBIOTICEND, labels = c("No", "Yes", "No, for medical reason"))

supra_proc$ABX <- factor(supra_proc$ABX, labels = c("No", "Yes", "No, for medical reason"))

supra_proc$ABX_START <- factor(supra_proc$ABX_START, labels = c("No", "Yes", "No, for medical reason"))

supra_proc$ABX_STOP <- factor(supra_proc$ABX_STOP, labels = c("No", "Yes", "No, for medical reason"))


#Covid-Related Conditions - most retired, so removed from data set
supra_proc$POS_COVID_STAT <- factor(supra_proc$POS_COVID_STAT, labels = c("No","Yes","Unknown"))

# supra_proc$R_COVID_STATUS <- factor(supra_proc$R_COVID_STATUS, labels = c("Unknown, not tested", "1 = Tested negative pre-op" , "Tested positive pre-op" , "Tested negative pre-op but positive post-op"))

# supra_proc$R_COVID_SYMPTOMS <- factor(supra_proc$R_COVID_SYMPTOMS, labels = c("Asymptomatic", "Symptomatic, not intubated" , "Symptomatic, intubated"))

# supra_proc$R_COVID_DELAY <- factor(supra_proc$R_COVID_DELAY, labels = c("None", "Delayed < 2 weeks" , "Delayed 2-6 weeks", "Delayed > 6 weeks", "Uncertain"))

# supra_proc$R_COVID_DELAY_IMPACT <- factor(supra_proc$R_COVID_STATUS, labels = c("No, impact in tx due to delay", "Yes, impact of tx due to delay" , "Indeterminate"))

# supra_proc$R_COVID_VACCINATION <- factor(supra_proc$R_COVID_VACCINATION, labels = c("Yes", "In process", "No", "Refused", "Not eligible", "Not available"))

# supra_proc$R_COVID_BOOSTER <- factor(supra_proc$R_COVID_BOOSTER, labels = c("Yes", "In process", "No", "Refused", "Not eligible", "Not available"))

#Discharge medications

supra_proc$DC_ASA <- factor(supra_proc$DC_ASA, labels = c("No", "Yes", "No, for medical reason", "Non-compliant (retired since 12/15/2014)"))

supra_proc$DC_STATIN <- factor(supra_proc$DC_STATIN, labels = c("No", "Yes", "No, for medical reason", "Non-compliant (retired since 12/15/2014)"))

supra_proc$DC_P2Y <- factor(supra_proc$DC_P2Y, labels = c("None", "Clopidogrel", "Prasugrel", "Ticlopidine (retired since 11/23/2022)", "Ticagrelor", "Other P2Y12 Inhibitor","No, for medical reason" , "Non-compliant (retired since 12/15/2014)"))

supra_proc$DC_BETABLOCKER <- factor(supra_proc$DC_BETABLOCKER, labels = c("No", "Yes", "No, for medical reason", "Non-compliant (retired since 12/15/2014)"))

supra_proc$C_DC_ANTICOAG <- factor(supra_proc$C_DC_ANTICOAG, labels = c("None", "Warfarin", "Dabigatran", "Other" , "No, for medical reason" , "Non-compliant"))

supra_proc$LTF_CALC <- factor(supra_proc$LTF_CALC, labels = c("No", "Yes", "Exclude"))

## Remove outliers from numeric data

# Exclude outliers based the on the world's shortest (65cm) and tallest (272cm) people.

supra_proc$HTCM[supra_proc$HTCM < 75] <- NA
supra_proc$HTCM[supra_proc$HTCM > 250] <- NA

# Exclude outliers based on the world's thinnest (2kg) and fattest (635 kg) people.

supra_proc$WTKG[supra_proc$WTKG < 30] <- NA
supra_proc$WTKG[supra_proc$WTKG > 250] <- NA

##########Change variable names to align with infra_proc##################
supra_proc <- supra_proc %>% rename(
  DIABETES=PREOP_DIABETES,
  CAD=PRIOR_CAD,
  DIALYSIS=PREOP_DIALYSIS,
  CREATININE=PREOP_CREAT,
  R_PTASTENT=R_PRIOR_PVI,
  R_PTASTENT=R_PRIOR_PVI,
  R_PRIOR_MAJAMP=R_PRIOR_MAJOR_AMP,
  PATHR=R_PATH_R,
  PATHL=R_PATH_L,
  PINBYPASSR=PINBYPASS_R,
  PINBYPASSL=PINBYPASS_L,
  PINPTASTENTR=PINPTASTENT_R,
  PINPTASTENTL=PINPTASTENT_L,
  PLEGBYPASSR=PLEGBYPASS_R,
  PLEGBYPASSL=PLEGBYPASS_L,
  PLEGPTASTENTR=PLEGPTASTENT_R,
  PLEGPTASTENTL=PLEGPTASTENT_L,
  R_PMAJAMPR=R_PRIOR_MAJOR_AMP_R,
  R_PMAJAMPL=R_PRIOR_MAJOR_AMP_L,
  R_PMINAMPR=R_PRIOR_MINOR_AMP_R,
  R_PMINAMPL=R_PRIOR_MINOR_AMP_L,
  PREOP_DUPLEX=PREOP_DUP,
  DOPPLER=COMPLETION_DOPPLER,
  ANGIOGRAM=COMPLETION_ANGIO,
  DC_PATJUDGE_DOPPLER=DC_PATJUDGE_DOPLLER,
  NEWMI=MYOCARDIAL_INFARCTION,
  POSTOP_DUPLEX=PROC_DUPLEX,
  STROKE=POSTOP_STROKE,
  CHGRENAL=POSTOP_RENAL,
  DC_AMBUL=DC_AMB,
  PREOP_ABIR=PREOP_ABI_R,
  PREOP_ABIL=PREOP_ABI_L
)

#Remove objects

rm(list = c("charVars", "duplicate", "error", "factorVars", "logicalVars", "numVars", "retired"))

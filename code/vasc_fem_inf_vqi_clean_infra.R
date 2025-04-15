

############################### Proc Data Types ################################
##Revised code from Leila Mureebe

numVars <- c('PROC_SURVIVALDAYS','ADI_NATRANK_MEDIAN',
             'TOTAL_LOS','POSTOP_LOS',
             'HTCM','WTKG',
             'AGE',
             'DAYS_INTUBATED',
             'QUIT_SMKG_DAYS',
             'HBA1C',
             'CREATININE',
             'HEMO',
             'EBL',
             'PREOP_ABIR','PREOP_ABIL','PREOP_TOEPRESSURE_R', 'PREOP_TOEPRESSURE_L', 
             'PREOP_TCPO2_R', 'PREOP_TCPO2_L', 'R_PREOP_TBIR','R_PREOP_TBIL',
             'TOTALPROCTIME',
             'PRBC',
             'R_DC_ABIR','R_DC_ABIL','R_DC_TBIR','R_DC_TBIL')

charVars <- c('PRIMPROCID','REGIONID','CENTERID','PHYSICIANID','PATIENTID',
              'NEGATIVE_PRESSURE_DEVICE')

logicalVars <- c('DEAD','ETHNICITY',
                 'R_PRIOR_BYPASS',
                 'R_ANEURREP','R_PTASTENT', 'R_PRIOR_CEA',
                 'PREOP_DUPLEX', 'PREOP_MRA','PREOP_CTA',
                 'PINBYPASSR','PINBYPASSL','PINPTASTENTR','PINPTASTENTL',
                 'PLEGBYPASSR', 'PLEGBYPASSL','PLEGPTASTENTR','PLEGPTASTENTL',
                 'R_PMAJAMPR','R_PMAJAMPL','R_PMINAMPR','R_PMINAMPL',
                 'PREOP_NOTOE_R', 'PREOP_NOTOE_L',
                 'PREOP_NOTCPO2_R', 'PREOP_NOTCPO2_L',
                 'ARTERIO','VMAP',
                 'ANESTHESIA_LOCAL', 'ANESTHESIA_CONSCIOUS_SEDATION', 'ANESTHESIA_REGIONAL', 'ANESTHESIA_GENERAL',
                 'CHLOHEXIDINE_SHOWER',
                 'DRESSING_1','DRESSING_2','DRESSING_3','DRESSING_4', # 1 = Cyanoacrylate adhesive, 2 = Gauze under tape, 3 = Gauze under waterproof film, 4 = Negative pressure dressing
                 'R_VEINCUFF','SEQGRAFT',
                 'R_CCPVI', 'R_CCENDAR',
                 'CCBYPASS','DOPPLER','POSTOP_DUPLEX','ANGIOGRAM',
                 'INTERV_PERF_NO', 'INTERV_PERF_INFLOW_ARTERY', 'INTERV_PERF_PROX_ANASTOMOSIS', 'INTERV_PERF_BYPASS_CONDUIT',
                 'INTERV_PERF_DIS_ANASTOMOSIS', 'INTERV_PERF_OUTFLOW_ARTERY',
                 'SMOKING_CESS_RX_0', 'SMOKING_CESS_RX_1', 'SMOKING_CESS_RX_2', 'SMOKING_CESS_RX_3',
                 'POSTOP_SSI','GRAFTINF',
                 'POSTOP_DYSRHYTHMIA','POSTOP_CHF',
                 'DC_PATJUDGE_DOPPLER', 'DC_PATJUDGE_PALPABLE_GRAFT_PULSE',
                 'DC_PATJUDGE_PALPABLE_DISTAL_PULSE', 'DC_PATJUDGE_ABI_INC_GT_0_15', 'DC_PATJUDGE_DUPLEX', 'DC_PATJUDGE_OTHER',
                 'RTOR','RTORBLEED','RTORTHROMB','RTORINF','RTORREV',
                 'RTNOR_PLANNED_IPS_AMP', 'RTNOR_UNPLANNED_IPS_AMP')

factorVars <- c('RUCA1','RUCA2',
                'SURGYEAR', 'SURGMONTH', 'SURGWEEKDAY',
                'GENDER','RACE',
                'PRIMARYINSURER',
                'DC_STATUS', 'POSTOP_MORTCAUSE', 'TIMETOEXTUB',
                'TRANSFER', 'PRIOR_CVD', 'PREOP_SMOKING', 'HX_SMOKING_COUNSELING',
                'HTN','DIABETES',
                'PRIOR_CEACAS', 'PRIOR_ANEURREP','EXERCISE_PROGRAM', 'R_PRIOR_MAJAMP',
                'CAD','PRIOR_CABG','PRIOR_PCI','R_PRIOR_CABGPTA','PRIOR_CHF', 'PREOP_DYSRHYTHMIA',
                'COPD','DIALYSIS',
                'STRESS', 'LIVINGSTATUS', 'PREOP_FUNCSTATUS', 'PREOP_AMBUL', 'ASACLASS',
                'PREOP_ASA','PREOP_P2Y','PREOP_STATIN','PREOP_BETABLOCKER','PREOP_ACE',
                'POS_COVID_STAT', 'SIDE',
                'C_PREOP_ANTICOAG','R_INDICATIONR','R_INDICATIONL',
                'INDICATION_OCCLUSIVE_R', 'INDICATION_OCCLUSIVE_L', 'INDICATION_ANEURYSM_R', 'INDICATION_ANEURYSM_L',
                'ACUTE_ISCHEMIA_R', 'ACUTE_ISCHEMIA_L', 'TISSUE_LOSS_SEV_R', 'TISSUE_LOSS_SEV_L',
                'INFECTION_R', 'INFECTION_L', 'PATHR','PATHL',
                'AMPUTATION_HX_R', 'AMPUTATION_HX_L',
                'GLASS_REGION_FEMOROPOPLITEAL', 'GLASS_REGION_INFRAPOPLITEAL',
                'URGENCY','R_ANESTHESIA', 'SKINPREP',
                'GRAFTORIG','GRAFTRECIP', 'BYPASS_GRAFT_TYPE', 'GRFTVTYPE', 'VEINSEG', 'PROSTHETIC',
                'R_GRAFTVEINTYPE','R_VEINSEGS','R_PROSTHETIC',
                'GROIN_INCISION','CLOSURE',
                'R_VEIN_HARVEST_INCISION','R_VEIN_GRAFT_LOCATION',
                'VEIN_HARVEST_INCISION', 'VEIN_GRAFT_LOCATION',
                'CC_IPS_PVI', 'CC_IPS_ENDAR',
                'NEWMI',
                'RESPIRATORY', 'CHGRENAL','STROKE',
                'R_AMPIPS',
                'DC_PAT','R_DC_PATJUDGE',
                'POSTOP_PLANNED_IPS_AMP_LVL', # 'POSTOP_UNPLANNED_IPS_AMP_LVL',
                'DC_AMBUL',
                'R_ANTIBIOTICGEN', 'R_ANTIBIOTICSTART','R_ANTIBIOTICEND',
                'ABX','ABX_START','ABX_STOP',
                'DC_ASA','DC_STATIN','DC_P2Y','DC_BETABLOCKER','DC_ACE','C_DC_ANTICOAG','LTF_CALC')

#apply data types
infra_proc[numVars] <- lapply(infra_proc[numVars], as.numeric)
infra_proc[charVars] <- lapply(infra_proc[charVars], as.character)
infra_proc[logicalVars] <- lapply(infra_proc[logicalVars], as.logical)
infra_proc[factorVars] <- lapply(infra_proc[factorVars], as.factor)

########################### Remove duplicate and retired variables ###########################
duplicate <- c('AGECAT',
               'HTIN', 'WTLB',
               'CREATININE_MOL', 'HEMO_L')

infra_proc <- infra_proc %>%
  select(-all_of(duplicate))


summary(infra_proc$R_PRIOR_CEA)

retired <- c('R_ARRIVALBPM','R_HIGHBPM',
             'R_COVID_HISTORY', 'R_COVID_STATUS', 'R_COVID_SYMPTOMS', 'R_COVID_DELAY', 'R_COVID_DELAY_IMPACT',
             'R_COVID_VACCINATION', 'R_COVID_VACCINE_DAYS', 'R_COVID_BOOSTER', 'R_COVID_BOOSTER_DAYS',
             'R_ARRIVALBPM', 'R_HIGHBPM')

#NEED TO ADD PRIOR CEA, CABGPTA, and ANTIBIOTICSTART/END variables back into data set

infra_proc <- infra_proc %>%
  select(-all_of(retired))

error <- c('POSTOP_UNPLANNED_IPS_AMP_LVL', # Coded as logical variable
           'BYPASS_GRAFT_TYPE')  # Not included in the data dictionary

infra_proc <- infra_proc %>%
  select(-all_of(error))

############################# Recode Proc factors ##############################-----

##Demographics----

infra_proc$SURGWEEKDAY <- factor(infra_proc$SURGWEEKDAY, labels = c("Sunday", "Monday", "Tuesday", "Wednesday", "Thursday", "Friday", "Saturday"))

infra_proc$GENDER <- factor(infra_proc$GENDER, labels = c("Male", "Female", "Other"))

infra_proc$RACE <- factor(infra_proc$RACE, labels = c("American Indian or Alaskan Native","Asian","Black or African American",
                                                      "Native Hawaiian or other Pacific Islander","White","More than 1 race","Unknown / Other"))

infra_proc$PRIMARYINSURER <- factor(infra_proc$PRIMARYINSURER, labels = c("Medicare", "Medicaid", "Commercial", "Military/VA", 
                                                                          "Non US insurance", "Self pay", "Medicare Advantage"))


infra_proc$DC_STATUS <- factor(infra_proc$DC_STATUS, labels = c("Home","Rehab unit","Nursing home","Dead","Other hospital","Homeless"))

infra_proc$POSTOP_MORTCAUSE <- factor(infra_proc$POSTOP_MORTCAUSE, labels = c("Related to disease or treatment", 
                                                                              "Unrelated to disease or treatment",
                                                                              "Unsure"))

infra_proc$TIMETOEXTUB <- factor(infra_proc$TIMETOEXTUB, labels = c("In OR", "<12 hrs", "12-24 hrs", ">24 hrs"))

infra_proc$TRANSFER <- factor(infra_proc$TRANSFER, labels = c("No", "Hospital", "Rehab unit"))


##Comborbities----

infra_proc$PRIOR_CVD <- factor(infra_proc$PRIOR_CVD, labels = c("None", "Hx stroke, asymptomatic", "Hx stroke, minor deficit", 
                                                                "Hx stroke, major deficit"))

infra_proc$PREOP_SMOKING <- factor(infra_proc$PREOP_SMOKING, labels = c("Never", "Prior", "Current"))

infra_proc$HX_SMOKING_COUNSELING <- factor(infra_proc$HX_SMOKING_COUNSELING, labels = c("No", "Yes, Physician/Healthcare Provider Counseling",
                                                                                        "Yes, Professional Referral", "Yes, NRT",
                                                                                        "Yes, Varenicline/Chantix", "Yes, Buproprion/Wellbutrin",
                                                                                        "Unknown"))

infra_proc$HTN <- factor(infra_proc$HTN, labels = c("No", "Yes (>=140/90 or history - retired since 11/15/2016)", "Yes, controlled [added on 04/13/2020]", "Yes, uncontrolled [added on 04/13/2020]"))

infra_proc$DIABETES <- factor(infra_proc$DIABETES, labels = c("None", "Diet", "Non-insulin meds", "Insulin"))

infra_proc$PRIOR_CEACAS <- factor(infra_proc$PRIOR_CEACAS, labels = c("No", "Yes", #retired
                                                                      "CEA", "CAS", "CEA and CAS"))

infra_proc$PRIOR_ANEURREP <- factor(infra_proc$PRIOR_ANEURREP, labels = c("None","Aortic","Other","Aortic and Other"))

infra_proc$EXERCISE_PROGRAM <- factor(infra_proc$EXERCISE_PROGRAM, labels = c("No","Yes, unsupervised", "Yes, supervised"))

infra_proc$R_PRIOR_MAJAMP <- factor (infra_proc$R_PRIOR_MAJAMP, labels = c("No", 
                                                                           "Yes", #Retired
                                                                           "BK/thru knee", "AK or higher"))

infra_proc$CAD <- factor(infra_proc$CAD, labels = c("None", "Hx MI but no sx", "Stable angina", "Unstable angina or MI < 6 mos (retired since 09/12/2012)", 
                                                    "MI < 6 mos", "Unstable angina", "CAD, asymptomatic"))

infra_proc$PRIOR_CABG <- factor(infra_proc$PRIOR_CABG, labels = c("None", "<5yr ago", ">= 5yrs ago"))

infra_proc$PRIOR_PCI <- factor(infra_proc$PRIOR_PCI, labels = c("None", "<5yr ago", ">= 5yrs ago"))

infra_proc$R_PRIOR_CABGPTA <- factor(infra_proc$R_PRIOR_CABGPTA, labels = c("None", "<5yrs ago", ">= 5yrs ago"))

infra_proc$PRIOR_CHF <- factor(infra_proc$PRIOR_CHF, labels = c("None", "Asymptomatic, hx only", "Mild" ,"Moderate", "Severe"))

infra_proc$PREOP_DYSRHYTHMIA <- factor(infra_proc$PREOP_DYSRHYTHMIA, labels = c("No", "Yes, atrial", "Yes, ventricular", "A-V block w pacemaker",
                                                                                "Yes, with ICD", "Other"))

infra_proc$COPD <- factor(infra_proc$COPD, labels = c("No", "Not treated", "On meds", "On home oxygen"))

infra_proc$DIALYSIS <- factor(infra_proc$DIALYSIS, labels = c("No", "Functioning transplant", "On dialysis"))

infra_proc$STRESS <- factor(infra_proc$STRESS, labels = c("Not done", "Normal", "Ischemia", "MI", "Ischemia and MI"))

infra_proc$LIVINGSTATUS <- factor(infra_proc$LIVINGSTATUS, labels = c("Home", "Nursing home", "Homeless"))

infra_proc$PREOP_FUNCSTATUS <- factor(infra_proc$PREOP_FUNCSTATUS, labels = c("Full", "Light work", "Self care", "Assisted care", "Bed bound"))

infra_proc$PREOP_AMBUL <- factor(infra_proc$PREOP_AMBUL, labels = c("Ambulates","Ambulates w/ assistance or prosthesis", "Wheelchair", "Bedridden",
                                                                    "Ambulates w/ prosthesis", "Ambulates w/ assistance"))

infra_proc$ASACLASS <- factor(infra_proc$ASACLASS, labels = c("healthy patient", "mild systemic disease", "severe systemic disease", "severe systemic disease that is a constant threat to life", "moribund - not expected to survive without the operation"))

##Medications----

infra_proc$PREOP_ASA <- factor(infra_proc$PREOP_ASA, labels = c("No", "Yes", "No, for medical reason"," Non-compliant"))

infra_proc$PREOP_P2Y <- factor(infra_proc$PREOP_P2Y, labels = c("None", "Clopidogrel", "Prasugrel", "Ticlopidine", "Ticagrelor", "Other", "No, for medical reason", "Non-compliant"))

infra_proc$PREOP_STATIN <- factor(infra_proc$PREOP_STATIN, labels = c("No", "Yes","No, for medical reason","Non-compliant"))

infra_proc$PREOP_BETABLOCKER <- factor(infra_proc$PREOP_BETABLOCKER, labels = c("No","Pre-op 1-30 days","Chronic > 30 days","No, for medical reason",
                                                                                "Op day only","Non-compliant"))

infra_proc$PREOP_ACE <- factor(infra_proc$PREOP_ACE, labels = c("No","Yes","No, for medical reason","Non-compliant"))

infra_proc$C_PREOP_ANTICOAG <- factor(infra_proc$C_PREOP_ANTICOAG, labels = c("None","Warfarin","Dabigatran","Other","No, for medical reason","Non-compliant"))

#Procedure----
infra_proc$SIDE <- factor(infra_proc$SIDE, labels = c("Right","Left"))

infra_proc$R_INDICATIONR <- factor(infra_proc$R_INDICATIONR, labels = c("Asymptomatic","Claudication","Rest Pain","Tissue Loss","Acute Ischemia","Not Treated"))

infra_proc$R_INDICATIONL <- factor(infra_proc$R_INDICATIONL, labels = c("Asymptomatic","Claudication","Rest Pain","Tissue Loss","Acute Ischemia","Not Treated"))

infra_proc$INDICATION_OCCLUSIVE_R <- factor(infra_proc$INDICATION_OCCLUSIVE_R, labels = c("Asymptomatic", "Mild Claudication", "Moderate Claudication",
                                                                                          "Severe Claudication", "Rest Pain", "Ulcer/necrosis", 
                                                                                          "Non-healing amputation", "Both ulcer and non-healing amp", "Acute Ischemia"))

infra_proc$INDICATION_OCCLUSIVE_L <- factor(infra_proc$INDICATION_OCCLUSIVE_L, labels = c("Asymptomatic", "Mild Claudication", "Moderate Claudication",
                                                                                          "Severe Claudication", "Rest Pain", "Ulcer/necrosis", 
                                                                                          "Non-healing amputation", "Both ulcer and non-healing amp", "Acute Ischemia"))

infra_proc$INDICATION_ANEURYSM_R <- factor(infra_proc$INDICATION_ANEURYSM_R, labels = c("Asymptomatic", "Rest Pain", "Ulcer/necrosis", "Acute Ischemia",
                                                                                        "Size", "Embolization", "Threatened Rupture or Rupture"))

infra_proc$INDICATION_ANEURYSM_L <- factor(infra_proc$INDICATION_ANEURYSM_L, labels = c("Asymptomatic", "Rest Pain", "Ulcer/necrosis", "Acute Ischemia",
                                                                                        "Size", "Embolization", "Threatened Rupture or Rupture"))

infra_proc$ACUTE_ISCHEMIA_R <- factor(infra_proc$ACUTE_ISCHEMIA_R, labels = c("Viable", "Marginally threatened", "Immediately Threatened", "Irreversible (nonviable)"))

infra_proc$ACUTE_ISCHEMIA_L <- factor(infra_proc$ACUTE_ISCHEMIA_L, labels = c("Viable", "Marginally threatened", "Immediately Threatened", "Irreversible (nonviable)"))

infra_proc$TISSUE_LOSS_SEV_R <- factor(infra_proc$TISSUE_LOSS_SEV_R, labels = c("Grade 1, shallow", "Grade 2, deep", "Grade 3, extensive"))

infra_proc$TISSUE_LOSS_SEV_L <- factor(infra_proc$TISSUE_LOSS_SEV_L, labels = c("Grade 1, shallow", "Grade 2, deep", "Grade 3, extensive"))

infra_proc$INFECTION_R <- factor(infra_proc$INFECTION_R, labels = c("Grade 0, none", "Grade 1, mild", "Grade 2, moderate", "Grade 3, severe"))

infra_proc$INFECTION_L <- factor(infra_proc$INFECTION_L, labels = c("Grade 0, none", "Grade 1, mild", "Grade 2, moderate", "Grade 3, severe"))

infra_proc$PATHR <- factor(infra_proc$PATHR, labels = c("None","Occlusive","Aneurysm"))

infra_proc$PATHL <- factor(infra_proc$PATHL, labels = c("None","Occlusive","Aneurysm"))

infra_proc$AMPUTATION_HX_R <- factor(infra_proc$AMPUTATION_HX_R, labels = c("No", "Toe(s)", "Transmet or midfoot", "BK or thru knee", "AK or higher",
                                                                            "Partial or Full Calcenectomy"))

infra_proc$AMPUTATION_HX_L <- factor(infra_proc$AMPUTATION_HX_L, labels = c("No", "Toe(s)", "Transmet or midfoot", "BK or thru knee", "AK or higher",
                                                                            "Partial or Full Calcenectomy"))

infra_proc$GLASS_REGION_FEMOROPOPLITEAL <- factor(infra_proc$GLASS_REGION_FEMOROPOPLITEAL, labels = c("Fem-Pop Grade 0", "Fem-Pop Grade 1", "Fem-Pop Grade 2",
                                                                                                      "Fem-Pop Grade 3", "Fem-Pop Grade 4"))
# Femoropopliteal  = Fem-Pop. Any lesion spanning from the superficial femoral through the popliteal artery. 
# Fem-Pop Grade 0 = Mild or no significant <50% disease. If vessel is disease free abstract as grade 0.

# Fem-Pop Grade 1 = May include single focal CTO (<5cm) as long as there is not a flush occlusion.
# Popliteal artery with mild or no significant disease.

# Fem-Pop Grade 2 = Total length of the SFA disease is about 1/3 - 2/3 (10-20 cm).
# May include CTO totaling <1/3 (10cm) but not flush occlusion.
# Focal Popliteal artery stenosis <2cm, not involving the trifurcation. 

# Fem-Pop Grade 3 = Total length of the SFA disease is about 2/3 (>20cm).
# May include any flush occlusion <20cm or non-flush CTO 10-20 cm long.
# Short popliteal stenosis 2-5cm, not involving the trifurcation.

# Fem-Pop Grade 4 =Total length SFA occlusion >20cm.
# Popliteal disease >5cm or extending into the trifurcation.
# Any popliteal CTO.

infra_proc$GLASS_REGION_INFRAPOPLITEAL <- factor(infra_proc$GLASS_REGION_INFRAPOPLITEAL, labels = c("Infra-Pop Grade 0", "Infra-Pop Grade 1", "Infra-Pop Grade 2",
                                                                                                    "Infra-Pop Grade 3", "Infra-Pop Grade 4"))
# Infrapopliteal = Infra-Pop. Lesions spanning from below the popliteal artery to the arteries crossing the ankle into the foot.

# Infra-Pop Grade 0 = Mild or no stenosis of the tibial artery <3cm. If vessel is disease free abstract as grade 0.

# Infra-Pop Grade 1 = Focal stenosis of tibial artery <3cm.

# Infra=Pop Grade 2 = Stenosis involving 1/3 total vessel length.
# May include focal CTO (<3cm).
# Not including TP (tibioperoneal) trunk or tibial origin.

# Infra-Pop Grade 3 = Disease up to 2/3 vessel length. 
# CTO up to 1/3 length (may include tibial vessel origin but not TP trunk.
                      
# Infra-Pop Grade 4 = Diffuse stenosis >2/3 total vessel length.
# CTO > 1/3 vessel length (may include vessel origin).
# Any CTO of TO trunk if anterior tibial is not the target artery.

infra_proc$GLASS_REGION_INFRAMALEO_PEDAL <- factor(infra_proc$GLASS_REGION_INFRAMALEO_PEDAL, labels = c("Infra-malleolar/Pedal Grade 0", "Infra-malleolar/Pedal Grade 1",
                                                                                                        "Infra-malleolar/Pedal Grade 2"))
# 0 = No documented infra-malleollar disease.

# 1 = GLASS Inframalleolar/Pedal Grade 0 = Target artery crossed ankle to foot, with intact pedal arch.

# 2 = GLASS Inframalleolar/Pedal Grade 1 = Target artery crosses ankle to foot; absent or severely diseased pedal arch.

# 3 = GLASS Inframalleolar/Pedal Grade 2 = No target artery crossing ankle into foot.

infra_proc$URGENCY <- factor(infra_proc$URGENCY, labels = c("Elective","Urgent","Emergent"))

infra_proc$R_ANESTHESIA <- factor(infra_proc$R_ANESTHESIA, labels = c('Spinal','Epidural','General'))

infra_proc$SKINPREP <- factor(infra_proc$SKINPREP, labels = c("Chlorhexidine","Alcohol","Iodine","Chlor + iodine","Chlor + alcohol","Iodine + alcohol","All 3"))

infra_proc$GRAFTORIG <- factor(infra_proc$GRAFTORIG, labels = c("Ext Iliac","Com Fem","Profunda","SFA","AK Pop","BK Pop","Tibial"))

infra_proc$GRAFTRECIP <- factor(infra_proc$GRAFTRECIP, labels = c('SFA','Profunda','AK Pop','BK Pop','T-P Trunk','AT','PT','Peroneal','DP Ankle','PT Ankle','Tarsal/plantar','Com Fem'))

infra_proc$GRFTVTYPE <- factor(infra_proc$GRFTVTYPE, labels = c('Reversed GSV','In Situ GSV','Non-reversed Transposed GSV','Lesser Saph','Cephalic','Basilic'))

infra_proc$VEINSEG <- factor(infra_proc$VEINSEG, labels = c('1','2','3 or more'))

infra_proc$PROSTHETIC <- factor(infra_proc$PROSTHETIC, labels = c('Dacron','PTFE','Non-Autologous Biologic','Other'))

infra_proc$R_GRAFTVEINTYPE <- factor(infra_proc$R_GRAFTVEINTYPE, labels = c('None','Reversed GSV','In Situ GSV','Non-reversed Transposed GSV','Lesser Saph','Cephalic','Basilic','Composite Vein'))

infra_proc$R_VEINSEGS <- factor(infra_proc$R_VEINSEGS, labels = c('None','1','2','3 or more'))

infra_proc$R_PROSTHETIC <- factor(infra_proc$R_PROSTHETIC, labels = c('None','Dacron','PTFE','Non-Autologous Biologic','Composite w/ vein'))

infra_proc$GROIN_INCISION <- factor(infra_proc$GROIN_INCISION, labels = c('None','Vertical','Horizontal'))

infra_proc$CLOSURE <- factor(infra_proc$CLOSURE, labels = c('Absorbable subcuticular','Staples','Removable interrupted','Removable continuous','Open with VAC','Open with packing'))

infra_proc$R_VEIN_HARVEST_INCISION <- factor(infra_proc$R_VEIN_HARVEST_INCISION, labels = c('Continuous','Skip','Endoscopic'))

infra_proc$R_VEIN_GRAFT_LOCATION <- factor(infra_proc$R_VEIN_GRAFT_LOCATION, labels = c('Sub-cutaneous','Sub-fascial (Anatomic)'))

infra_proc$VEIN_HARVEST_INCISION <- factor(infra_proc$VEIN_HARVEST_INCISION, labels = c('Continuous','Skip','Endoscopic'))

infra_proc$VEIN_GRAFT_LOCATION <- factor(infra_proc$R_VEIN_GRAFT_LOCATION, labels = c('Sub-cutaneous','Sub-fascial (Anatomic)'))

infra_proc$CC_IPS_PVI <- factor(infra_proc$CC_IPS_PVI, labels = c('None', 'Inflow', 'Outflow', 'Both'))

infra_proc$CC_IPS_ENDAR <- factor(infra_proc$CC_IPS_ENDAR, labels = c('None', 'Inflow', 'Outflow', 'Both'))

## Postop Outcomes----

infra_proc$NEWMI <- factor(infra_proc$NEWMI, labels = c('No','Troponin only','EKG or clinical'))

infra_proc$RESPIRATORY <- factor(infra_proc$RESPIRATORY, labels = c('No','Pneumonia','Reintubation', 'Both'))

infra_proc$CHGRENAL <- factor(infra_proc$CHGRENAL, labels = c('None','Creat. Increase > 0.5 mg/dl (44.2 umol/L)','Temp. Dialysis','Perm. Dialysis','Yes (retired since 10/14/2010)'))

infra_proc$STROKE <- factor(infra_proc$STROKE, labels = c('None','Minor','Major'))

infra_proc$R_AMPIPS <- factor(infra_proc$R_AMPIPS, labels = c('No','Minor Amp','BK Amp','AK Amp'))

infra_proc$DC_PAT <- factor(infra_proc$DC_PAT, labels = c('Occluded', 'Patent','Not Assessed'))

infra_proc$R_DC_PATJUDGE <- factor(infra_proc$R_DC_PATJUDGE, labels = c('Doppler Only','Palpable Graft Pulse','Palpable Distal Pulse','ABI Increase > 0.15','Duplex'))

infra_proc$POSTOP_PLANNED_IPS_AMP_LVL <- factor(infra_proc$POSTOP_PLANNED_IPS_AMP_LVL, labels = c('Toe(s)', 'Transmet/midfoot',
                                                                                                  'BK or thru knee', 'AK or higher'))

infra_proc$DC_AMBUL <- factor(infra_proc$DC_AMBUL, labels = c('Amb','Amb w/ Assist or prosthesis','Wheelchair','Bedridden', 'Amb w/ Prosthetic',
                                                              'Amb w/ Assistance'))

infra_proc$R_ANTIBIOTICGEN <- factor(infra_proc$R_ANTIBIOTICGEN, labels = c("No","Yes","No, for medical reason"))

infra_proc$R_ANTIBIOTICSTART <- factor(infra_proc$R_ANTIBIOTICSTART, labels = c("No","Yes","No, for medical reason"))

infra_proc$R_ANTIBIOTICEND <- factor(infra_proc$R_ANTIBIOTICEND, labels = c("No","Yes","No, for medical reason"))

infra_proc$ABX <- factor(infra_proc$ABX, labels = c("No","Yes","No, for medical reason"))

infra_proc$ABX_START <- factor(infra_proc$ABX_START, labels = c("No","Yes","No, for medical reason"))

infra_proc$ABX_STOP <- factor(infra_proc$ABX_STOP, labels = c("No","Yes","No, for medical reason"))

##Discharge medications----

infra_proc$DC_ASA <- factor(infra_proc$DC_ASA, labels = c("No","Yes","No, for medical reason","Non-compliant (retired since 12/15/2014)"))

infra_proc$DC_STATIN <- factor(infra_proc$DC_STATIN, labels = c("No","Yes","No, for medical reason","Non-compliant (retired since 12/15/2014)"))

infra_proc$DC_P2Y <- factor(infra_proc$DC_P2Y, labels = c("None","Clopidogrel","Prasugrel","Ticlopidine","Ticagrelor","Other","No, for medical reason",
                                                          "Non-compliant (retired since 12/15/2014)", "PAR1 Inhibitor"))

infra_proc$DC_BETABLOCKER <- factor(infra_proc$DC_BETABLOCKER, labels = c("No","Yes","No, for medical reason","Non-compliant (retired since 12/15/2014)"))

infra_proc$DC_ACE<- factor(infra_proc$DC_ACE, labels = c("No","Yes","No, for medical reason","Non-compliant (retired since 12/15/2014)"))

infra_proc$C_DC_ANTICOAG <- factor(infra_proc$C_DC_ANTICOAG, labels = c("None","Warfarin","Dabigatran","Other","No, for medical reason","Non-compliant (retired since 12/15/2014)"))

infra_proc$LTF_CALC <- factor(infra_proc$LTF_CALC, labels = c("No","Yes","Exclude"))

## Remove outliers from numeric data

# Exclude outliers based the on the world's shortest (65cm) and tallest (272cm) people.

infra_proc$HTCM[infra_proc$HTCM < 75] <- NA
infra_proc$HTCM[infra_proc$HTCM > 250] <- NA

# Exclude outliers based on the world's thinnest (2kg) and fattest (635 kg) people.

infra_proc$WTKG[infra_proc$WTKG < 30] <- NA
infra_proc$WTKG[infra_proc$WTKG > 250] <- NA

# Remove objects

rm(list = c("charVars", "duplicate", "error", "factorVars", "logicalVars", "numVars", "retired"))

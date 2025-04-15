title: Risk Model Validation and Refinement for wound infection after revascularization
for PAD
author: Eden Singh and Adam Johnson
output:
  word_document: default
html_notebook: default
pdf_document: default
html_document:
  df_print: paged
---
  
  # Purpose Statement:
  
  This project aims to develop and validate a risk model for wound infections. This analysis describes the validation of previously published risk models for wound infection in the NSQIP procedure targetted data sets.


# Methods:

## Data: 

NSQIP PUF Files, inclusive of the aortoiliac open and lower extremity open procedure targeted data sets, from 2013-2020 were queried for this study.  We utilized the NSQIPR package to clean the data and organize into relational data sets. We will use the following packages to analyze the data.

```{r packages, message=FALSE, warning=FALSE, results='hide'}
library(tidyverse)
library(finalfit)
install.packages(tidymodels)
library(tidymodels)
```

We will then select the cases that include the CPT codes for procedures that include an open groin incision of femoral artery access for revascularization in peripheral arterial disease.  These CPTs include:
  
  ```{r identify cpt, echo=FALSE, warning=FALSE}
# Select cases from NSQIP Data with CPTs of procedures that include a groin incision

# Create a vector with years of relevant data sets.
years <- c("13", "14", "15_v2", "16", "17", "18_v2", "19", "20")

# Create a vector with relevant CPTs of interest
cpt_codes <- c("35539", "35540", "35546", "35548", "35551", "35582", "35646", "35647", "35651",
               "35565", "35665",
               "35521", "35533", "35621", "35654",
               "34520", "35558", "35661",
               "34201", "35355", "35363", "35371", "35372", "35381",
               "35556", "35583", "35656",
               "35566", "35585", "35666",
               "35700",
               "35883", "35884",
               "35131", "35132", "35721"
)

print(cpt_codes)

```


```{r select and merge, eval=FALSE, echo=FALSE}

#This should run once to select cases and save selected cases as a .rda file

# Run source code to select relevant cases based on PRIMARY CPT from PUF files across the years of interest
source("P:/Pro00113988 - PAD Risk Models/Vasc Fem Inf/vasc_fem_inf/code/vasc_fem_inf_select_bind.R")

#Combine relevant procedure targeted data sets
source("P:/Pro00113988 - PAD Risk Models/Vasc Fem Inf/vasc_fem_inf/code/combine_tar.R")

# Combine puf files and procedure targeted files, keep all cases regardless of whether they have procedure targeted data

puf_pad <- merge(combined_data, combined_pad, by = "caseid", all.x = TRUE)

rm(combined_data, combined_pad)

saveRDS(puf_pad, file="puf_pad.rda")

```

We now need to create variables relevant to our specific study and create subset without missing variables.

```{r prep var}
# import puf_pad file from rda

puf_pad_val <- readRDS("puf_pad.rda")

# Create new variables

puf_pad_val <- puf_pad_val %>%
  mutate(grninf = supinfec | wndinfd | orgspcssi)

# Count the frequency of each CPT and procedure name combination
count_cpt <- puf_pad_val %>% group_by(cpt, proc) %>% summarise(count = n())

cpt_vein <- c("34520", "35521", "35533", "35539", "35540", "35556",
              "35558", "35565", "35566", "35583", "35585", "35884")

count_cpt$vein <- ifelse(count_cpt$cpt %in% cpt_vein ,
                         "TRUE", "FALSE")


```

First we develop the variables included in each previously published risk model from Gwilym et al,  Bennett et al, Leekha et al and Wiseman et al.

```{r table 1, warning=FALSE}
# Create descriptive statistics

#Gwilym variables: female, BMI, ischemic heart disease, skin preparation, bypass/graft material, operative time
attach(puf_pad_val)

# Groin_infection <- (ifelse(puf_pad$wndinf == 'TRUE', 1, 0)) - This variable defines whether the patient has a preop wound infection and so will not be used for our outcome variable.  I have defined the outcome above.

# Do not need to create dummy variable for female sex

# Create the variable for BMI
puf_pad_val$BMI <- 703*(puf_pad_val$weight/(puf_pad_val$height^2))
puf_pad_val$BMI18 <- ifelse(puf_pad_val$BMI < "18,5", "TRUE,", "FALSE")
puf_pad_val$overweight <- ifelse(puf_pad_val$BMI > "25" & puf_pad_val$BMI < "30", "TRUE", "FALSE")
puf_pad_val$obese <- ifelse(puf_pad_val$BMI > "30", "TRUE", "FALSE")

#Create variable ischemic heart disease using presence of HTN or CHF. Unfortunately, both hxmi and hxangina are retired variables and missing in this dataset.  The pad_hrf_phys includes whether there is a recent MI, but this is a composite variable and it does not distinguish whether the high risk feature is related to ischemic heart disease.

puf_pad_val <- puf_pad_val %>%
  mutate(heart_dz = hxchf | hypermed)

# Create variable Skin_preparation.  The common practice in the US is to utilize alcoholic chlorhexidine, which seemed to be the majority of cases in this study and there was no difference when compared with aqueous chlorhexidine, alcoholic betadine or two solutions.  The only solution strongly associated with wound infection would be aqueous betadine.  In my practice, I only use these when there is an open wound.  Therefore, I think it would be reasonable to utilize wndinf variable as a proxy for this.

puf_pad_val$betadine <- ifelse(wndinf == TRUE | wndclas == "2" | wndclas == "3" | wndclas == "4", "TRUE", "FALSE")

# Create variable for Bypass_material

cpt_vein <- c("34520", "35521", "35533", "35539", "35540", "35556",
              "35558", "35565", "35566", "35583", "35585", "35884")

puf_pad_val$vein <- ifelse(cpt %in% cpt_vein ,
                           "TRUE", "FALSE")

# Create variable for operative time
puf_pad_val$optime_hrs <- ((puf_pad_val$optime)/60)

#Create summary table
explanatory <- c("sex", "BMI18", "overweight", "obese", "heart_dz", "betadine", "vein", "optime_hrs")
dependent <- "grninf"
puf_pad_val %>%
  summary_factorlist(dependent, explanatory, p=TRUE, add_dependent_label=TRUE) -> t1
knitr::kable(t1, align = c("l", "l", "r", "r", "r"))


#Evaluate Gwilym model on NSQIP dataset 
#Create new test variable for SSI predicted by Gwilym 
female <- (ifelse(puf_pad_val$sex == 'TRUE', 1, 0))
mutate(BMI.factor = BMI %>% cut(breaks = c(10, 18.5,25, 29.9, 30, 90), include.lowest = TRUE) %>%
fct_recode(
  "<18.5" = "[10,18.5]",
  "25 to 29.5" = "(25,29.5]",
  ">30" = "(30,90]"
  )%>%
head(puf_pad_val$BMI.factor)

mutate(gwilym.factor = factor(-4.86+(0.535(female))+)
beta
-4.846 + 
  0.535*(Female) +
  0.629*(BMI<18.5) +
  0.264*(BMI) between 25-29.9)) +
  1.070*(BMI) > 30) +
  0.793*(Ischemic_heart_disease)-0.394*(aqueous chlorhex skin prep)-0.058*(alcoholic betadine skin prep)+ 1.024*(aqeous betadine skin) + 0.021*(two solutions for skin preparation) + 0.884*(vein bypass/patch material) +1.582*(xenograft bypass/patch material)
+0.938*(prosthetic bypass/patch material) + 0.142*(Operative_time_hrs)
puf_pad$give_pred <- 1 / (1+e^beta)







```{r table 2, warning=FALSE}
# Create descriptive statistics
We now will create the relevant variables for the Leekha et al.

#Leekha variables: Critical ischemia, COPD, previous revascularization, previous SSI 

#Create variable critical limb ischemia based on PAD symptom variable in NSQIP.PAD symptoms is divided into rest pain, tissue loss, asymptomatic, or claudication. For critical limb ischemia, will include rest pain and tissue loss. 
puf_pad_val$cli <- ifelse(pad_sympt == "Rest pain" | pad_sympt == "Tissue loss", "TRUE", "FALSE")

#Utilize hxCOPD variable for COPD. No need to create a new variable. 

#Create previous revascularization variable based on "PAD high risk features anatomic". High risk features anatomic is divided into anatomic bypass, percutaneous intervention, and prior abdominal surgery. Leekha et al defines prior revascularization as either a prior surgical or percutaneous revascularization procedure. 
puf_pad_val$prrevasc <- ifelse(pad_hrf_anat == "Prior ipsilateral bpass" | pad_hrf_anat == "Prior ipsilateral percutaneous intervention", "TRUE", "FALSE" )

#There is not an equivalent or proxy that is an accurate representation of prior SSI in NSQIP. The closest is "wndinf" but this only classifies is there is a wound infection present at the time of surgery.

explanatory <- c("cli", "hxcopd", "prrevasc")
dependent <- "grninf"
puf_pad_val %>%
  summary_factorlist(dependent, explanatory, p=TRUE, add_dependent_label=TRUE) -> t1
knitr::kable(t1, align = c("l", "l", "r", "r", "r"))

```
#We now will create the relevant variables for the Wiseman et al

```{r table 3, warning=FALSE} 
#Wiseman variables: Lower extremity revascularization, aortoilliac procedure, BMI, operative time, female, insulin-dependent diabetes, non-insulin dependent diabetes, smoker, hypertension, critical limb ischemia, dyspnea with moderate exertion, groin anastomosis, ASA class 4 or 5, COPD, CAD, Neurologic disease, age, race, sepsis complication, renal complication, totally dependent functional status, prolonged LOS     
#Lower extremity revascularization and aortoilliac procedure are already included in the CPT codes. No need to create new variable.

#There were variables for both obese and overweight included in the model. We will now create variables for BMI. 
puf_pad_val$obese <- ifelse(puf_pad_val$BMI > "30", 1, 0)
puf_pad_val$overweight <- ifelse(puf_pad_val$BMI > "25" & puf_pad_val$BMI < "30", 1, 0)
       
#Utilize optime variable already created for Gwilym et al
puf_pad_val$optimesix <- ifelse(puf_pad_val$optime_hrs > "6", 1, 0) 
puf_pad_val$optimefoursix <- ifelse(puf_pad_val$optime_hrs > "4" & puf_pad_val$optime_hrs < "6", 1, 0) 

#No need to create a dummy variable for female

#Create insulin dependent diabetes variable and non-insulin dependent diabetes variables. 
puf_pad_val$insldep <- ifelse(puf_pad_val$insulin == "TRUE", 1, 0)
puf_pad_val$noninsldep <- ifelse(puf_pad_val$insulin == "FALSE", 1, 0)

#No need to create a new variable for smoker. Can utilize "smoke" variable.

#No need to create a new variable for hypertension. Can utilize "hypermed" variable.

#Create variable for dyspnea with moderate exertion. Can utilize the when_dyspnea variable. 
puf_pad_val$dyspneamod <- ifelse(puf_pad$when_dyspnea == "Moderate exertion", 1, 0)

#Create variables for ASA class 4 or for ASA class 5. Can utilize asaclas variable.
puf_pad_val$asa_class_45 <-ifelse(puf_pad_val$asaclas == "4"| puf_pad_val$asaclas == "5", 1, 0)

#No need to create a new variable for COPD Can utilize "hxcopd" variable.

#CAD (presence of MI, angina, percutaneous coronary intervention, or cardiac surgery). Since there is not MI or angina, will use heart_dz proxy variable

#Neurological disease data is not available in this form of NSQIP.

#For chronic limb ischemia, Utilize the cli variable created for the Leekha et al paper.

#Create variable for age greater than 65.
puf_pad_val$age65 <- ifelse(puf_pad_val$age > "65", 1, 0)

#Create Black race variable from on race variable in NSQIP. 
puf_pad_val$blkrace <- ifelse(puf_pad$race == "Black", 1, 0)

# We will not include post-operative variables in our model, because the intention is for this to be used in the preoperative setting.  Therefore we will consider variables for renal, graft loss, sepsis, and prolonged LOS as negative.

#Totally dependent functional status (fnstatus2).Based on the variables listed in fnstatus1 vs fnstatus2, I think we would want to use fnstatus2
puf_pad_val$fnstdep <- ifelse(puf_pad_val$fnstatus2 == "dependent", 1, 0)

#Create variable for length of stay greater than 14 days. Need to confirm that toslos stands for total length of stay. 
puf_pad_val$los14 <- ifelse(puf_pad_val$tothlos > "14", 1, 0)

explanatory <- c("obese", "overweight", "optimesix","optimefoursix", "sex", "insldep", "noninsldep", "smoke", "hypermed", "cli", "dyspneamod", "asa_class_45", "hxcopd", "heart_dz", "age65", "blkrace", "fnstdep", "los14")
dependent <- "grninf"
puf_pad_val %>%
  summary_factorlist(dependent, explanatory, p=TRUE, add_dependent_label=TRUE) -> t1
knitr::kable(t1, align = c("l", "l", "r", "r", "r"))


```
```{r table 4, warning=FALSE} 
#We now will create the relevant variables for the Bennett et al

#Bennett variables: Gender, BMI, reoperative groin, ESRD, Malnutrition, Urgent

#No need to create a dummy variable for female. Will use sex variable. 

#For BMI, they did not define a specific range of BMI, just that it was apart of the best fit model. Therefore, we will use the BMI variable as is.

#For reoperative groin, will utilize the hrf_anat feature. Bennett et al defined reoperative groin as "presence of previous groin incision on ipsilateral side." Would this be best measured by including both prior ipsilateral bypass and prior ipsilateral percutaenous intervention? If so, can use the prrevasc variable.

#No need to create a new variable for ESRD. Will use dialysis variable. 

#Create a variable for malnutrition. We will measure this as albumin level less than 3.5. Does pralbum indicate preoperative? There is also dpralbm.
puf_pad_val$malnut <- ifelse(puf_pad_val$pralbum < "3.5", "TRUE", "FALSE")

#No need to create a new variable for urgent. Will use emergncy variable. 

explanatory <- c("BMI", "sex", "dialysis", "malnut", "emergncy", "prrevasc")
dependent <- "grninf"
puf_pad_val %>%
  summary_factorlist(dependent, explanatory, p=TRUE, add_dependent_label=TRUE) -> t1
knitr::kable(t1, align = c("l", "l", "r", "r", "r"))         


```

After we created our variables for the Gwylim et al paper, let's now calculate our predicted value and validate in our data set.

```{r validate scores}

#Evaluate Gwilym model on NSQIP dataset 

attach(puf_pad_val)

#Calculate predicted values for Gwilym et al
give_beta <- -4.846 + 
        0.535*(female) +
        0.629*(underweight) +
        0.264*(overweight) +
        1.070*(obese) +
        0.793*(heart_dz) -
        1.024*(betadine) +
        0.884*(vein) +
        1.582*(patch) +
        0.938*(prsth) + 
        0.142*(optime_hrs)
puf_pad_val$give_pred <- 1 / (1+2.71828^give_beta)

#Calculate predicted values for Leekha et al
leek_beta <- 1.07*(cli) +
             0.74*(copd) +
             0.99*(prrevasc)
puf_pad_val$leek_pred <- 1 / (1+2.71828^leek_beta)

#Calculate predicted values for Bennett et al
benn_beta <- log(3.01)*(reop_groin) +
             log(3.46)*(female) +
             log(1.01)*(BMI) +
             log(4.37)*(esrd) +
             log(7.22)*(malnut) +
             log(2.98)*(urgnt)
puf_pad_val$benn_pred <- 1 / (1+2.71828^benn_beta)

#Calculate predicted values for Wiseman et al 
wise_beta <- log(1.4)*(female) +
                log(0.9)*(age65)
                log(0.8)*(blkrace) +
                log(1.3)*(overweight) +
                log(2.3)*(obese) +
                log(1.3)*(insldep) + 
                log(1.2)*(noninsldep) +
                log(1.2)*(smoke) +
                log(1.2)*(hypermed) +
                log(1.1)*(heart_dz) +
                log(1.2)*(cli) +
                log(0.5)*(fnstdep) +
                log(1.1)*(hxcopd) +
                log(1.2)*(dyspneamod) +
                log(1.4)*(optimefoursix) +
                log(1.5)*(optimesix) +
                log(1.2)*(asa_class_45)
puf_pad_val$wise_pred <- 1 / (1+2.71828^wise_beta) 
  

# Plot ROC and calculate AUC using the yardstick package, which is a part of tidymodels
roc_give <- roc_curve(puf_pad_val, grninf, give_pred)
auc_give <- roc_auc(puf_pad_val, grninf, give_pred)
auc_give_round <- round(auc_give$.estimate, 4)

roc_leek <- roc_curve(puf_pad_val, grninf, leek_pred)
auc_leek <- roc_auc(puf_pad_val, grninf, leek_pred)
auc_leek_round <- round(auc_leek$.estimate, 4)

roc_benn <- roc_curve(puf_pad_val, grninf, benn_pred)
auc_benn <- roc_auc(puf_pad_val, grninf, benn_pred)
auc_benn_round <- round(auc_benn$.estimate, 4)

roc_wise <- roc_curve(puf_pad_val, grninf, wise_pred)
auc_wise <- roc_auc(puf_pad_val, grninf, wise_pred)
auc_wise_round <- round(auc_wise$.estimate, 4)

combined_data <- rbind(
  data.frame(Model = "1. Gwilym et al", Sensitivity = roc_give$sensitivity, Specificity = roc_give$specificity),
  data.frame(Model = "2. Leekha et al", Sensitivity = roc_leek$sensitivity, Specificity = roc_leek$specificity),
  data.frame(Model = "3. Bennett et al", Sensitivity = roc_benn$sensitivity, Specificity = roc_benn$specificity)
  data.frame(Model = "4. Wiseman et al", Sensitivity = roc_wise$sensitivity, Specificity = roc_wise$specificity)
)

# Create the plot
ggplot(combined_data, aes(x = 1 - Specificity, y = Sensitivity, color = Model)) +
  geom_line() +
  labs(title = "Combined ROC Curve", x = "False Positive Rate", y = "True Positive Rate") +
  scale_color_manual(values = c("red", "blue", "green")) +
  geom_abline(intercept = 0, slope = 1, linetype = "dashed", color = "gray") +
  annotate("text", x = 0.75, y = 0.25, label = paste("AUC =", auc_give_round), col = "red") +
  annotate("text", x = 0.75, y = 0.20, label = paste("AUC =", auc_leek_round), col = "blue") +
  annotate("text", x = 0.75, y = 0.15, label = paste("AUC =", auc_benn_round), col = "green") +
  annotate("text", x = 0.75, y = 0.15, label = paste("AUC =", auc_wise_round), col = "yellow") +












                                                                                                                   
# Run source code to select relevant cases from PUF files across the years of interest
source("P:/Pro00113988 - PAD Risk Models/Vasc Fem Inf/vasc_fem_inf/code/vasc_fem_inf_select_bind.R")

#Install tidyverse
library(tidyverse)
install.packages("tidyverse")
install.packages ("tidyverse", repo="http://archive.linux.duke.edu/cran/")

#Install Final Fit
install.packages("finalfit", repo="http://archive.linux.duke.edu/cran/")
library(finalfit)

#create relevant variables 
#Gwilym variables: BMI, female, ischemic heart disease, skin preparation, bypass/graft material, operative time
source(puf_pad)
Groin_infection <- (ifelse(puf_pad$wndinf == 'TRUE', 1, 0))
#There is also a variable wndinfd or nwndinf, but I am not sure whether to include only one or all of these. 
Female <- (ifelse(puf_pad$sex == 'Female', 1, 0))
BMI <- 703*(puf_pad$weight/(puf_pad$height^2))
#Create variable ischemic heart disease using hxangina, hxMI
MI <- puf_pad$hxmi
Angina <- puf_pad$hxangina
condition <- (ifelse(puf_pad$hxangina == 'TRUE', 1, 0))
Ischemic_heart_disease <- ifelse(condition, puf_pad$hxangina, puf_pad$hxmi)
Skin_preparation 
# From Dr. J: The practice in most vascular practices that i have seen is to use chlorhexidine primarily and the aqeuous betadine in patients with open wounds.  There is an open wound variable in NSQIP, so this might be a useful proxy for aqueous betadine and then we can just impute that all others used chlorhexidine.
Bypass_material 
#Discern from CPT
Operative_time_hrs <- ((puf_pad$optime)/60)

#Create summary tables of variables in the Gwilym model 
library(finalfit)
data(puf_pad)
explanatory = c("Female", "BMI",)
dependent = "Groin_infection"
puf_pad %>%
  summary_factorlist(dependent, explanatory) -> t





















#Other code I tried to run the Gwilym et al summary table 
rm(combined_data, combined_pad)
library(finalfit)
library(dplyr)
data(puf_pad)
df <- data.frame(BMI, Female)
dependent= puf_pad$wndinf
explanatory = c("BMI", "Female")
puf_pad %>%
  summary_factorlist(dependent, explanatory, p=TRUE, add_dependent_label=TRUE) -> t1
knitr::kable(t1, row.names = FALSE, align = c("l", "l", "r", "r", "r"))




#Wiseman variables: Lower extremity revascularization, aortoilliac procedure, BMI, operative time, female, insulin-dependent diabetes, non-insulin dependent diabetes, smoker, hypertension, critical limb ischemia, dyspnea with moderate exertion, groin anastomosis, ASA class 4 or 5, COPD, CAD, Neurologic disease, age, race, sepsis complication, renal complication, totally dependent functional status, prolonged LOS     
Lower_extremity_revascularization
#Primary procedure variable in NSQIP (don't see in puf_pad)
Aortoilliac_procedure 
#Primary procedure variable in NSQIP (don't see in puf_pad)
Insulin_dependent_diabetes <-(ifelse(puf_pad$insulin == 'TRUE', 1, 0))
Non-insulin_dependent_diabetes <- (ifelse(puf_pad$insulin == 'TRUE', 1, 0))
Smoker <-(ifelse(puf_pad$smoke == 'TRUE', 1, 0))
Hypertension <-(ifelse(puf_pad$hypermed == 'TRUE', 1, 0))
Dyspnea_with_moderate_exertion <-(ifelse(puf_pad$when_dyspnea == 'Moderate exertion', 1, 0))
ASA_class_4 <-(ifelse(puf_pad$asaclas == '4', 1, 0))
ASA_class_5 <-(ifelse(puf_pad$asaclas == '5', 1, 0))
CAD <- ((ifelse(puf_pad$hxangina == 'True', 1, 0) OR (ifelse(puf_pad$hxmi == 'True', 1, 0))
#created based on hx of angina and hx of mi variables
Neurologic_disease <- ((ifelse(puf_pad$hxtia == 'True', 1, 0) OR (ifelse(puf_pad$hxcva == 'True', 1, 0) OR  (ifelse(puf_pad$para == 'True', 1, 0)) OR (ifelse(puf_pad$quad == 'True', 1, 0)) OR  (ifelse(puf_pad$hemi == 'True', 1, 0)) OR (ifelse(puf_pad$tumorcns == 'True', 1, 0))
#Created based on hxtia, cva, paraplegia, quadplegia, hemiplegia, cnstumor. Did not add in CVAno because unsure what it stood for. 
#Need to adjust age 
Age <-puf_pad$age
Black_race <-(ifelse(puf_pad$race == 'Black', 1, 0))
Sepsis_complication <- (ifelse(puf_pad$prsepis == 'TRUE', 1, 0))
#is pr sepsis prior sepsis or sepsis complication? I know PATOS is present at time of surgery
Renal_complication <- (ifelse(puf_pad$renainsf == 'TRUE', 1, 0))
#Need to confirm that the renal insufficiency is referring to post-operative; there also is nrenainsf or drenainsuf
Totally_dependent_functional_status <- (ifelse(puf_pad$fnstatus2 == 'Totally Dependent')
#Based on the variables listed in fnstatus1 vs fnstatus2, I think we would want to use fnstatus2
LOS <- puf_pad$totslos
#Confirm that this is the total LOS variable





#Gwilym et al. model: 
beta
  -4.846 + 
  0.535*(Female) +
  0.629*(BMI) +
  0.264*(BMI) < 29.9), 1, 0) +
  1.070*(BMI) > 30), 1, 0) +
  0.793*(Ischemic_heart_disease)-0.394*(aqueous chlorhex skin prep)-0.058*(alcoholic betadine skin prep)+ 1.024*(aqeous betadine skin) + 0.021*(two solutions for skin preparation) + 0.884*(vein bypass/patch material) +1.582*(xenograft bypass/patch material)
  +0.938*(prosthetic bypass/patch material) + 0.142*(Operative_time_hrs)
  puf_pad$give_pred <- 1 / (1+e^beta)
#Another attempt at a summary table for Gwilym
library(finalfit)
model <- lm(Wound_infection ~ Female + BMI, data = puf_pad)
summary_table <- finalfit(model)
print(summary_table)

#Leekha et al model: Scores out of 5 
(ifelse(critical ischemia)) + (ifelse(puf_pad$hxcopd == 'True', 1, 0)) + 2*(wound infection at time of surgery) + (prior revascularization procedure)


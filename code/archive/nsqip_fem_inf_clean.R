# Import analysis data file----

mydata <-read.csv("Dropbox/adam files/Research Projects/AAA Operative Time/puf_aaa11_16_0.csv")

summary(mydata)

# Exclude Cases----

mydata <- mydata[which(mydata$OPTIME != -99),]
mydata <- mydata[which(mydata$OPTIME > 60),]

# Clean Variables - Missing Values, Fix Data Types----

mydata$OPTIME <- as.numeric(mydata$OPTIME)
mydata$studyvar <- mydata$OPTIME

mydata$Age <- factor(mydata$Age, levels = c(levels(mydata$Age), "90"))
mydata$Age[mydata$Age=="90+"] <- "90"
mydata$Age <- as.numeric(as.character(mydata$Age))

mydata$HEIGHT[mydata$HEIGHT==-99] <- NA
mydata$HEIGHT <- as.numeric(mydata$HEIGHT)

mydata$WEIGHT[mydata$WEIGHT==-99] <- NA
mydata$WEIGHT <- as.numeric(mydata$WEIGHT)

label(mydata$BLEEDDIS) <- "Bleeding Disorder"

mydata$PRBUN[mydata$PRBUN==-99] <- NA

mydata$PRINR[mydata$PRINR==-99] <- NA                                   # Exclude because >10% missing

mydata$ASACLAS <- as.character(mydata$ASACLAS)
mydata$ASACLAS[mydata$ASACLAS=="None assigned"] <- "Not documented"
mydata$ASACLAS <- as.factor(mydata$ASACLAS)

mydata$AAA_SURGIND <- factor(mydata$AAA_SURGIND)

mydata$AAA_PAAS <- as.character(mydata$AAA_PAAS)
mydata$AAA_PAAS[mydata$AAA_PAAS=="Unknown"] <- "Not documented"
mydata$AAA_PAAS <- as.factor(mydata$AAA_PAAS)

mydata$AAA_SURGAP <- factor(mydata$AAA_SURGAP)

mydata$AAA_PCL[mydata$AAA_PCL=="Between SMA CHR(38) renals"] <- "Between SMA & renals"
mydata$AAA_PCL <- factor(mydata$AAA_PCL)
mydata$AAA_PCL <- relevel(mydata$AAA_PCL, "Infrarenal", "Above one renal", "Between SMA & renals", "Supraceliac", "Not documented")
summary(mydata$AAA_PCL)

mydata$AAA_PAE <- factor(mydata$AAA_PAE)

mydata$AAA_DISTEXT <- factor(mydata$AAA_DISTEXT)

mydata$AAA_MIMA <- factor(mydata$AAA_MIMA)

mydata$TOTHLOS[mydata$TOTHLOS==-99] <- NA 

mydata$AAA_ICULOS[mydata$AAA_ICULOS=="Not documented"] <- NA
mydata$AAA_ICULOS <- factor(mydata$AAA_ICULOS, levels = c(levels(mydata$AAA_ICULOS), "30"))
mydata$AAA_ICULOS[mydata$AAA_ICULOS=="30 or more"] <- "30"
mydata$AAA_ICULOS <- as.integer(mydata$AAA_ICULOS)

mydata$OTHDVT[mydata$OTHDVT=="DVT Requiring Therap"] <- "DVT Requiring Therapy"
mydata$OTHDVT <- factor(mydata$OTHDVT)

mydata$DOpertoD[mydata$DOpertoD==-99] <- NA

# Create New Variables----

mydata$AgeCAT[mydata$Age < 65] <- "Less than 65" # Reference group
mydata$AgeCAT[mydata$Age >= 65 & mydata$Age < 75] <- "65 to 75" # no significant difference in modeling
mydata$AgeCAT[mydata$Age >= 75 & mydata$Age < 80] <- "75 to 80" # significant difference and large enough sample
mydata$AgeCAT[mydata$Age >= 80] <- "Greater than 80" # >85 small sample size
mydata$AgeCAT <- as.factor(mydata$AgeCAT)
mydata$AgeCAT <- relevel(mydata$AgeCAT, "Less than 65", "65 to 75", "75 to 80", "Greater than 80")
label(mydata$AgeCAT) <- "Age at time of Surgery"

mydata$bmi <- mydata$WEIGHT / (mydata$HEIGHT ^ 2) *703

mydata$bmiCAT[mydata$bmi < 18.5] <- "Underweight (<18.5)"
mydata$bmiCAT[mydata$bmi >= 18.5 & mydata$bmi < 25] <- "Normal Weight (18.5-25)"
mydata$bmiCAT[mydata$bmi >= 25 & mydata$bmi < 30] <- "Overweight (25-30)"
mydata$bmiCAT[mydata$bmi >= 30 & mydata$bmi < 35] <- "Class 1 Obesity (30-35)"
mydata$bmiCAT[mydata$bmi >= 35] <- "Class 2 or 3 Obesity (>35)"
mydata$bmiCAT[is.na(mydata$bmi)] <- "Not documented"
mydata$bmiCAT <- as.factor(mydata$bmiCAT)
mydata$bmiCAT <- relevel(mydata$bmiCAT, "Normal Weight", "Underweight", "Overweight", "Class 1 Obesity", 
                         "Class 2 or 3 Obesity", "Not documented")
label(mydata$bmiCAT) <- "WHO BMI Classification"

mydata$PGY <- as.factor(mydata$PGY)
mydata$trainee[mydata$PGY=="1"] <- "Junior"
mydata$trainee[mydata$PGY=="2"] <- "Junior"
mydata$trainee[mydata$PGY=="3"] <- "Senior"
mydata$trainee[mydata$PGY=="4"] <- "Senior"
mydata$trainee[mydata$PGY=="5"] <- "Senior"
mydata$trainee[mydata$PGY=="6"] <- "Senior"
mydata$trainee[mydata$PGY=="-99"] <- "Not documented"
mydata$trainee[is.na(mydata$PGY)] <- "Not documented"
mydata$trainee <- as.factor(mydata$trainee)
summary(mydata$trainee)

mydata$WNDCONT[mydata$WNDCLAS=="1-Clean"] <- "Clean or Clean/Contaminated"
mydata$WNDCONT[mydata$WNDCLAS=="2-Clean/Contaminated"] <- "Clean or Clean/Contaminated"
mydata$WNDCONT[mydata$WNDCLAS=="3-Contaminated"] <- "Contaminated or Dirty"
mydata$WNDCONT[mydata$WNDCLAS=="4-Dirty/Infected"] <- "Contaminated or Dirty"
mydata$WNDCONT <- as.factor(mydata$WNDCONT)
label (mydata$WNDCONT) <- "Wound Classification"

mydata$INDGRP[mydata$AAA_SURGIND=="Diameter"] <- "Diameter"
mydata$INDGRP[mydata$AAA_SURGIND=="Dissection"] <- "Other Initial Non-Rupture"
mydata$INDGRP[mydata$AAA_SURGIND=="Embolization"] <- "Other Initial Non-Rupture"
mydata$INDGRP[mydata$AAA_SURGIND=="Non-ruptured symptomatic"] <- "Other Initial Non-Rupture"
mydata$INDGRP[mydata$AAA_SURGIND=="Thrombosis"] <- "Other Initial Non-Rupture"
mydata$INDGRP[mydata$AAA_SURGIND=="Other indication for surgery"] <- "Other Initial Non-Rupture"
mydata$INDGRP[mydata$AAA_SURGIND=="Prior endovascular intervention w/ unsatisfactory result"] <- "Reoperation"
mydata$INDGRP[mydata$AAA_SURGIND=="Prior open intervention w/ unsatisfactory result"] <- "Reoperation"
mydata$INDGRP[mydata$AAA_SURGIND=="Rupture w/ hypotension or use of pressors"] <- "Rupture"
mydata$INDGRP[mydata$AAA_SURGIND=="Rupture w/out hypotension"] <- "Rupture"
mydata$INDGRP <- as.factor(mydata$INDGRP)
label(mydata$INDGRP) <- "Indication for Surgery"

mydata$REOPFIELD[mydata$AAA_PAAS=="Yes" & (mydata$AAA_SURGAP=="Transperitoneal-midline" |
                                             mydata$AAA_SURGAP=="Transperitoneal-transverse")] <- "Reoperative field"
mydata$REOPFIELD[mydata$AAA_PAAS=="No" | mydata$AAA_SURGAP=="Retroperitoneal"] <- "Not Reoperative field"
mydata$REOPFIELD <- as.factor(mydata$REOPFIELD)

mydata$APPROACH[mydata$AAA_SURGAP=="Retroperitoneal"] <- "Retroperitoneal"
mydata$APPROACH[mydata$AAA_PAAS=="Yes" & (mydata$AAA_SURGAP=="Transperitoneal-midline" |
                                            mydata$AAA_SURGAP=="Transperitoneal-transverse")] <- "Reoperative Transperitoneal"
mydata$APPROACH[mydata$AAA_PAAS=="No" & (mydata$AAA_SURGAP=="Transperitoneal-midline" |
                                           mydata$AAA_SURGAP=="Transperitoneal-transverse")] <- "Initial Transperitoneal"
mydata$APPROACH <- as.factor(mydata$APPROACH)
label(mydata$APPROACH) <- "Surgical Approach"

mydata$AAA_PROX[mydata$AAA_PAE=="Infrarenal"] <- "Infrarenal"
mydata$AAA_PROX[mydata$AAA_PAE=="Juxtarenal"] <- "Juxtarenal"
mydata$AAA_PROX[mydata$AAA_PAE=="Pararenal"] <- "Pararenal"
mydata$AAA_PROX[mydata$AAA_PAE=="Supra-renal"] <- "Supra-renal or Type IV TAA"
mydata$AAA_PROX[mydata$AAA_PAE=="Type IV Thoracoabdominal aneurysm"] <- "Supra-renal or Type IV TAA"
mydata$AAA_PROX <- as.factor(mydata$AAA_PROX)
label(mydata$AAA_PROX) <- "Anuerysm Proximal Extent"

mydata$AAA_DISTAL[mydata$AAA_DISTEXT=="Aortic"] <- "Aortic"
mydata$AAA_DISTAL[mydata$AAA_DISTEXT=="Common iliac"] <- "Common iliac"
mydata$AAA_DISTAL[mydata$AAA_DISTEXT=="External iliac"] <- "Internal or External Iliac"
mydata$AAA_DISTAL[mydata$AAA_DISTEXT=="Internal iliac"] <- "Internal or External Iliac"
mydata$AAA_DISTAL <- as.factor(mydata$AAA_DISTAL)
label(mydata$AAA_DISTAL) <- "Anuerysm Distal Extent"

mydata$thirdmort[mydata$DOpertoD>=0] <- "Died in 30 days"
mydata$thirdmort[is.na(mydata$DOpertoD)] <- "Alive at 30 days"
mydata$thirdmort <- as.factor(mydata$thirdmort)
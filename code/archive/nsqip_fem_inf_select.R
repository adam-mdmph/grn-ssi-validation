
library(readr)
library(finalfit)

# Import Procedure Targeted Datasets----

puf_aio13 <- read.csv("P:/Pro00113988 - PAD Risk Models/DataRepo/NSQIP/puf_aio13.txt")
puf_aio14 <- read.csv("P:/Pro00113988 - PAD Risk Models/DataRepo/NSQIP/puf_aio14.txt")
puf_aio15 <- read.csv("P:/Pro00113988 - PAD Risk Models/DataRepo/NSQIP/puf_aio15.txt")
puf_aio16 <- read.csv("P:/Pro00113988 - PAD Risk Models/DataRepo/NSQIP/puf_aio16.txt")
puf_aio17 <- read.csv("P:/Pro00113988 - PAD Risk Models/DataRepo/NSQIP/puf_aio17.txt")
puf_aio18 <- read.csv("P:/Pro00113988 - PAD Risk Models/DataRepo/NSQIP/puf_aio18.txt")
puf_aio19 <- read.csv("P:/Pro00113988 - PAD Risk Models/DataRepo/NSQIP/puf_aio19.txt")
puf_aio20 <- read.csv("P:/Pro00113988 - PAD Risk Models/DataRepo/NSQIP/puf_aio20.txt")
puf_aio21 <- read.csv("P:/Pro00113988 - PAD Risk Models/DataRepo/NSQIP/puf_aio21.txt")

puf_leo13 <- read.csv("P:/Pro00113988 - PAD Risk Models/DataRepo/NSQIP/puf_leo13.txt")
puf_leo14 <- read.csv("P:/Pro00113988 - PAD Risk Models/DataRepo/NSQIP/puf_leo14.txt")
puf_leo15 <- read.csv("P:/Pro00113988 - PAD Risk Models/DataRepo/NSQIP/puf_leo15.txt")
puf_leo16 <- read.csv("P:/Pro00113988 - PAD Risk Models/DataRepo/NSQIP/puf_leo16.txt")
puf_leo17 <- read.csv("P:/Pro00113988 - PAD Risk Models/DataRepo/NSQIP/puf_leo17.txt")
puf_leo18 <- read.csv("P:/Pro00113988 - PAD Risk Models/DataRepo/NSQIP/puf_leo18.txt")
puf_leo19 <- read.csv("P:/Pro00113988 - PAD Risk Models/DataRepo/NSQIP/puf_leo19.txt")
puf_leo20 <- read.csv("P:/Pro00113988 - PAD Risk Models/DataRepo/NSQIP/puf_leo20.txt")
puf_leo21 <- read.csv("P:/Pro00113988 - PAD Risk Models/DataRepo/NSQIP/puf_leo21.txt")

# Select identical variables across data sets----
names <- colnames(puf_aio13)

colnames_df21 <- colnames(puf_aio21)
colnames_df20 <- colnames(puf_aio20)

# Find column names unique to puf_aie21
columns_unique_to_df21 <- setdiff(colnames_df21, colnames_df20)

# Find column names unique to puf_aie20
columns_unique_to_df20 <- setdiff(colnames_df20, colnames_df21)

# Display the differences
cat("Columns unique to df1:", columns_unique_to_df1, "\n")
cat("Columns unique to df2:", columns_unique_to_df2, "\n")

myvars_aio <- c("CaseID", "OperYR", "OPTIME", "Age", "SEX", "HEIGHT", "WEIGHT", "ASCITES", "DIALYSIS", "BLEEDDIS", "PRBUN", "PRINR", "WNDCLAS",
                "ASACLAS", "MORTPROB", "MORBPROB", "PGY", "AAA_SURGIND", "AAA_PAAS", "AAA_SURGAP", "AAA_PCL", "AAA_PAE", "AAA_DISTEXT", "AAA_MIMA", 
                "AAA_CP_RENREVASC", "AAA_CP_VISCREVASC", "AAA_CP_LER", "AAA_CP_ARE", "TOTHLOS", "AAA_ICULOS", "SUPINFEC", "WNDINFD",
                "ORGSPCSSI", "DEHIS", "OUPNEUMO", "REINTUB", "PULEMBOL","FAILWEAN", "RENAINSF", "OPRENAFL", "URNINFEC", "CNSCVA",
                "CDARREST", "CDMI", "NOTHBLEED", "OTHDVT", "OTHSYSEP", "OTHSESHOCK", "RETURNOR", "DOptoDis", "DOpertoD", 
                "AAA_LEI", "AAA_ROA")

puf_aio13_0 <- puf_aio13[myvars_aio]
puf_aio14_0 <- puf_aio14[myvars_aio]
puf_aio15_0 <- puf_aio15[myvars_aio]
puf_aio16_0 <- puf_aio16[myvars_aio]
puf_aio17_0 <- puf_aio17[myvars_aio]
puf_aio18_0 <- puf_aio18[myvars_aio]
puf_aio19_0 <- puf_aio19[myvars_aio]
puf_aio20_0 <- puf_aio20[myvars_aio]
puf_aio21_0 <- puf_aio21[myvars_aio]



# Merge data sets by year----

puf_aio_13_21 <- rbind(puf_aio13, puf_aio14, puf_aio15, puf_aio16, 
                           puf_aio17, puf_aio18, puf_aio19, puf_aio20, puf_aio21)

# Align Column Names----

names(puf_aio14)
names(puf_leo13)

colnames(puf_aio13)[colnames(puf_aio13)=="AIO_PROC"] <- "TAR_PROC"
colnames(puf_aio13)[colnames(puf_aio13)=="AIO_SYMPT"] <- "TAR_SYMPT"
colnames(puf_aio13)[colnames(puf_aio13)=="AIO_HRF_PHYS"] <- "TAR_HRF_PHYS"
colnames(puf_aio13)[colnames(puf_aio13)=="AIO_HRF_ANAT"] <- "TAR_HRF_ANAT"
colnames(puf_aio13)[colnames(puf_aio13)=="AIO_PREMED_ASPIRIN"] <- "TAR_PREMED_ASPIRIN"
colnames(puf_aio13)[colnames(puf_aio13)=="AIO_PREMED_STATIN"] <- "TAR_PREMED_STATIN"
colnames(puf_aio13)[colnames(puf_aio13)=="AIO_PREMED_BETAB"] <- "TAR_PREMED_BETAB"
colnames(puf_aio13)[colnames(puf_aio13)=="AIO_PREHEMO"] <- "TAR_PREHEMO"
colnames(puf_aio13)[colnames(puf_aio13)=="AIO_ULP"] <- "TAR_ULP"
colnames(puf_aio13)[colnames(puf_aio13)=="AIO_DULP"] <- "TAR_DULP"
colnames(puf_aio13)[colnames(puf_aio13)=="AIO_BLEEDING"] <- "TAR_BLEEDING"
colnames(puf_aio13)[colnames(puf_aio13)=="AIO_DBLEEDING"] <- "TAR_DBLEEDING"
colnames(puf_aio13)[colnames(puf_aio13)=="AIO_MI_STROKE"] <- "TAR_MI_STROKE"
colnames(puf_aio13)[colnames(puf_aio13)=="AIO_DMI_STROKE"] <- "TAR_DMI_STROKE"
colnames(puf_aio13)[colnames(puf_aio13)=="AIO_WOUND"] <- "TAR_WOUND"
colnames(puf_aio13)[colnames(puf_aio13)=="AIO_DWOUND"] <- "TAR_DWOUND"
colnames(puf_aio13)[colnames(puf_aio13)=="AIO_POSTHEMO"] <- "TAR_POSTHEMO"
colnames(puf_aio13)[colnames(puf_aio13)=="AIO_MOSTSEVOUTCOME"] <- "TAR_MOSTSEVOUTCOME"
colnames(puf_aio13)[colnames(puf_aio13)=="AIO_MRTAS"] <- "TAR_MRTAS"
colnames(puf_aio13)[colnames(puf_aio13)=="AIO_AMPUTATION"] <- "TAR_AMPUTATION"



# Write CSV for merged data set

write.csv(puf_aio_leo_13_21, "P:/Pro00113988 - PAD Risk Models/DataRepo/NSQIP/puf_aio_leo_13_21.txt")
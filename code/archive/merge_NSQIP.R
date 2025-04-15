# Import raw data files----

library(haven)
library(nsqipr)

## Import, align and merge 2013-----

puf13 <- read.delim("P:/Pro00113988 - PAD Risk Models/DataRepo/NSQIP/acs_nsqip_puf13.txt")

aie13 <- read.delim("P:/Pro00113988 - PAD Risk Models/DataRepo/NSQIP/puf_tar_aie_2013.txt")
aio13 <- read.delim("P:/Pro00113988 - PAD Risk Models/DataRepo/NSQIP/puf_tar_aio_2013.txt")
lee13 <- read.delim("P:/Pro00113988 - PAD Risk Models/DataRepo/NSQIP/puf_tar_lee_2013.txt")
leo13 <- read.delim("P:/Pro00113988 - PAD Risk Models/DataRepo/NSQIP/puf_tar_leo_2013.txt")

colnames(aie13)[colnames(aie13)=="CASEID"] <- "CaseID"
colnames(aio13)[colnames(aio13)=="CASEID"] <- "CaseID"
colnames(lee13)[colnames(lee13)=="CASEID"] <- "CaseID"
colnames(leo13)[colnames(leo13)=="CASEID"] <- "CaseID"

puf_aie13 <- merge(puf13,aie13, by='CaseID')
puf_aio13 <- merge(puf13,aio13, by='CaseID')
puf_lee13 <- merge(puf13,lee13, by='CaseID')
puf_leo13 <- merge(puf13,leo13, by='CaseID')

write.csv(puf_aie13, "P:/Pro00113988 - PAD Risk Models/DataRepo/NSQIP/puf_aie13.txt")
write.csv(puf_aio13, "P:/Pro00113988 - PAD Risk Models/DataRepo/NSQIP/puf_aio13.txt")
write.csv(puf_lee13, "P:/Pro00113988 - PAD Risk Models/DataRepo/NSQIP/puf_lee13.txt")
write.csv(puf_leo13, "P:/Pro00113988 - PAD Risk Models/DataRepo/NSQIP/puf_leo13.txt")

rm(list = ls(all.names = TRUE))

## Import, align and merge 2014-----

puf14 <- read.delim("P:/Pro00113988 - PAD Risk Models/DataRepo/NSQIP/acs_nsqip_puf14.txt")

aie14 <- read.delim("P:/Pro00113988 - PAD Risk Models/DataRepo/NSQIP/puf_tar_aie_2014.txt")
aio14 <- read.delim("P:/Pro00113988 - PAD Risk Models/DataRepo/NSQIP/puf_tar_aio_2014.txt")
lee14 <- read.delim("P:/Pro00113988 - PAD Risk Models/DataRepo/NSQIP/puf_tar_lee_2014.txt")
leo14 <- read.delim("P:/Pro00113988 - PAD Risk Models/DataRepo/NSQIP/puf_tar_leo_2014.txt")

colnames(aie14)[colnames(aie14)=="CASEID"] <- "CaseID"
colnames(aio14)[colnames(aio14)=="CASEID"] <- "CaseID"
colnames(lee14)[colnames(lee14)=="CASEID"] <- "CaseID"
colnames(leo14)[colnames(leo14)=="CASEID"] <- "CaseID"

puf_aie14 <- merge(puf14,aie14, by='CaseID')
puf_aio14 <- merge(puf14,aio14, by='CaseID')
puf_lee14 <- merge(puf14,lee14, by='CaseID')
puf_leo14 <- merge(puf14,leo14, by='CaseID')

write.csv(puf_aie14, "P:/Pro00113988 - PAD Risk Models/DataRepo/NSQIP/puf_aie14.txt")
write.csv(puf_aio14, "P:/Pro00113988 - PAD Risk Models/DataRepo/NSQIP/puf_aio14.txt")
write.csv(puf_lee14, "P:/Pro00113988 - PAD Risk Models/DataRepo/NSQIP/puf_lee14.txt")
write.csv(puf_leo14, "P:/Pro00113988 - PAD Risk Models/DataRepo/NSQIP/puf_leo14.txt")

rm(list = ls(all.names = TRUE))

## Import, align and merge 2015-----

puf15 <- read.delim("P:/Pro00113988 - PAD Risk Models/DataRepo/NSQIP/acs_nsqip_puf15_v2.txt")

aie15 <- read.delim("P:/Pro00113988 - PAD Risk Models/DataRepo/NSQIP/puf_tar_aie_2015.txt")
aio15 <- read.delim("P:/Pro00113988 - PAD Risk Models/DataRepo/NSQIP/puf_tar_aio_2015.txt")
lee15 <- read.delim("P:/Pro00113988 - PAD Risk Models/DataRepo/NSQIP/puf_tar_lee_2015.txt")
leo15 <- read.delim("P:/Pro00113988 - PAD Risk Models/DataRepo/NSQIP/puf_tar_leo_2015.txt")

colnames(puf15)[colnames(puf15)=="CASEID"] <- "CaseID"
colnames(puf15)[colnames(puf15)=="AGE"] <- "Age"
colnames(puf15)[colnames(puf15)=="BLEEDIS"] <- "BLEEDDIS"
colnames(puf15)[colnames(puf15)=="DOPERTOD"] <- "DOpertoD"
colnames(puf15)[colnames(puf15)=="DOPTODIS"] <- "DOptoDis"
colnames(puf15)[colnames(puf15)=="OPERYR"] <- "OperYR"
puf15$PGY <- NA
colnames(aie15)[colnames(aie15)=="CASEID"] <- "CaseID"
colnames(aio15)[colnames(aio15)=="CASEID"] <- "CaseID"
colnames(lee15)[colnames(lee15)=="CASEID"] <- "CaseID"
colnames(leo15)[colnames(leo15)=="CASEID"] <- "CaseID"

puf_aie15 <- merge(puf15,aie15, by='CaseID')
puf_aio15 <- merge(puf15,aio15, by='CaseID')
puf_lee15 <- merge(puf15,lee15, by='CaseID')
puf_leo15 <- merge(puf15,leo15, by='CaseID')

write.csv(puf_aie15, "P:/Pro00113988 - PAD Risk Models/DataRepo/NSQIP/puf_aie15.txt")
write.csv(puf_aio15, "P:/Pro00113988 - PAD Risk Models/DataRepo/NSQIP/puf_aio15.txt")
write.csv(puf_lee15, "P:/Pro00113988 - PAD Risk Models/DataRepo/NSQIP/puf_lee15.txt")
write.csv(puf_leo15, "P:/Pro00113988 - PAD Risk Models/DataRepo/NSQIP/puf_leo15.txt")

rm(list = ls(all.names = TRUE))

## Import, align and merge 2016-----

puf16 <- read.delim("P:/Pro00113988 - PAD Risk Models/DataRepo/NSQIP/acs_nsqip_puf16.txt")

aie16 <- read.delim("P:/Pro00113988 - PAD Risk Models/DataRepo/NSQIP/puf_tar_aie_2016.txt")
aio16 <- read.delim("P:/Pro00113988 - PAD Risk Models/DataRepo/NSQIP/puf_tar_aio_2016.txt")
lee16 <- read.delim("P:/Pro00113988 - PAD Risk Models/DataRepo/NSQIP/puf_tar_lee_2016.txt")
leo16 <- read.delim("P:/Pro00113988 - PAD Risk Models/DataRepo/NSQIP/puf_tar_leo_2016.txt")

colnames(puf16)[colnames(puf16)=="AGE"] <- "Age"
colnames(puf16)[colnames(puf16)=="BLEEDIS"] <- "BLEEDDIS"
colnames(puf16)[colnames(puf16)=="DOPERTOD"] <- "DOpertoD"
colnames(puf16)[colnames(puf16)=="DOPTODIS"] <- "DOptoDis"
colnames(puf16)[colnames(puf16)=="OPERYR"] <- "OperYR"
puf16$PGY <- NA
colnames(aie16)[colnames(aie16)=="CASEID"] <- "CaseID"
colnames(aio16)[colnames(aio16)=="CASEID"] <- "CaseID"
colnames(lee16)[colnames(lee16)=="CASEID"] <- "CaseID"
colnames(leo16)[colnames(leo16)=="CASEID"] <- "CaseID"

puf_aie16 <- merge(puf16,aie16, by='CaseID')
puf_aio16 <- merge(puf16,aio16, by='CaseID')
puf_lee16 <- merge(puf16,lee16, by='CaseID')
puf_leo16 <- merge(puf16,leo16, by='CaseID')

write.csv(puf_aie16, "P:/Pro00113988 - PAD Risk Models/DataRepo/NSQIP/puf_aie16.txt")
write.csv(puf_aio16, "P:/Pro00113988 - PAD Risk Models/DataRepo/NSQIP/puf_aio16.txt")
write.csv(puf_lee16, "P:/Pro00113988 - PAD Risk Models/DataRepo/NSQIP/puf_lee16.txt")
write.csv(puf_leo16, "P:/Pro00113988 - PAD Risk Models/DataRepo/NSQIP/puf_leo16.txt")

rm(list = ls(all.names = TRUE))

## Import, align and merge 2017-----

puf17 <- read.delim("P:/Pro00113988 - PAD Risk Models/DataRepo/NSQIP/acs_nsqip_puf17.txt")

aie17 <- read.delim("P:/Pro00113988 - PAD Risk Models/DataRepo/NSQIP/puf_tar_aie_2017.txt")
aio17 <- read.delim("P:/Pro00113988 - PAD Risk Models/DataRepo/NSQIP/puf_tar_aio_2017.txt")
lee17 <- read.delim("P:/Pro00113988 - PAD Risk Models/DataRepo/NSQIP/puf_tar_lee_2017.txt")
leo17 <- read.delim("P:/Pro00113988 - PAD Risk Models/DataRepo/NSQIP/puf_tar_leo_2017.txt")

colnames(aie17)[colnames(aie17)=="CASEID"] <- "CaseID"
colnames(aio17)[colnames(aio17)=="CASEID"] <- "CaseID"
colnames(lee17)[colnames(lee17)=="CASEID"] <- "CaseID"
colnames(leo17)[colnames(leo17)=="CASEID"] <- "CaseID"

puf_aie17 <- merge(puf17,aie17, by='CaseID')
puf_aio17 <- merge(puf17,aio17, by='CaseID')
puf_lee17 <- merge(puf17,lee17, by='CaseID')
puf_leo17 <- merge(puf17,leo17, by='CaseID')

write.csv(puf_aie17, "P:/Pro00113988 - PAD Risk Models/DataRepo/NSQIP/puf_aie17.txt")
write.csv(puf_aio17, "P:/Pro00113988 - PAD Risk Models/DataRepo/NSQIP/puf_aio17.txt")
write.csv(puf_lee17, "P:/Pro00113988 - PAD Risk Models/DataRepo/NSQIP/puf_lee17.txt")
write.csv(puf_leo17, "P:/Pro00113988 - PAD Risk Models/DataRepo/NSQIP/puf_leo17.txt")

rm(list = ls(all.names = TRUE))

## Import, align and merge 2018-----

puf18 <- read.delim("P:/Pro00113988 - PAD Risk Models/DataRepo/NSQIP/acs_nsqip_puf18_v2.txt")

aie18 <- read.delim("P:/Pro00113988 - PAD Risk Models/DataRepo/NSQIP/puf_tar_aie_2018.txt")
aio18 <- read.delim("P:/Pro00113988 - PAD Risk Models/DataRepo/NSQIP/puf_tar_aio_2018.txt")
lee18 <- read.delim("P:/Pro00113988 - PAD Risk Models/DataRepo/NSQIP/puf_tar_lee_2018.txt")
leo18 <- read.delim("P:/Pro00113988 - PAD Risk Models/DataRepo/NSQIP/puf_tar_leo_2018.txt")

colnames(aie18)[colnames(aie18)=="CASEID"] <- "CaseID"
colnames(aio18)[colnames(aio18)=="CASEID"] <- "CaseID"
colnames(lee18)[colnames(lee18)=="CASEID"] <- "CaseID"
colnames(leo18)[colnames(leo18)=="CASEID"] <- "CaseID"

puf_aie18 <- merge(puf18,aie18, by='CaseID')
puf_aio18 <- merge(puf18,aio18, by='CaseID')
puf_lee18 <- merge(puf18,lee18, by='CaseID')
puf_leo18 <- merge(puf18,leo18, by='CaseID')

write.csv(puf_aie18, "P:/Pro00113988 - PAD Risk Models/DataRepo/NSQIP/puf_aie18.txt")
write.csv(puf_aio18, "P:/Pro00113988 - PAD Risk Models/DataRepo/NSQIP/puf_aio18.txt")
write.csv(puf_lee18, "P:/Pro00113988 - PAD Risk Models/DataRepo/NSQIP/puf_lee18.txt")
write.csv(puf_leo18, "P:/Pro00113988 - PAD Risk Models/DataRepo/NSQIP/puf_leo18.txt")

rm(list = ls(all.names = TRUE))

## Import, align and mergee 2019-----

puf19 <- read.delim("P:/Pro00113988 - PAD Risk Models/DataRepo/NSQIP/acs_nsqip_puf19.txt")

aie19 <- read.delim("P:/Pro00113988 - PAD Risk Models/DataRepo/NSQIP/puf_tar_aie_2019.txt")
aio19 <- read.delim("P:/Pro00113988 - PAD Risk Models/DataRepo/NSQIP/puf_tar_aio_2019.txt")
lee19 <- read.delim("P:/Pro00113988 - PAD Risk Models/DataRepo/NSQIP/puf_tar_lee_2019.txt")
leo19 <- read.delim("P:/Pro00113988 - PAD Risk Models/DataRepo/NSQIP/puf_tar_leo_2019.txt")

colnames(puf19)[colnames(puf19)=="CASEID"] <- "CaseID"
colnames(aie19)[colnames(aie19)=="CASEID"] <- "CaseID"
colnames(aio19)[colnames(aio19)=="CASEID"] <- "CaseID"
colnames(lee19)[colnames(lee19)=="CASEID"] <- "CaseID"
colnames(leo19)[colnames(leo19)=="CASEID"] <- "CaseID"

puf_aie19 <- merge(puf19,aie19, by='CaseID')
puf_aio19 <- merge(puf19,aio19, by='CaseID')
puf_lee19 <- merge(puf19,lee19, by='CaseID')
puf_leo19 <- merge(puf19,leo19, by='CaseID')

write.csv(puf_aie19, "P:/Pro00113988 - PAD Risk Models/DataRepo/NSQIP/puf_aie19.txt")
write.csv(puf_aio19, "P:/Pro00113988 - PAD Risk Models/DataRepo/NSQIP/puf_aio19.txt")
write.csv(puf_lee19, "P:/Pro00113988 - PAD Risk Models/DataRepo/NSQIP/puf_lee19.txt")
write.csv(puf_leo19, "P:/Pro00113988 - PAD Risk Models/DataRepo/NSQIP/puf_leo19.txt")

rm(list = ls(all.names = TRUE))

## Import, align and merge 2020-----

puf20 <- read.delim("P:/Pro00113988 - PAD Risk Models/DataRepo/NSQIP/acs_nsqip_puf20.txt")

aie20 <- read.delim("P:/Pro00113988 - PAD Risk Models/DataRepo/NSQIP/puf_tar_aie_2020.txt")
aio20 <- read.delim("P:/Pro00113988 - PAD Risk Models/DataRepo/NSQIP/puf_tar_aio_2020.txt")
lee20 <- read.delim("P:/Pro00113988 - PAD Risk Models/DataRepo/NSQIP/puf_tar_lee_2020.txt")
leo20 <- read.delim("P:/Pro00113988 - PAD Risk Models/DataRepo/NSQIP/puf_tar_leo_2020.txt")

colnames(aie20)[colnames(aie20)=="CASEID"] <- "CaseID"
colnames(aio20)[colnames(aio20)=="CASEID"] <- "CaseID"
colnames(lee20)[colnames(lee20)=="CASEID"] <- "CaseID"
colnames(leo20)[colnames(leo20)=="CASEID"] <- "CaseID"

puf_aie20 <- merge(puf20,aie20, by='CaseID')
puf_aio20 <- merge(puf20,aio20, by='CaseID')
puf_lee20 <- merge(puf20,lee20, by='CaseID')
puf_leo20 <- merge(puf20,leo20, by='CaseID')

write.csv(puf_aie20, "P:/Pro00113988 - PAD Risk Models/DataRepo/NSQIP/puf_aie20.txt")
write.csv(puf_aio20, "P:/Pro00113988 - PAD Risk Models/DataRepo/NSQIP/puf_aio20.txt")
write.csv(puf_lee20, "P:/Pro00113988 - PAD Risk Models/DataRepo/NSQIP/puf_lee20.txt")
write.csv(puf_leo20, "P:/Pro00113988 - PAD Risk Models/DataRepo/NSQIP/puf_leo20.txt")

rm(list = ls(all.names = TRUE))

## Import, align and merge 2021-----

puf21 <- read.delim("P:/Pro00113988 - PAD Risk Models/DataRepo/NSQIP/acs_nsqip_puf21.txt")

aie21 <- read.delim("P:/Pro00113988 - PAD Risk Models/DataRepo/NSQIP/puf_tar_aie_2021.txt")
aio21 <- read.delim("P:/Pro00113988 - PAD Risk Models/DataRepo/NSQIP/puf_tar_aio_2021.txt")
lee21 <- read.delim("P:/Pro00113988 - PAD Risk Models/DataRepo/NSQIP/puf_tar_lee_2021.txt")
leo21 <- read.delim("P:/Pro00113988 - PAD Risk Models/DataRepo/NSQIP/puf_tar_leo_2021.txt")

colnames(aie21)[colnames(aie21)=="CASEID"] <- "CaseID"
colnames(aio21)[colnames(aio21)=="CASEID"] <- "CaseID"
colnames(lee21)[colnames(lee21)=="CASEID"] <- "CaseID"
colnames(leo21)[colnames(leo21)=="CASEID"] <- "CaseID"

puf_aie21 <- merge(puf21,aie21, by='CaseID')
puf_aio21 <- merge(puf21,aio21, by='CaseID')
puf_lee21 <- merge(puf21,lee21, by='CaseID')
puf_leo21 <- merge(puf21,leo21, by='CaseID')

write.csv(puf_aie21, "P:/Pro00113988 - PAD Risk Models/DataRepo/NSQIP/puf_aie21.txt")
write.csv(puf_aio21, "P:/Pro00113988 - PAD Risk Models/DataRepo/NSQIP/puf_aio21.txt")
write.csv(puf_lee21, "P:/Pro00113988 - PAD Risk Models/DataRepo/NSQIP/puf_lee21.txt")
write.csv(puf_leo21, "P:/Pro00113988 - PAD Risk Models/DataRepo/NSQIP/puf_leo21.txt")

rm(list = ls(all.names = TRUE))
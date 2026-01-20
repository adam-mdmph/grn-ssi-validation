# Import libraries----

library(nsqipr)

# Test Import data for troubleshooting----

puf13 <- read.delim("P:/Pro00113988 - PAD Risk Models/DataRepo/NSQIP/Data/puf_tar_aio/puf_tar_aio_2013.txt")

# Clean with NSQIPR Package

nsqip("P:/Pro00113988 - PAD Risk Models/DataRepo/NSQIP/Data/acs_nsqip_puf/acs_nsqip_puf21.txt")

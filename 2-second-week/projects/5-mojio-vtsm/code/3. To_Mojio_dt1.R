
#########################################################################
# Follwing code extract records of an individual from new_car_dt1.RData #
#########################################################################

setwd("working directory")

load("new_car_dt1.RData")

# Extract all the data records of an individual based on sources ID (which is unique)
dt1 = data.frame(subset(new_car_dt1, new_car_dt1$source_id==new_car_dt1$source_id[1]))

save(dt1, file='dt1.RData')

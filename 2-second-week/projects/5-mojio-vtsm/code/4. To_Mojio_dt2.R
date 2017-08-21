
#########################################################################
# Follwing code extract records of an individual from new_car_dt2.RData #
#########################################################################

setwd("working directory")

load("new_car_dt2.RData")

# Extract all the data records of an individual based on sources ID (which is unique)
dt2 = data.frame(subset(new_car_dt2, new_car_dt2$source_id==new_car_dt2$source_id[1]))

save(dt2, file='dt2.RData')

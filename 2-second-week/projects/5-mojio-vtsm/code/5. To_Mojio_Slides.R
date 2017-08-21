rm(list = ls())

library(maps)
library(mapdata)

library(gpclib)
gpclibPermit()

library(maptools)
library(sp)
library(ggplot2)
library(ggmap)
library(devtools)
library(bitops)
library(RCurl)
library(httr)
#devtools::install_github("dgrtwo/gganimate")
library(gganimate)
library(RgoogleMaps)
library(cowplot)
library(scales)


###############
### Slide 3 ###
###############

setwd("working directory")

# plot on left

# R Data which represent anon_JN.json.gz
# Transformation of JSON to RData was done in separate R script
load("new_car_dt1.RData") 

us = map_data("state")            # Retreving data to plot US states
ca = map_data("world", "Canada")  # Retreving data to plot Canadian map

# Plots US (states) and Canadian map together and plots data locations (Approximately 1mn) from the data set
m = ggplot(data=new_car_dt1, aes(x=as.numeric(as.character(new_car_dt1$source_Vehicle_Location_Lng)), y=as.numeric(as.character(new_car_dt1$source_Vehicle_Location_Lat))))

m = m + geom_tile()

m = m + geom_polygon(data=us, aes(x=long, y=lat, group=group), colour='black', fill='white')

m = m + geom_polygon(data=ca, aes(x=long, y=lat, group=group), colour='black', fill='white')

m = m + geom_point(data=new_car_dt1, aes(x=as.numeric(as.character(new_car_dt1$source_Vehicle_Location_Lng)), y=as.numeric(as.character(new_car_dt1$source_Vehicle_Location_Lat)), col='red'))

m = m + theme(axis.ticks = element_blank())
m = m + theme(axis.text = element_blank())
m = m + theme(axis.title = element_blank())
m = m + theme(legend.position = 'none')
m


# plot on right

# R Data which represent anon_1N.json.gz
# Transformation of JSON to RData was done in separate R script
load("new_car_dt2.RData") 

us = map_data("state")
ca = map_data("world", "Canada")

# Plots US (states) and Canadian map together and plots data locations (Approximately 1mn) from the data set
m = ggplot(data=new_car_dt2, aes(x=as.numeric(as.character(new_car_dt2$source_Vehicle_Location_Lng)), y=as.numeric(as.character(new_car_dt2$source_Vehicle_Location_Lat))))

m = m + geom_tile()

m = m + geom_polygon(data=us, aes(x=long, y=lat, group=group), colour='black', fill='white')

m = m + geom_polygon(data=ca, aes(x=long, y=lat, group=group), colour='black', fill='white')

m = m + geom_point(data=new_car_dt1, aes(x=as.numeric(as.character(new_car_dt1$source_Vehicle_Location_Lng)), y=as.numeric(as.character(new_car_dt1$source_Vehicle_Location_Lat)), col='red'))

m = m + theme(axis.ticks = element_blank())
m = m + theme(axis.text = element_blank())
m = m + theme(axis.title = element_blank())
m = m + theme(legend.position = 'none')
m


###############
### Slide 4 ###
###############

# plot on left

# Number of unique vehicles given its year of manufacture for SUVs
yrdt = data.frame(id=new_car_dt1$source_id, yr = new_car_dt1$source_Vehicle_VinDetails_Year)
yrdt = unique(yrdt)
ggplot(subset(yrdt, !is.na(yr)), aes(yr)) + geom_bar(colour='black', bg='dodgerblue4') + labs( xlab('Year')) + ylab('Count')

# plot on right

# Number of unique vehicles given its year of manufacture for Sedans
yrdt = data.frame(id=new_car_dt2$source_id, yr = new_car_dt2$source_Vehicle_VinDetails_Year)
yrdt = unique(yrdt)
ggplot(subset(yrdt, !is.na(yr)), aes(yr)) + geom_bar(colour='black', bg='firebrick2') + labs( xlab('Year')) + ylab('Count')


###############
### Slide 5 ###
###############

# plot on left

# Number of unique vehicles given its make for SUVs
mkdt = data.frame(id=new_car_dt1$source_id, mk = new_car_dt1$source_Vehicle_VinDetails_Make)
mkdt = unique(mkdt)
ggplot(subset(mkdt, !is.na(mk)), aes(mk)) + geom_bar(colour='black', bg='dodgerblue4') + labs( xlab('Make')) + ylab('Count')

# plot on right

# Number of unique vehicles given its make for Sedans
mkdt = data.frame(id=new_car_dt2$source_id, mk = new_car_dt2$source_Vehicle_VinDetails_Make)
mkdt = unique(mkdt)
ggplot(subset(mkdt, !is.na(mk)), aes(mk)) + geom_bar(colour='black', bg='firebrick2') + labs( xlab('Make')) + ylab('Count')


###############
### Slide 6 ###
###############

# plot on left

# Number of unique vehicles given its model for SUVs
mddt     = data.frame(id=new_car_dt1$source_id, mk=new_car_dt1$source_Vehicle_VinDetails_Make, md=new_car_dt1$source_Vehicle_VinDetails_Model)
smddt    = subset(mddt, mddt$mk=='Nissan')
smddt$mk = droplevels(smddt)$mk
nmddt    = data.frame(id=smddt$id, md=smddt$md)
nmddt    = unique(nmddt)
ggplot(subset(nmddt, !is.na(md)), aes(md)) + geom_bar(colour='black', bg='dodgerblue4') + labs( xlab('Model')) + ylab('Count')


# plot on right

# Number of unique vehicles given its model for Sedans
mddt     = data.frame(id=new_car_dt2$source_id, mk=new_car_dt2$source_Vehicle_VinDetails_Make, md=new_car_dt2$source_Vehicle_VinDetails_Model)
smddt    = subset(mddt, mddt$mk=='Nissan')
smddt$mk = droplevels(smddt)$mk
nmddt    = data.frame(id=smddt$id, md=smddt$md)
nmddt    = unique(nmddt)
ggplot(subset(nmddt, !is.na(md)), aes(md)) + geom_bar(colour='black', bg='firebrick2') + labs( xlab('Model')) + ylab('Count')


###############
### Slide 7 ###
###############

# plot on left

# Number of unique vehicles given its Engine Capacity for SUVs
egdt     = data.frame(id=new_car_dt1$source_id, mk=new_car_dt1$source_Vehicle_VinDetails_Make, eg=new_car_dt1$source_Vehicle_VinDetails_Engine)
segdt    = subset(egdt, egdt$mk=='Nissan')
segdt$mk = droplevels(segdt)$mk
negdt    = data.frame(id=segdt$id, eg=segdt$eg)
negdt    = unique(negdt)
ggplot(subset(negdt, !is.na(eg)), aes(eg)) + geom_bar(colour='black', bg='dodgerblue4') + labs( xlab('Nissan Engines')) + ylab('Count') + theme(axis.text.x=element_text(angle=50, hjust=1, vjust=1))

# plot on right

# Number of unique vehicles given its Engine Capacity for Sedans
egdt     = data.frame(id=new_car_dt2$source_id, mk=new_car_dt2$source_Vehicle_VinDetails_Make, eg=new_car_dt2$source_Vehicle_VinDetails_Engine)
segdt    = subset(egdt, egdt$mk=='Nissan')
segdt$mk = droplevels(segdt)$mk
negdt    = data.frame(id=segdt$id, eg=segdt$eg)
negdt    = unique(negdt)
ggplot(subset(negdt, !is.na(eg)), aes(eg)) + geom_bar(colour='black', bg='firebrick2') + labs( xlab('Nissan Engines')) + ylab('Count') + theme(axis.text.x=element_text(angle=50, hjust=1, vjust=1))


###############
### Slide 9 ###
###############

# Animation based on all records of an individual from  
# "new_car_dt1.RData" / anon_JN.json.gz data file

load("dt1.RData") 
# The data file dt1 is a subset from new_car_dt1 data file which represent all data rows 
# for the person in the animation
# Retrieving dt1.RData from new_cardt1.RData was done in a separate R script

# Obtaintin Time stamps of the individual who is in dt1.RData excluding all NA values
dt = subset(dt1, is.na(dt1$source_Vehicle_Location_Timestamp)==FALSE)

# Categorizing the time stamps in to two categaries for later use.
# Objective is to indicate the individual in two different colors. One for even days and other for odd days
darr = as.numeric(as.character(substr(as.vector(dt$source_Vehicle_Location_Timestamp), 9, 10)))%%2

# Creating an array to keep the categorised timestamps
colarr = rep(NA, length(darr))

# Categrising dates (odd and even) into two different colors
for (it in 1:length(darr))
{
  if (darr[it]==0) {colarr[it] = "red"}
  if (darr[it]==1) {colarr[it] = "blue"}
}

# Creates a data frame which keeps track of latitude, longitude, odd/even day color, date
# We used Date to create the animation. Thus there are 7741 frames based on this variable
# Also Date will be printed as the title of the plot
# Date is a combination of Actual Date, time, Day of Week, Speen, RPM and Fuel Level.
df = data.frame(long = as.numeric(as.character(dt$source_Vehicle_Location_Lng)),
                lat  = as.numeric(as.character(dt$source_Vehicle_Location_Lat)),
                colarr = colarr,
                date = paste(as.POSIXct(paste(substr(as.vector(dt$source_Vehicle_Location_Timestamp), 1, 10), 
                                              substr(as.vector(dt$source_Vehicle_Location_Timestamp), 12, 19),
                                              sep=" "))," ", weekdays(as.Date(substr(as.vector(dt$source_Vehicle_Location_Timestamp), 1, 10),'%Y-%m-%d')), " ", "RPM:", as.numeric(as.character(dt$source_Vehicle_RPM_Value)), " ", "SPD:", as.numeric(as.character(dt$source_Vehicle_Speed_Value)), " ", "F/L:", as.numeric(as.character(dt$source_Vehicle_FuelLevel_Value))))

# Obtaining the latituge and longitude for each location address
add_dt = data.frame(geocode(as.character(na.omit(unique(dt$source_Vehicle_Location_Address_FormattedAddress)))))

# Getting data to plot a map
map = get_googlemap(center=c(mean(na.omit(df$long)), mean(na.omit(df$lat))), scale = 2, zoom=10)

# Initialize the map
pp = ggmap(map, base_layer=ggplot(data=df, aes(x=long, y=lat, frame=date))) 

# Initial plan was to plot the text of the address on the plot
# But it will make plot unclear, thus ingored this 
# But code here could to plot the text
add_nm = rep(NA, length(unique(dt$source_Vehicle_Location_Address_FormattedAddress)))

for (it in 1:length(unique(dt$source_Vehicle_Location_Address_FormattedAddress)))
{
  temp = unlist(strsplit(as.character(unique(dt$source_Vehicle_Location_Address_FormattedAddress)[it]), ","))
  add_nm[it] = temp[1]
}

# Plots moving locations
pp = pp + geom_point(data=df, aes(x=long, y=lat), size=5, color=as.character(colarr))

# Tried to change the color of the title according to the moving indicator, but this does not work
# Need to figure out an alternative way
pp = pp + theme(plot.title = element_text(colour = as.character(df$colarr)))

# Location that this person visit
pp = pp + annotate("point", x=add_dt$lon, y=add_dt$lat, col='black', bg='black', pch=20, size=4)

pp = pp + theme(axis.ticks = element_blank())

pp = pp + theme(axis.text = element_blank())

pp = pp + theme(axis.line = element_blank())

pp = pp + theme(axis.title = element_blank())

# Creates the mp4 with an interval of 0.05 seconds between two frames
gganimate(pp, "Nissanv6.mp4", interval=0.05)


################
### Slide 10 ###
################

# plot on the left

load("dt1.RData") 
# The data file dt1 is a subset from new_car_dt1 data file which represent all data rows 
# for the person in the animation
# Simply this plots all the locations of the individual for each time stamp
# An overall look for a period of three week in a single frame

dt = subset(dt1, is.na(dt1$source_Vehicle_Location_Timestamp)==FALSE)

# Creates a data frame which keeps track of latitude, longitude, odd/even day color, date
# We used Date to create the animation. Thus there are 7741 frames based on this variable
# Also Date will be printed as the title of the plot
# Date is a combination of Actual Date, time, Day of Week, Speen, RPM and Fuel Level.
df = data.frame(long = as.numeric(as.character(dt$source_Vehicle_Location_Lng)),
                lat  = as.numeric(as.character(dt$source_Vehicle_Location_Lat)),
                colarr = colarr,
                date = paste(as.POSIXct(paste(substr(as.vector(dt$source_Vehicle_Location_Timestamp), 1, 10), 
                                              substr(as.vector(dt$source_Vehicle_Location_Timestamp), 12, 19),
                                              sep=" "))," ", weekdays(as.Date(substr(as.vector(dt$source_Vehicle_Location_Timestamp), 1, 10),'%Y-%m-%d')), " ", "RPM:", as.numeric(as.character(dt$source_Vehicle_RPM_Value)), " ", "SPD:", as.numeric(as.character(dt$source_Vehicle_Speed_Value)), " ", "F/L:", as.numeric(as.character(dt$source_Vehicle_FuelLevel_Value))))

ggmap(map, extent = "device") + geom_point(data=df, aes(x=long, y=lat, col='dodgerblue4'))



# plot on the right

load("dt2.RData") 
# The data file dt2 is a subset from new_car_dt2 data file which represent all data rows 
# for the person in the animation
# Simply this plots all the locations of the individual for each time stamp
# An overall look for a period of three week in a single frame

dt = subset(dt2, is.na(dt1$source_Vehicle_Location_Timestamp)==FALSE)

df = data.frame(long = as.numeric(as.character(dt$source_Vehicle_Location_Lng)),
                lat  = as.numeric(as.character(dt$source_Vehicle_Location_Lat)),
                colarr = colarr,
                date = paste(as.POSIXct(paste(substr(as.vector(dt$source_Vehicle_Location_Timestamp), 1, 10), 
                                              substr(as.vector(dt$source_Vehicle_Location_Timestamp), 12, 19),
                                              sep=" "))," ", weekdays(as.Date(substr(as.vector(dt$source_Vehicle_Location_Timestamp), 1, 10),'%Y-%m-%d')), " ", "RPM:", as.numeric(as.character(dt$source_Vehicle_RPM_Value)), " ", "SPD:", as.numeric(as.character(dt$source_Vehicle_Speed_Value)), " ", "F/L:", as.numeric(as.character(dt$source_Vehicle_FuelLevel_Value))))

ggmap(map, extent = "device") + geom_point(data=df, aes(x=long, y=lat, col='firebrick3'))


################
### Slide 11 ###
################

# plot on the top left

load("dt1.RData")

dt = subset(dt1, is.na(dt1$source_Vehicle_Location_Timestamp)==FALSE)

# Plots scatter plot of Speed vs RPM for individual in dt1 for all his/her data points
spdrpm = ggplot(subset(dt, (!is.na(source_Vehicle_Speed_Value) & !is.na(source_Vehicle_RPM_Value))), aes(x=as.numeric(as.character(source_Vehicle_RPM_Value)), y=as.numeric(as.character(source_Vehicle_Speed_Value))))
spdrpm = spdrpm + geom_point(col='dodgerblue4', bg='dodgerblue4') + xlab('RPM') + ylab('Speed') + xlim(0,7500) + ylim(0,90)
spdrpm


# plot on the top right

load("dt2.RData")

dt = subset(dt2, is.na(dt1$source_Vehicle_Location_Timestamp)==FALSE)

# Plots scatter plot of Speed vs RPM for individual in dt1 for all his/her data points
spdrpm = ggplot(subset(dt, (!is.na(source_Vehicle_Speed_Value) & !is.na(source_Vehicle_RPM_Value))), aes(x=as.numeric(as.character(source_Vehicle_RPM_Value)), y=as.numeric(as.character(source_Vehicle_Speed_Value))))
spdrpm = spdrpm + geom_point(col='firebrick3', bg='firebrick3') + xlab('RPM') + ylab('Speed') + xlim(0,7500) + ylim(0,90)
spdrpm


################
### Slide 12 ###
################

# 4 animated plots

load("dt1.RData")

# This animation just focusses on 2016-06-10
# The background of the animation is plots in slide 10
# Moving indicator it is locations which individual visted on 2016-06-10
dt = subset(dt1, is.na(dt1$source_Vehicle_Location_Timestamp)==FALSE)

dtf = data.frame(long = as.numeric(as.character(dt$source_Vehicle_Location_Lng)),
                 lat  = as.numeric(as.character(dt$source_Vehicle_Location_Lat)),
                 date = paste(as.POSIXct(paste(substr(as.vector(dt$source_Vehicle_Location_Timestamp), 1, 10), 
                                               substr(as.vector(dt$source_Vehicle_Location_Timestamp), 12, 19),
                                               sep=" "))," ", weekdays(as.Date(substr(as.vector(dt$source_Vehicle_Location_Timestamp), 1, 10),'%Y-%m-%d')), " ", "RPM:", as.numeric(as.character(dt$source_Vehicle_RPM_Value)), " ", "SPD:", as.numeric(as.character(dt$source_Vehicle_Speed_Value)), " ", "F/L:", as.numeric(as.character(dt$source_Vehicle_FuelLevel_Value))))

dtd = subset(dt, substr(dt$source_Vehicle_Location_Timestamp, 1, 10)=="2016-06-10")

df = data.frame(long = as.numeric(as.character(dtd$source_Vehicle_Location_Lng)),
                lat  = as.numeric(as.character(dtd$source_Vehicle_Location_Lat)),
                spd  = as.numeric(as.character(dtd$source_Vehicle_Speed_Value)),
                rpm  = as.numeric(as.character(dtd$source_Vehicle_RPM_Value)),
                acc  = as.numeric(as.character(dtd$source_Vehicle_Acceleration_Value)),
                dcc  = as.numeric(as.character(dtd$source_Vehicle_Deceleration_Value)),
                date = paste(as.POSIXct(paste(substr(as.vector(dtd$source_Vehicle_Location_Timestamp), 1, 10), 
                                              substr(as.vector(dtd$source_Vehicle_Location_Timestamp), 12, 19),
                                              sep=" "))," ", weekdays(as.Date(substr(as.vector(dtd$source_Vehicle_Location_Timestamp), 1, 10),'%Y-%m-%d')), " ", "RPM:", as.numeric(as.character(dtd$source_Vehicle_RPM_Value)), " ", "SPD:", as.numeric(as.character(dtd$source_Vehicle_Speed_Value)), " ", "F/L:", as.numeric(as.character(dtd$source_Vehicle_FuelLevel_Value))))


map = get_googlemap(center=c(mean(na.omit(dtf$long)), mean(na.omit(dtf$lat))), scale = 2, zoom=10)

pp = ggmap(map) 

pp = pp + geom_point(data=dtf, aes(x=long, y=lat), col='dodgerblue4')

# For me I couldn't give the frame argument within geom_point as it tend to lead to an warning
# To overcome I had to use the function suppressWarnings
# Also I had to use '<-' instead of usual '=' notation
suppressWarnings(pp <- pp + geom_point(data=df, aes(x=long, y=lat, frame=date), size=5, color='red'))

pp = pp + theme(plot.title = element_text(colour = "red"))

pp = pp + theme(axis.ticks = element_blank())

pp = pp + theme(axis.text = element_blank())

pp = pp + theme(axis.line = element_blank())

pp = pp + theme(axis.title = element_blank())

gganimate(pp, "outfile2.mp4", interval=0.1)


####################################################################

# An animated scatter plot of Speed and RPM
# Background represents all data points
# Moving indicator is the Speed and RPM on 2016-06-10
spdrpm = ggplot(subset(dt, (!is.na(source_Vehicle_Speed_Value) & !is.na(source_Vehicle_RPM_Value))), aes(x=as.numeric(as.character(source_Vehicle_RPM_Value)), y=as.numeric(as.character(source_Vehicle_Speed_Value))))
spdrpm = spdrpm + geom_point(col='dodgerblue4', bg='dodgerblue4') + xlab('RPM') + ylab('Speed') + xlim(0,7500) + ylim(0,90)

# For me I couldn't give the frame argument within geom_point as it tend to lead to an warning
# To overcome I had to use the function suppressWarnings
# Also I had to use '<-' instead of usual '=' notation
suppressWarnings(spdrpm <- spdrpm + geom_point(data=df, aes(x=rpm, y=spd, frame=date), col='red', bg='red', size=5))
spdrpm = spdrpm + theme(plot.title = element_text(colour = "red"))
gganimate(spdrpm, "spdrpm.mp4", interval=0.1)

####################################################################

# An animated scatter plot of Speed and Accelerations
# Background represents all data points
# Moving indicator is the Speed and Acceleration on 2016-06-10
spdacc = ggplot(subset(dt, (!is.na(source_Vehicle_Acceleration_Value) & !is.na(source_Vehicle_Speed_Value))), aes(x=as.numeric(as.character(source_Vehicle_Acceleration_Value)), y=as.numeric(as.character(source_Vehicle_Speed_Value))))
spdacc = spdacc + geom_point(col='dodgerblue4', bg='dodgerblue4') + xlab('Acceleration') + ylab('Speed') + xlim(0,12) + ylim(0, 90)

# For me I couldn't give the frame argument within geom_point as it tend to lead to an warning
# To overcome I had to use the function suppressWarnings
# Also I had to use '<-' instead of usual '=' notation
suppressWarnings(spdacc <- spdacc + geom_point(data=df, aes(x=acc, y=spd, frame=date), col='red', bg='red', size=5))
spdacc = spdacc + theme(plot.title = element_text(colour = "red"))
gganimate(spdacc, "spdacc.mp4", interval=0.1)

####################################################################

# An animated scatter plot of Speed and Deceleration
# Background represents all data points
# Moving indicator is the Speed and Deceleration on 2016-06-10
spddcc = ggplot(subset(dt, (!is.na(source_Vehicle_Deceleration_Value) & !is.na(source_Vehicle_Speed_Value))), aes(x=as.numeric(as.character(source_Vehicle_Deceleration_Value)), y=as.numeric(as.character(source_Vehicle_Speed_Value))))
spddcc = spddcc + geom_point(col='dodgerblue4', bg='dodgerblue4') + xlab('Deceleration') + ylab('Speed') + xlim(0,12) + ylim(0, 90)

# For me I couldn't give the frame argument within geom_point as it tend to lead to an warning
# To overcome I had to use the function suppressWarnings
# Also I had to use '<-' instead of usual '=' notation
suppressWarnings(spddcc <- spddcc + geom_point(data=df, aes(x=acc, y=spd, frame=date), col='red', bg='red', size=5))
spddcc = spddcc + theme(plot.title = element_text(colour = "red"))
gganimate(spddcc, "spddcc.mp4", interval=0.1)



################
### Slide 13 ###
################

# 4 animated plots
# A similar approach to slide 12 was followed in slide 13
load("dt2.RData")

dt = subset(dt2, is.na(dt2$source_Vehicle_Location_Timestamp)==FALSE)

dtf = data.frame(long = as.numeric(as.character(dt$source_Vehicle_Location_Lng)),
                 lat  = as.numeric(as.character(dt$source_Vehicle_Location_Lat)),
                 date = paste(as.POSIXct(paste(substr(as.vector(dt$source_Vehicle_Location_Timestamp), 1, 10), 
                                               substr(as.vector(dt$source_Vehicle_Location_Timestamp), 12, 19),
                                               sep=" "))," ", weekdays(as.Date(substr(as.vector(dt$source_Vehicle_Location_Timestamp), 1, 10),'%Y-%m-%d')), " ", "RPM:", as.numeric(as.character(dt$source_Vehicle_RPM_Value)), " ", "SPD:", as.numeric(as.character(dt$source_Vehicle_Speed_Value)), " ", "F/L:", as.numeric(as.character(dt$source_Vehicle_FuelLevel_Value))))

dtd = subset(dt, substr(dt$source_Vehicle_Location_Timestamp, 1, 10)=="2016-06-10")

df = data.frame(long = as.numeric(as.character(dtd$source_Vehicle_Location_Lng)),
                lat  = as.numeric(as.character(dtd$source_Vehicle_Location_Lat)),
                spd  = as.numeric(as.character(dtd$source_Vehicle_Speed_Value)),
                rpm  = as.numeric(as.character(dtd$source_Vehicle_RPM_Value)),
                acc  = as.numeric(as.character(dtd$source_Vehicle_Acceleration_Value)),
                dcc  = as.numeric(as.character(dtd$source_Vehicle_Deceleration_Value)),
                date = paste(as.POSIXct(paste(substr(as.vector(dtd$source_Vehicle_Location_Timestamp), 1, 10), 
                                              substr(as.vector(dtd$source_Vehicle_Location_Timestamp), 12, 19),
                                              sep=" "))," ", weekdays(as.Date(substr(as.vector(dtd$source_Vehicle_Location_Timestamp), 1, 10),'%Y-%m-%d')), " ", "RPM:", as.numeric(as.character(dtd$source_Vehicle_RPM_Value)), " ", "SPD:", as.numeric(as.character(dtd$source_Vehicle_Speed_Value)), " ", "F/L:", as.numeric(as.character(dtd$source_Vehicle_FuelLevel_Value))))


map = get_googlemap(center=c(mean(na.omit(dtf$long)), mean(na.omit(dtf$lat))), scale = 2, zoom=10)

pp = ggmap(map) 

pp = pp + geom_point(data=dtf, aes(x=long, y=lat), col='firebrick3')

suppressWarnings(pp <- pp + geom_point(data=df, aes(x=long, y=lat, frame=date), size=5, color='blue'))

pp = pp + theme(plot.title = element_text(colour = "blue"))

pp = pp + theme(axis.ticks = element_blank())

pp = pp + theme(axis.text = element_blank())

pp = pp + theme(axis.line = element_blank())

pp = pp + theme(axis.title = element_blank())

gganimate(pp, "mapdt2.mp4", interval=0.1)


####################################################################

# An animated scatter plot of Speed and RPM
spdrpm = ggplot(subset(dt, (!is.na(source_Vehicle_Speed_Value) & !is.na(source_Vehicle_RPM_Value))), aes(x=as.numeric(as.character(source_Vehicle_RPM_Value)), y=as.numeric(as.character(source_Vehicle_Speed_Value))))
spdrpm = spdrpm + geom_point(col='firebrick3', bg='firebrick3') + xlab('RPM') + ylab('Speed') + xlim(0,7500) + ylim(0,90)
suppressWarnings(spdrpm <- spdrpm + geom_point(data=df, aes(x=rpm, y=spd, frame=date), col='blue', bg='blue', size=5))
spdrpm = spdrpm + theme(plot.title = element_text(colour = "blue"))
gganimate(spdrpm, "spdrpm2.mp4", interval=0.1)

####################################################################

# An animated scatter plot of Speed and Acceleration
spdacc = ggplot(subset(dt, (!is.na(source_Vehicle_Acceleration_Value) & !is.na(source_Vehicle_Speed_Value))), aes(x=as.numeric(as.character(source_Vehicle_Acceleration_Value)), y=as.numeric(as.character(source_Vehicle_Speed_Value))))
spdacc = spdacc + geom_point(col='firebrick3', bg='firebrick3') + xlab('Acceleration') + ylab('Speed') + xlim(0,12) + ylim(0, 90)
suppressWarnings(spdacc <- spdacc + geom_point(data=df, aes(x=acc, y=spd, frame=date), col='blue', bg='blue', size=5))
spdacc = spdacc + theme(plot.title = element_text(colour = "blue"))
gganimate(spdacc, "spdacc2.mp4", interval=0.1)

####################################################################

# An animated scatter plot of Speed and Deceleration
spddcc = ggplot(subset(dt, (!is.na(source_Vehicle_Deceleration_Value) & !is.na(source_Vehicle_Speed_Value))), aes(x=as.numeric(as.character(source_Vehicle_Deceleration_Value)), y=as.numeric(as.character(source_Vehicle_Speed_Value))))
spddcc = spddcc + geom_point(col='firebrick3', bg='firebrick3') + xlab('Deceleration') + ylab('Speed') + xlim(0,12) + ylim(0, 90)
suppressWarnings(spddcc <- spddcc + geom_point(data=df, aes(x=acc, y=spd, frame=date), col='blue', bg='blue', size=5))
spddcc = spddcc + theme(plot.title = element_text(colour = "blue"))
gganimate(spddcc, "spddcc2.mp4", interval=0.1)


################
### Slide 14 ###
################

# Plots on right

load("dt1.RData")

dt = subset(dt1, is.na(dt2$source_Vehicle_Location_Timestamp)==FALSE)

dtn = subset(dt, as.Date(dt$source_Vehicle_Location_Timestamp, format='%Y-%m-%d')=="2016-06-10")

# Scatterplot of Speed and Acceleration on 2016-06-10 for individual in dt1
spdacc = ggplot(subset(dtn, (!is.na(source_Vehicle_Acceleration_Value) & !is.na(source_Vehicle_Speed_Value))), aes(x=as.numeric(as.character(source_Vehicle_Acceleration_Value)), y=as.numeric(as.character(source_Vehicle_Speed_Value))))
spdacc = spdacc + geom_point(col='dodgerblue4', bg='dodgerblue4') + xlab('Acceleration') + ylab('Speed') + xlim(0,12) + ylim(0, 90)
spdacc

# Scatterplot of Speed and Deceleration on 2016-06-10 for individual in dt1
spddcc = ggplot(subset(dtn, (!is.na(source_Vehicle_Deceleration_Value) & !is.na(source_Vehicle_Speed_Value))), aes(x=as.numeric(as.character(source_Vehicle_Deceleration_Value)), y=as.numeric(as.character(source_Vehicle_Speed_Value))))
spddcc = spddcc + geom_point(col='dodgerblue4', bg='dodgerblue4') + xlab('Deceleration') + ylab('Speed') + xlim(0,12) + ylim(0, 90)
spddcc

# Scatterplot of RPM and Acceleration on 2016-06-10 for individual in dt1
rpmacc = ggplot(subset(dtn, (!is.na(source_Vehicle_Acceleration_Value) & !is.na(source_Vehicle_RPM_Value))), aes(x=as.numeric(as.character(source_Vehicle_Acceleration_Value)), y=as.numeric(as.character(source_Vehicle_RPM_Value))))
rpmacc = rpmacc + geom_point(col='dodgerblue4', bg='dodgerblue4') + xlab('Acceleration') + ylab('RPM') + xlim(0,12) + ylim(0, 7500)
rpmacc


# Plots on left

load("dt2.RData")

dt = subset(dt2, is.na(dt2$source_Vehicle_Location_Timestamp)==FALSE)

dtn = subset(dt, as.Date(dt$source_Vehicle_Location_Timestamp, format='%Y-%m-%d')=="2016-06-10")

# Scatterplot of Speed and Acceleration on 2016-06-10 for individual in dt2
spdacc = ggplot(subset(dtn, (!is.na(source_Vehicle_Acceleration_Value) & !is.na(source_Vehicle_Speed_Value))), aes(x=as.numeric(as.character(source_Vehicle_Acceleration_Value)), y=as.numeric(as.character(source_Vehicle_Speed_Value))))
spdacc = spdacc + geom_point(col='firebrick3', bg='firebrick3') + xlab('Acceleration') + ylab('Speed') + xlim(0,12) + ylim(0, 90)
spdacc

# Scatterplot of Speed and Acceleration on 2016-06-10 for individual in dt2
spddcc = ggplot(subset(dtn, (!is.na(source_Vehicle_Deceleration_Value) & !is.na(source_Vehicle_Speed_Value))), aes(x=as.numeric(as.character(source_Vehicle_Deceleration_Value)), y=as.numeric(as.character(source_Vehicle_Speed_Value))))
spddcc = spddcc + geom_point(col='firebrick3', bg='firebrick3') + xlab('Deceleration') + ylab('Speed') + xlim(0,12) + ylim(0, 90)
spddcc

# Scatterplot of RPM and Acceleration on 2016-06-10 for individual in dt2
rpmacc = ggplot(subset(dtn, (!is.na(source_Vehicle_Acceleration_Value) & !is.na(source_Vehicle_RPM_Value))), aes(x=as.numeric(as.character(source_Vehicle_Acceleration_Value)), y=as.numeric(as.character(source_Vehicle_RPM_Value))))
rpmacc = rpmacc + geom_point(col='firebrick3', bg='firebrick3') + xlab('Acceleration') + ylab('RPM') + xlim(0,12) + ylim(0, 7500)
rpmacc

################
### Slide 15 ###
################

# Plots on left

load("dt1.RData")

dt = subset(dt1, is.na(dt2$source_Vehicle_Location_Timestamp)==FALSE)

# Scatterplot of Speed and Acceleration for all data points for individual in dt1
spdacc = ggplot(subset(dt, (!is.na(source_Vehicle_Acceleration_Value) & !is.na(source_Vehicle_Speed_Value))), aes(x=as.numeric(as.character(source_Vehicle_Acceleration_Value)), y=as.numeric(as.character(source_Vehicle_Speed_Value))))
spdacc = spdacc + geom_point(col='dodgerblue4', bg='dodgerblue4') + xlab('Acceleration') + ylab('Speed') + xlim(0,12) + ylim(0, 90)
spdacc

# Scatterplot of Speed and Deceleration for all data points for individual in dt1
spddcc = ggplot(subset(dt, (!is.na(source_Vehicle_Deceleration_Value) & !is.na(source_Vehicle_Speed_Value))), aes(x=as.numeric(as.character(source_Vehicle_Deceleration_Value)), y=as.numeric(as.character(source_Vehicle_Speed_Value))))
spddcc = spddcc + geom_point(col='dodgerblue4', bg='dodgerblue4') + xlab('Deceleration') + ylab('Speed') + xlim(0,12) + ylim(0, 90)
spddcc

# Scatterplot of RPM and Acceleration for all data points for individual in dt1
rpmacc = ggplot(subset(dt, (!is.na(source_Vehicle_Acceleration_Value) & !is.na(source_Vehicle_RPM_Value))), aes(x=as.numeric(as.character(source_Vehicle_Acceleration_Value)), y=as.numeric(as.character(source_Vehicle_RPM_Value))))
rpmacc = rpmacc + geom_point(col='dodgerblue4', bg='dodgerblue4') + xlab('Acceleration') + ylab('RPM') + xlim(0,12) + ylim(0, 7500)
rpmacc


# Plots on right

load("dt2.RData")

dt = subset(dt2, is.na(dt2$source_Vehicle_Location_Timestamp)==FALSE)

# Scatterplot of Speed and Acceleration for all data points for individual in dt2
spdacc = ggplot(subset(dt, (!is.na(source_Vehicle_Acceleration_Value) & !is.na(source_Vehicle_Speed_Value))), aes(x=as.numeric(as.character(source_Vehicle_Acceleration_Value)), y=as.numeric(as.character(source_Vehicle_Speed_Value))))
spdacc = spdacc + geom_point(col='firebrick3', bg='firebrick3') + xlab('Acceleration') + ylab('Speed') + xlim(0,12) + ylim(0, 90)
spdacc

# Scatterplot of Speed and Deceleration for all data points for individual in dt2
spddcc = ggplot(subset(dt, (!is.na(source_Vehicle_Deceleration_Value) & !is.na(source_Vehicle_Speed_Value))), aes(x=as.numeric(as.character(source_Vehicle_Deceleration_Value)), y=as.numeric(as.character(source_Vehicle_Speed_Value))))
spddcc = spddcc + geom_point(col='firebrick3', bg='firebrick3') + xlab('Deceleration') + ylab('Speed') + xlim(0,12) + ylim(0, 90)
spddcc

# Scatterplot of RPM and Acceleration for all data points for individual in dt2
rpmacc = ggplot(subset(dt, (!is.na(source_Vehicle_Acceleration_Value) & !is.na(source_Vehicle_RPM_Value))), aes(x=as.numeric(as.character(source_Vehicle_Acceleration_Value)), y=as.numeric(as.character(source_Vehicle_RPM_Value))))
rpmacc = rpmacc + geom_point(col='firebrick3', bg='firebrick3') + xlab('Acceleration') + ylab('RPM') + xlim(0,12) + ylim(0, 7500)
rpmacc

## This script assumes the data file already exists in current working directory

library(lubridate)

if( !file.exists("./project_data")){ 
  
  dir.create("./project_data") 
  
}

t_household_elec_cosn <-  read.csv("./household_power_consumption.csv",sep=";")

t_household_elec_cosn$Date<-as.Date(strptime(t_household_elec_cosn$Date,'%d / %m / %Y'))

t_household_elec_cosn_sub1 <- t_household_elec_cosn[t_household_elec_cosn$Date==as.Date('2007-02-01'), ]

t_household_elec_cosn_sub2 <- t_household_elec_cosn[t_household_elec_cosn$Date==as.Date('2007-02-02'), ]

t_household_elec_cosn_sub <- rbind(t_household_elec_cosn_sub1,t_household_elec_cosn_sub2)

if( !file.exists("./output")){ 
  
  dir.create("./output") 
  
}



png(filename="./output/plot2.png", width = 480, height = 480, units = "px",bg = "transparent")

complete_date <- as.POSIXlt(paste(t_household_elec_cosn_sub$Date,t_household_elec_cosn_sub$Time))

with(t_household_elec_cosn_sub,plot(complete_date,format(Global_active_power),type="l",xlab="",ylab="Global Active Power (kilowatt)") )


dev.off()
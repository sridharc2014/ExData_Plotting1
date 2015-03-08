## This script assumes the data file already exists in current working directory

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

       
##dev.copy(png,"myfile.png",width=8,height=6,units="in",res=100)
         
         
png(filename="./output/plot1.png", width = 480, height = 480, units = "px",bg = "transparent")
 
hist(as.numeric(household_elec_cosn_sub$Global_active_power) /500,xlab="Global Active Power (kilowatts)",col="Red" ,main='Global Active Power')

dev.off()
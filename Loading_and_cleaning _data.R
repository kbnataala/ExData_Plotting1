#Reading and cleaning the data
power_consumption <- read.table("household_power_consumption.txt", 
                                header=TRUE, 
                                sep=";", 
                                na.strings = "?", 
                                colClasses = c('character',
                                               'character',
                                               'numeric',
                                               'numeric',
                                               'numeric',
                                               'numeric',
                                               'numeric',
                                               'numeric',
                                               'numeric')
                                )
#formating date to Type Date
power_consumption$Date <- as.Date(power_consumption$Date, "%d/%m/%Y")
#Subsetting data set from Febuary 1, 2007 to Febuary 2, 2007
jantofeb_pc <- subset(power_consumption,Date >= as.Date("2007-2-1") & Date <= as.Date("2007-2-2"))
#Removing incomplete observations
jantofeb_pc <- jantofeb_pc[complete.cases(jantofeb_pc),]
#Combining Date and Time column
datetime_jantofeb <- paste(jantofeb_pc$Date, jantofeb_pc$Time)
#Naming the vector
datetime_jantofeb <- setNames(datetime_jantofeb, "datetime_jantofeb")

#Removong Date and Time column
jantofeb_pc <- jantofeb_pc[ ,!(names(jantofeb_pc) %in% c("Date","Time"))]

#Adding Date abd Time column
jantofeb_pc <- cbind(datetime_jantofeb, jantofeb_pc)


#Formatting datetime_jantofeb Column
jantofeb_pc$datetime_jantofeb <- as.POSIXct(datetime_jantofeb)
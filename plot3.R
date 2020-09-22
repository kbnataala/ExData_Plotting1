#Creating Plot 3
with(jantofeb_pc, {
  plot(Sub_metering_1~datetime_jantofeb, type="l",
       ylab="Global Active Power (kilowatts)", xlab="")
  lines(Sub_metering_2~datetime_jantofeb,col='Red')
  lines(Sub_metering_3~datetime_jantofeb,col='Blue')
})
dlegend("topright", col=c("black", "red", "blue"), lwd=c(1,1,1), 
       c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
dev.copy(png, file="plot3.png", height=480, width=480)
dev.off()
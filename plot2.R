## Creating Plot 2
plot(jantofeb_pc$Global_active_power~jantofeb_pc$datetime_jantofeb, type="l", ylab="Global Active Power (kilowatts)", xlab="")
dev.copy(png,"plot2.png", width=480, height=480)
dev.off()
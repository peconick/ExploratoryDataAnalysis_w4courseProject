plot5<-function(NEI=NULL,SCC=NULL){
    ## How have emissions from motor vehicle sources changed from 1999–2008 in Baltimore City?
    
    ## Load Data
    if (is.null(NEI) | is.null(SCC)){
        source("ExploratoryDataAnalysis_w4courseProject.R")
        l<-loadData()
        
        #Read Data
        NEI<-l[[1]]
        SCC<-l[[2]]
        rm(l)
    }
    
    ## Get vehicle-related codes
    SCCVehicleCode<-SCC[grep("Veh",SCC$EI.Sector,fixed = TRUE),]$SCC
    
    ## Subset NEI on vehicle-related codes
    VehicleBaltimoreNEI<-subset(NEI,SCC %in% SCCVehicleCode & fips=="24510")
    
    ## Calculate Emissions
    emissionsTable<-tapply(VehicleBaltimoreNEI$Emissions, VehicleBaltimoreNEI$year, FUN=sum)
    
    
    ## Plot
    plot.new()
    png(filename = "plot5.png",width = 480, height = 480, units = "px")
    
    plot(as.integer(names(emissionsTable)),emissionsTable,pch=19,
         xlab="Year",
         ylab=expression("PM" [2.5]*" (ton)"),
         main=expression("Vehicle-related Emissions in Baltimore (1999 - 2008)")
    )
    
    dev.off()
    cat("NEW PLOT: plot5.png\n",sep="")
    
}

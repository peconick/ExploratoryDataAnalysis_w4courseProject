plot6<-function(NEI=NULL,SCC=NULL){
    ## Compare emissions from motor vehicle sources in Baltimore City with emissions from motor vehicle sources
    ## in Los Angeles County, California (fips == "06037"). Which city has seen greater changes over time in motor 
    ## vehicle emissions?
    
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
    
    ## Subset NEI on vehicle-related codes on Baltimroe and LA
    VehicleBaltiCaliNEI<-subset(NEI,SCC %in% SCCVehicleCode & (fips=="24510" | fips=="06037"))
    
    # calculate sums by year and type
    emissionsTable<-melt(tapply(VehicleBaltiCaliNEI$Emissions, list(VehicleBaltiCaliNEI$year, VehicleBaltiCaliNEI$fips), FUN=sum))
    
    #add names to colimns
    names(emissionsTable)<-c("Year","City", "Emission")
    emissionsTable$City[emissionsTable$City=="24510"]<-"Baltimore"
    emissionsTable$City[emissionsTable$City=="6037"]<-"L.A"
    
    ## Plot
    plot.new()
    png(filename = "plot6.png",width = 480, height = 480, units = "px")
    
    p<-qplot(Year,Emission,data=emissionsTable, color=City)+geom_line()
    p<-p+labs(title = "Vehicle-related Emissions L.A x Baltimore (1999 - 2008)")
    print(p)
    
    dev.off()
    cat("NEW PLOT: plot6.png\n",sep="")
}
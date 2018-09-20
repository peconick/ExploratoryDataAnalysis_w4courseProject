plot4<-function(NEI=NULL){
    ## Across the United States, how have emissions from coal combustion-related sources changed from 1999–2008?
   
     ## Load Data
    if (is.null(NEI)){
        source("ExploratoryDataAnalysis_w4courseProject.R")
        l<-loadData()
        
        #Read Data
        NEI<-l[[1]]
        SCC<-l[[2]]
        rm(l)
    }
    
    ## Get coal combustion-related codes
    SCCCombustionCode<-SCC[grep("Coal",SCC$EI.Sector,fixed = TRUE),]$SCC
    
    ## Subset NEI on coal combustion-related codes
    CoalCombustionNEI<-subset(NEI,SCC %in% SCCCombustionCode)
    
    ## Calculate Emissions
    emissionsTable<-tapply(CoalCombustionNEI$Emissions, CoalCombustionNEI$year, FUN=sum)
    
    
    ## Plot
    plot.new()
    png(filename = "plot4.png",width = 480, height = 480, units = "px")
    
    plot(as.integer(names(emissionsTable)),emissionsTable,pch=19,
         xlab="Year",
         ylab=expression("PM" [2.5]*" (ton)"),
         main=expression("Coal combustion-related Emissions in US (1999 - 2008)")
    )
    
    
    dev.off()
    cat("NEW PLOT: plot4.png\n",sep="")
}

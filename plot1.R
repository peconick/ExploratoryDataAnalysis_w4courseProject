plot1<-function(NEI=NULL){
    ## Have total emissions from PM2.5 decreased in the United States from 1999 to 2008?
    ## Using the base plotting system, make a plot showing the total PM2.5 emission from all sources 
    ## for each of the years 1999, 2002, 2005, and 2008.
    
    ## Load Data
    if (is.null(NEI)){
        source("ExploratoryDataAnalysis_w4courseProject.R")
        l<-loadData()
        
        #Read Data
        NEI<-l[[1]]
        SCC<-l[[2]]
        rm(l)
    }
    
    ## Calculate Emissions
    totalEmissions<-tapply(NEI$Emissions, NEI$year, sum)
    
    ## Plot
    plot.new()
    png(filename = "plot1.png",width = 480, height = 480, units = "px")
    
    plot(as.integer(names(totalEmissions)),totalEmissions,pch=19,
         xlab="Year",
         ylab=expression("PM" [2.5]*" (ton)"),
         main=expression("Emissions in US (1999 - 2008)")
    )
    
    dev.off()
    cat("NEW PLOT: plot1.png\n",sep="")
    
}

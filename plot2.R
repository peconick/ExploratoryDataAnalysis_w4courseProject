plot2<-function(NEI=NULL){
    ## Have total emissions from PM2.5 decreased in the Baltimore City, Maryland (fips == "24510") from 1999 to 2008?
    ## Use the base plotting system to make a plot answering this question.
    
    ## Load Data
    if (is.null(NEI)){
        source("ExploratoryDataAnalysis_w4courseProject.R")
        l<-loadData()
        
        #Read Data
        NEI<-l[[1]]
        SCC<-l[[2]]
        rm(l)
    }
    
    ## Filter Baltimore Data
    baltimoreNEI<-subset(NEI,fips=="24510")
    
    ## Calculate Emissions
    baltimoreEmissions<-tapply(baltimoreNEI$Emissions, baltimoreNEI$year, sum)
    
    ## Plot
    plot.new()
    png(filename = "plot2.png",width = 480, height = 480, units = "px")
    
    plot(as.integer(names(baltimoreEmissions)),baltimoreEmissions,pch=19,
         xlab="Year",
         ylab=expression("PM" [2.5]*" (ton)"),
         main=expression("Emissions in Baltimore (1999 - 2008)")
    )
    
    dev.off()
    cat("NEW PLOT: plot2.png\n",sep="")
}

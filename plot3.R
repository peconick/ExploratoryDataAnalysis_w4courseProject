plot3<-function(NEI=NULL){
    ## Of the four types of sources indicated by the type (point, nonpoint, onroad, nonroad) variable,
    ## which of these four sources have seen decreases in emissions from 1999–2008 for Baltimore City? 
    ## Which have seen increases in emissions from 1999–2008? Use the ggplot2 plotting system to make 
    ## a plot answer this question.
    
    ## Load Data
    if (is.null(NEI)){
        source("ExploratoryDataAnalysis_w4courseProject.R")
        l<-loadData()
        
        #Read Data
        NEI<-l[[1]]
        SCC<-l[[2]]
        rm(l)
    }
    
    library(ggplot2)
    library(reshape)
    #filter baltimore data
    baltimoreNEI<-subset(NEI,fips=="24510")
    
    # calculate sums by year and type
    emissionsTable<-melt(tapply(baltimoreNEI$Emissions, list(baltimoreNEI$year, baltimoreNEI$type), FUN=sum))
    
    #add names to colimns
    names(emissionsTable)<-c("Year","Type", "Emission")
    
    #Plot
    plot.new()
    png(filename = "plot3.png",width = 480, height = 480, units = "px")
    
    p<-qplot(Year,Emission,data=emissionsTable, color=Type)+geom_line()
    p+labs(title = "Baltimore Emissions by Type")
    print(p)
    
    dev.off()
    cat("NEW PLOT: plot3.png\n",sep="")
}

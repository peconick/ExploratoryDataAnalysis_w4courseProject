generateAllPlots<-function(){
    ## This function loads the data a single time and generates all plots
    
    ## Load Data
    l<-loadData()
    
    #Read Data
    NEI<-l[[1]]
    SCC<-l[[2]]
    rm(l)
    
    ## Sourcing all plot scripts
    sapply(c("plot1.R","plot2.R","plot3.R","plot4.R","plot5.R","plot6.R"),source)
    
    ## Generate Plots
    cat("Generating plots...\n")
    
    plot1(NEI)
    plot2(NEI)
    plot3(NEI)
    plot4(NEI)
    plot5(NEI,SCC)
    plot6(NEI,SCC)
    
    cat("All plots generated successfuly.")
    
    
}
loadData<-function(){
    cat("Loading data...")
    
    ## Handle files
    if (!(file.exists("summarySCC_PM25.rds") & file.exists("Source_Classification_Code.rds"))){
        download.file("https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2FNEI_data.zip","dataset.zip")
        zipF<- "dataset.zip"
        unzip(zipF,exdir=getwd())
    }
    if (file.exists("dataset.zip")) file.remove("dataset.zip")
    
    #Read Data
    NEI<-readRDS("summarySCC_PM25.rds")
    SCC <- readRDS("Source_Classification_Code.rds")
    l<-list(NEI,SCC)
    cat("Done!\n")
    l
}





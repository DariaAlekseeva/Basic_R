pollutantmean <- function(directory, pollutant, id = 1:332) {
    ## 'directory' is a character vector of length 1 indicating
    ## the location of the CSV files
    
    ## 'pollutant' is a character vector of length 1 indicating
    ## the name of the pollutant for which we will calculate the
    ## mean; either "sulfate" or "nitrate".
    
    ## 'id' is an integer vector indicating the monitor ID numbers
    ## to be used
    
    ## Return the mean of the pollutant across all monitors list
    ## in the 'id' vector (ignoring NA values)
   
    GrandSum <-0
    GrandSize <-0
    for (each in select_files(directory, id)) {
        file <- read_file(each)
        col_sum <- column_sum(file,pollutant)
        GrandSum <- GrandSum + col_sum
        col_mean <- column_mean(file, pollutant)
        Size <- sample_size(col_sum,col_mean)
        GrandSize <- GrandSize + Size
    }
    GrandSum/GrandSize
}
select_files <- function(directory, id){
    paste(directory,"/",sprintf("%03d",id),'.csv',sep='')
    ch<- character(332)
    ch[id] <- paste(directory,"/",sprintf("%03d",id),'.csv',sep='')
    T <- as.logical(ch>0)
    selected <- ch[T]
}

read_file <- function(filepath) {
    read.csv(filepath)
}

column_sum <- function(file, column) {
    cn <- file[,column]
    cn_sum <- sum(cn, na.rm = TRUE)
}

column_mean <- function(file, column) {
    cn <- file[,column]
    cn_mean <- mean(cn, na.rm = TRUE)
}

sample_size <- function(sum,mean) {
    sum/mean
}


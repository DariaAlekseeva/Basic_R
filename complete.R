complete <- function(directory, id = 1:332) {
    ## 'directory' is a character vector of length 1 indicating
    ## the location of the CSV files
    
    ## 'id' is an integer vector indicating the monitor ID numbers
    ## to be used
    
    ## Return a data frame of the form:
    ## id nobs
    ## 1  117
    ## 2  1041
    ## ...
    ## where 'id' is the monitor ID number and 'nobs' is the
    ## number of complete cases
    
    if (id[1] != sort(id)[1]) {
        id <- sort(id)
    }
    
    nobs <- c()
    for (each in select_files(directory, id)) {
        file <- read_file(each)
        
        filter <- !is.na(file["sulfate"]) & !is.na(file["nitrate"])
        result <- sum(as.numeric(filter))
        nobs <- append(nobs, result)
    }
    data.frame(id = id, nobs = nobs)
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
    
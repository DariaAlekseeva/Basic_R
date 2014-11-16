corr <- function(directory, threshold = 0) {
    ## 'directory' is a character vector of length 1 indicating
    ## the location of the CSV files
    
    ## 'threshold' is a numeric vector of length 1 indicating the
    ## number of completely observed observations (on all
    ## variables) required to compute the correlation between
    ## nitrate and sulfate; the default is 0
    
    ## Return a numeric vector of correlations
    result <- c()
    data <- complete(directory, 1:332)
    filtered <- thresholdfilter(data,threshold,2)
    for (each in filtered[,1]) {
        corl <- cor_calc(directory, each)
        result <- append(result, corl)
    }
    result
}


thresholdfilter <- function(file, threshold, column) {    
    v <- file[,column]
    filter <- v>threshold
    applyfilter <- v[filter]
    ids <- file[,1][filter]
    filtered <- data.frame(ids,applyfilter)
}

cor_calc <- function(directory, ids) {
    filepath <- select_files(directory, ids)
    d <- read_file(filepath)
    filter <- !is.na(d["sulfate"]) & !is.na(d["nitrate"])
    sul <- d["sulfate"][filter]
    nit <- d["nitrate"][filter]
    cor(sul,nit)
}

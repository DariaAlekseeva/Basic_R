rankhospital <- function(state, outcome, num = "best") {
    ## Read outcome data
    data <- read.csv("outcome-of-care-measures.csv", colClasses = "character")
    
    ## Check that state and outcome are valid
    state_names <- unique(data$State)
    outcome_names <- c("heart attack", "heart failure", "pneumonia")
    
    if (!(state %in% state_names)) stop("invalid state") 
    if (!(outcome %in% outcome_names)) stop("invalid outcome")
    
    ## converting outcome
    if (outcome == "heart attack") n_outcome <- 11
    else if (outcome == "heart failure") n_outcome <- 17
    else if (outcome == "pneumonia") n_outcome <- 23
    

    
    ## create many dataframes from the main dataframy by name of state
    byState <- split(data,data$State)
    
    ## pick one DF according to name of state
    df <- byState[[state]]
    
    ## converting column with necessary outcome into numeric values
    df[,n_outcome] <- as.numeric(df[,n_outcome])
    
    
    ## setting up value for best and worst
    if (num == "best") {
        num <-1
        ## sorting DF by outcome from the best to worst
        sortbyoutcome <- df[order(df[,n_outcome],df[,2]),]
    }
            
    else if (num == "worst") {
        num <- 1  
        ## sorting DF by outcome from the worst to best
        sortbyoutcome <- df[order(df[,n_outcome],df[,2],decreasing=T),]
    }
    
    else sortbyoutcome <- df[order(df[,n_outcome],df[,2]),]
    
    ## returns first hospital name in second column (Hospital.Name column)
    sortbyoutcome[num,2]
    
}   
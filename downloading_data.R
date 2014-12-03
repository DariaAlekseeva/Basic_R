# fileUrl <- "https://data.baltimorecity.gov/api/views/dz54-2aru/rows.csv?accessType=DOWNLOAD"
# download.file(fileUrl, destfile = "./data/cameras.csv")
# list.files("./data")
# dateDownloaded <- date()
# print(dateDownloaded)
# cameraData <- read.table("./data/cameras.csv", sep = ",", header = TRUE)
# head(cameraData)


# if(!file.exists("data")){dir.create("data")}
# fileUrl <- "https://data.baltimorecity.gov/api/views/dz54-2aru/rows.xlsx?accessType=DOWNLOAD"
# download.file(fileUrl,destfile="./data/cameras.xlsx")
# dateDownloaded <- date()
# library(xlsx)
# cameraData <- read.xlsx("./data/cameras.xlsx", sheetIndex=1,header=TRUE)
# head(cameraData)



library(XML)
# fileUrl <- "http://www.w3schools.com/xml/simple.xml"
# doc <- xmlTreeParse(fileUrl,useInternal=TRUE)
# rootNode <- xmlRoot(doc)
# xmlName(rootNode)
# names(rootNode)
# rootNode[[1]]
# rootNode[[1]][[1]]
# xmlSApply(rootNode,xmlValue)
# xpathSApply(rootNode,"//name",xmlValue)
# xpathSApply(rootNode,"//price",xmlValue)

fileUrl <- "http://espn.go.com/nfl/team/_/name/bal/baltimore-ravens"
doc <- htmlTreeParse(fileUrl,useInternal=TRUE)
scores <- xpathSApply(doc,"//li[@class='score']",xmlValue)
teams <- xpathSApply(doc,"//li[@class='team-name']",xmlValue)
scores

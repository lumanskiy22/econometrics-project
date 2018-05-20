projectData <- read_csv("~/Desktop/Econometrics Project/DATA-to-import.csv")

sizeOfGovernment <- projectData$`1  Size of Government`
legalSystemPropertyRights <- projectData$`2  Legal System & Property Rights`
soundMoney <- projectData$`3  Sound Money`
freedomTrade <- (projectData$`4  Freedom to trade internationally` != is.na()
regulation <- projectData$`5  Regulation`
lGDP <- projectData$Lgdp


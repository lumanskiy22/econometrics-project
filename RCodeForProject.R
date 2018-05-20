projectData <- read_csv("~/Desktop/Econometrics Project/DATA-to-import.csv")
newProjectData <- projectData[0:159,]

sizeOfGovernment <- as.numeric(newProjectData$`1  Size of Government`)
legalSystemPropertyRights <- as.numeric(newProjectData$`2  Legal System & Property Rights`)
soundMoney <- as.numeric(newProjectData$`3  Sound Money`)
freedomTrade <- as.numeric(newProjectData$`4  Freedom to trade internationally`)
regulation <- as.numeric(newProjectData$`5  Regulation`)
lGDP <- as.numeric(newProjectData$Lgdp)

model1 <- lm(lGDP ~ sizeOfGovernment + legalSystemPropertyRights + soundMoney + freedomTrade + regulation, data=newProjectData)


library(MASS)
library(stargazer)


projectData <- read_csv("~/Desktop/Econometrics Project/DATA-to-import.csv")
newProjectData <- projectData[0:159,]

sizeOfGovernment <- as.numeric(newProjectData$`1  Size of Government`)
legalSystemPropertyRights <- as.numeric(newProjectData$`2  Legal System & Property Rights`)
soundMoney <- as.numeric(newProjectData$`3  Sound Money`)
freedomTrade <- as.numeric(newProjectData$`4  Freedom to trade internationally`)
regulation <- as.numeric(newProjectData$`5  Regulation`)
lGDP <- as.numeric(newProjectData$Lgdp)

model1 <- lm(lGDP ~ sizeOfGovernment + legalSystemPropertyRights + soundMoney + freedomTrade + regulation, data=newProjectData)

summary(model1)

##Now, I want to make unemployment and literacy rates into decimals, not percentages
#For Unemployment Rates
vectorForUnemployment <- c(newProjectData$`Unemployment (%)`)
unemploymentRates <- as.numeric(sub("%","",vectorForUnemployment))/100

#For Literacy Rates
vectorForLiteracy <- c(newProjectData$`Literacy Rates`)
literacyRates <- as.numeric(sub("%","",vectorForLiteracy))/100

##Regression Model including Literacy Rates and Unemployment Rates

model2 <- lm(lGDP ~ sizeOfGovernment + legalSystemPropertyRights + soundMoney + freedomTrade + regulation +unemploymentRates + literacyRates, data=newProjectData)

summary(model2)

##Regression Model with Robust Standard Errors 

model3 <- rlm(lGDP ~ sizeOfGovernment + legalSystemPropertyRights + soundMoney + freedomTrade + regulation +unemploymentRates + literacyRates, data=newProjectData)
summary(model3)

## Do a regression model with just the economic freedom index, literacy rates, and unemployment

## Do subsamples: developing and undeveloped countries or just separate by continents 

##Code for summary statistic table output for Latex 
stargazer(newProjectData)




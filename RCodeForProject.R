library(MASS)
library(stargazer)


library(readxl)
newProjectData <- read_excel("~/Desktop/Econometrics Project/Final-Data.xlsx")


sizeOfGovernment <- as.numeric(newProjectData$gov_size)
legalSystemPropertyRights <- as.numeric(newProjectData$legal)
soundMoney <- as.numeric(newProjectData$money)
freedomTrade <- as.numeric(newProjectData$trade_free)
regulation <- as.numeric(newProjectData$reg)
lGDP <- as.numeric(newProjectData$lgdp)
unemploymentRates <- as.numeric(newProjectData$unemp)
literacyRates <-as.numeric(newProjectData$lit)
overallIndex <- as.numeric(newProjectData$summ_ind)

##Regression Model for log(GDP) and overall index including literacy and unemployment rates
model1 <- lm(lGDP ~ overallIndex + literacyRates + unemploymentRates, data = newProjectData)

summary(model1)
##Regression Model with all variables including Literacy Rates and Unemployment Rates

model2 <- lm(lGDP ~ sizeOfGovernment + legalSystemPropertyRights + soundMoney + freedomTrade + regulation +unemploymentRates + literacyRates, data=newProjectData)

summary(model2)

##Regression Model with Robust Standard Errors 

model3 <- rlm(lGDP ~ sizeOfGovernment + legalSystemPropertyRights + soundMoney + freedomTrade + regulation +unemploymentRates + literacyRates, data=newProjectData)
summary(model3)

##Regression Model with just size of government and legal system
model4 <- lm(lGDP ~ sizeOfGovernment + legalSystemPropertyRights + literacyRates + unemploymentRates)
summary(model4)
## Do subsamples: developing and undeveloped countries or just separate by continents 

##Code for summary statistic table output for Latex 
stargazer(newProjectData)

#Code for regression tables 
stargazer(model1, model2, model3, model4)


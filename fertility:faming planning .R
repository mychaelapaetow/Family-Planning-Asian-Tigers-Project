#Fertility / Family Planning Asian Tigers 
library(lmtest)
library(ggplot2)
library(quantmod)
library(xts)
library(gridExtra)
library(stargazer)
library(xlsx)
library(rJava)
library(readxl)
library(mFilter)

#Hong Kong 
hongkong_data <- read_excel(file.choose("hongkong.xlsx"))

ggplot2::ggplot(data = hongkong_data, mapping = aes(x=Year, y=TFR))+
  geom_line()+
  labs(title = "Hong Kong Total Fertility Rate (1960-2000)")+
  labs(caption = "based on data from the World Bank")+
  xlab("Year")+
  ylab("Total Fertility Rate")

#Singapore 
singapore_data <- read_excel(file.choose("singapore.xlsx"))

ggplot2::ggplot(data = singapore_data, mapping = aes(x=Year, y=TFR))+
  geom_line()+
  labs(title = "Singapore Total Fertility Rate (1960-2000)")+
  labs(caption = "based on data from the World Bank")+
  xlab("Year")+
  ylab("Total Fertility Rate")

#Taiwan 
taiwan_data <- read_excel(file.choose("taiwan.xlsx"))

ggplot2::ggplot(data = taiwan_data, mapping = aes(x=Year, y=TFR))+
  geom_line()+
  labs(title = "Taiwan Total Fertility Rate (1960-2000)")+
  labs(caption = "based on data from macrotrends")+
  xlab("Year")+
  ylab("Total Fertility Rate")

#South Korea
southkorea_data <- read_excel(file.choose("southkorea.xlsx"))

ggplot2::ggplot(data = southkorea_data, mapping = aes(x=Year, y=TFR))+
  geom_line()+
  labs(title = "South Korea Total Fertility Rate (1960-2000)")+
  labs(caption = "based on data from the World Bank")+
  xlab("Year")+
  ylab("Total Fertility Rate")


#Growth 
ggplot() + 
  geom_line(data = hongkong_data, aes(x = Year, y = GDP, colour='blue'), size=0.5) +
  geom_line(data = singapore_data, aes(x = Year, y = GDP, colour='red'), size=0.5) +
  geom_line(data = southkorea_data, aes(x = Year, y = GDP, colour='yellow'), size=0.5) +
  geom_line(data = taiwan_data, aes(x = Year, y = GDP, colour='green'), size=0.5) +
  labs(title = "GDP per capita PPP (1960-2000)")+
  scale_color_discrete(name = " ", labels = c("Hong Kong", "Singapore", "South Korea", "Taiwan"))+
  theme(axis.title.y=element_blank())

#Fertility 
ggplot() + 
  geom_line(data = hongkong_data, aes(x = Year, y = TFR, colour='blue'), size=0.5) +
  geom_line(data = singapore_data, aes(x = Year, y = TFR, colour='red'), size=0.5) +
  geom_line(data = southkorea_data, aes(x = Year, y = TFR, colour='yellow'), size=0.5) +
  geom_line(data = taiwan_data, aes(x = Year, y = TFR, colour='green'), size=0.5) +
  labs(title = "Total Fertility Rate (1960-2000)")+
  scale_color_discrete(name = " ", labels = c("Hong Kong", "Singapore", "South Korea", "Taiwan"))+
  theme(axis.title.y=element_blank())

#Saving
ggplot() + 
  geom_line(data = hongkong_data, aes(x = Year, y = Saving, colour='blue'), size=0.5) +
  geom_line(data = singapore_data, aes(x = Year, y = Saving, colour='red'), size=0.5) +
  geom_line(data = southkorea_data, aes(x = Year, y = Saving, colour='yellow'), size=0.5) +
  labs(title = "Gross Domestic Savings (as % of GDP) (1960-2000)")+
  scale_color_discrete(name = " ", labels = c("Hong Kong", "Singapore", "South Korea"))+
  theme(axis.title.y=element_blank())


#Dependency Ratio
ggplot() + 
  geom_line(data = hongkong_data, aes(x = Year, y = Dep, colour='blue'), size=0.5) +
  geom_line(data = singapore_data, aes(x = Year, y = Dep, colour='red'), size=0.5) +
  geom_line(data = southkorea_data, aes(x = Year, y = Dep, colour='yellow'), size=0.5) +
  labs(title = "Age Dependency Ratio (1960-2000)")+
  scale_color_discrete(name = " ", labels = c("Hong Kong", "Singapore", "South Korea"))+
  theme(axis.title.y=element_blank())

#Contracpetive Prevalence 
con_data <- read_excel(file.choose("contraception.xlsx"))


Plot_hongkong <- ggplot(data=con_data, aes(x=Year, y=Hong)) +
  geom_bar(stat="identity", fill="blue")+
  labs(title = "Hong Kong")+
  ylab("% of women ages 15-49 practicing contraception")

Plot_korea <- ggplot(data=con_data, aes(x=Year, y=Korea)) +
  geom_bar(stat="identity", fill="red")+
  labs(title = "South Korea")+
  ylab("% of women ages 15-49 practicing contraception")

Plot_singapore <- ggplot(data=con_data, aes(x=Year, y=Singapore)) +
  geom_bar(stat="identity", fill="yellow")+
  labs(title = "Singapore")+
  ylab("% of women ages 15-49 practicing contraception")

##Combine each decade graph into a single page
gridExtra::grid.arrange(Plot_hongkong, Plot_korea, Plot_singapore, nrow=1, ncol=3)



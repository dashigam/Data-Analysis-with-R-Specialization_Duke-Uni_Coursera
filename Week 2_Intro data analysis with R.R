install.packages("devtools")
library(devtools)
install.packages("dplyr")
install.packages("ggplot2")
install.packages("shiny")
install_github("StatsWithR/statsr")

library(statsr)
View(arbuthnot)
?arbuthnot
data(arbuthnot)
arbuthnot$boys
arbuthnot$girls

library(ggplot2)
library(dplyr)

mydf <- arbuthnot

mydf%>% 
  ggplot( aes(x=year, y =girls)) + geom_point()

data(present)

present %>%
  ggplot(aes(x=year, y = boys)) +geom_point()

mydf2 <- present %>% 
  mutate(total= boys + girls)
View(mydf2)

mydf2 <- mydf2 %>% 
  mutate(pro_boys= boys/total)
View(mydf2)

mydf2 %>%
  ggplot(aes (x=year, y= pro_boys))+geom_point()

mydf2$more_boys <- mydf2$boys > mydf2&girls

present$more_boys <-present$boys> present$girls

present <- present %>% 
  mutate(boys_to_girls = boys/girls)
present %>% 
ggplot(aes(x=year, y=boys_to_girls)) + geom_point()

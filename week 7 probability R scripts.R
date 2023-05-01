#load required libraries
library(statsr)
library(dplyr)
library(ggplot2)

#load the data
data(kobe_basket)
?kobe_basket


#Q3
kobe_streak <- calc_streak(kobe_basket$shot)
?calc_streak
ggplot(data = kobe_streak, aes(x = length)) +
  geom_histogram(binwidth = 1)
median(kobe_streak$length)
View(kobe_streak)

#Simulations in R
coin_outcomes <- c("heads", "tails")
sample(coin_outcomes, size = 1, replace = TRUE)
sim_fair_coin <- sample(coin_outcomes, size = 100,
                        replace = TRUE)
sim_fair_coin_data <- as.data.frame(sim_fair_coin)

#To view the result of the fair simulation
table(sim_fair_coin_data)

#simulation of unfair coin (only lands heads 20%)
sim_unfair_coin <- sample(coin_outcomes, size = 
                            100, replace = TRUE, prob = c(0.2, 0.8))
table(sim_unfair_coin)

#To view the result of the unfair simulation
sim_unfair_coin_data <- as.data.frame(sim_unfair_coin)
table(sim_unfair_coin_data)

#Simulating the independent shooter
#shot percentage 45%, sample 133 shots
shot_outcomes <- c("H", "M") 
sim_basket <-sample(shot_outcomes, size = 133, replace = TRUE, prob = c(.45, .55))
table(sim_basket)
sim_basket_df <- as.data.frame(sim_basket)

#calculate streak of sim_basket
calc_streak(sim_basket)
sim_basket_streak <- calc_streak(sim_basket)
ggplot(data = sim_basket_streak, aes(x = length)) +
  geom_histogram(binwidth = 1)


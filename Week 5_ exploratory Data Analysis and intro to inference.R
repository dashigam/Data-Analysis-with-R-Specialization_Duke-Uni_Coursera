#Activate libraries
library(statsr)
library(dplyr)
library(ggplot2)

#Load data
data(nycflights)

#To view the names of the variables
names(nycflights)
View(nycflights)

#Investigate the data
?nycflights
#To explore the structure of data
str(nycflights)

# Q1. flights headed to SFO in February
sfo_feb_flights<-nycflights %>% 
  filter(dest=="SFO", month==2)
 
# Q2. arrival delays _ summary statistics
sfo_feb_flights %>% 
  ggplot(aes(x=arr_delay)) + 
  geom_histogram(binwidth = 10, fill = "blue") +
  xlab("Arrival Delay")+ ylab("Frequency")

#Q3. median and interqurtile range for arr_delays, group by carrier
sfo_feb_flights %>% 
  group_by(carrier) %>% 
  summarize(median_delay = median(arr_delay, na.rm = TRUE), 
            IQR_delay = IQR(arr_delay, na.rm = TRUE), sample = n()) 


#Q4. Which month has the highest average dep_delay from NYC airports

nycflights %>%
  group_by(month) %>% 
  summarise(Ave_delay = mean(dep_delay), na.rm=TRUE) %>% 
  arrange(desc(Ave_delay)) 

#Q5. Which month has the highest median departure delay
nycflights %>%
  group_by(month) %>% 
  summarise(Median_delay = median(dep_delay), na.rm=TRUE) %>% 
  arrange(desc(Median_delay)) 
  
#Q7. on-time departure percentage
nycflights %>%
  group_by(origin) %>% 
  summarise(on_time_dep = sum(dep_delay <= 0, na.rm = TRUE)/n()*100,
            delayed_dep = sum(dep_delay > 0, na.rm = TRUE)/n()*100)

              
#Q8. Average speed (distance/tra_hrs)
nycflights <- nycflights %>%
  mutate(Avg_speed = distance/air_time)

#Q9. Scatter plot Avg_speed vs distance
nycflights %>% 
  ggplot(aes(x=distance, y=Avg_speed))+
  geom_point() + 
  labs(title = "Average speed vs distance", x="Distance", y="Average Speed")

#Q10. create arr_type and dep_type
nycflights <- nycflights %>% 
  mutate(arr_type = ifelse(arr_delay <= 0, "on time", "delayed" ), 
         dep_type = ifelse(dep_delay < 5, "on time" , "delayed" ))


delayed_flights <- filter(nycflights, dep_type == "delayed")

on_time_arrival <- delayed_flights %>% 
    filter(arr_type == "on time") %>% 
  nrow()

total_delayed_flights <- delayed_flights %>% nrow()

#Calculate on time arrival %

on_time_arrival_percentage <- on_time_arrival/total_delayed_flights



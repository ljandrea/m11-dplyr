# Exercise 4: DPLYR and flights data

# Install the nycflights13 package and read it in.  Require the dplyr package
# install.packages("nycflights13")
library(nycflights13)
library(dplyr)

# The data.frame flights should now be accessible to you.  View it, 
# and get some basic information about the number of rows/columns
View(flights)

# Add a column that is the amount of time gained in the air (`arr_delay` - `dep_delay`)
flights <- mutate(flights, time_gained_in_air = arr_delay - dep_delay)

# Sort your data.frame desceding by the column you just created
flights <- arrange(flights, desc(time_gained_in_air))

# Try doing the last 2 steps in a single operation using the pipe operator
flights <- flights %>% mutate(time_gained_in_air = arr_delay - dep_delay) %>% arrange(desc(time_gained_in_air))

# Make a histogram of the amount of gain using the `hist` command
hist(flights$time_gained_in_air)

# On average, did flights gain or lose time?
flights.avg <- mean(flights$time_gained_in_air, na.rm = TRUE)

# Create a data.frame that is of flights headed to seatac ('SEA'), 
to.seatac <- filter(flights, dest == 'SEA')

# On average, did flights to seatac gain or loose time?
seatac.avg <- mean(to.seatac$time_gained_in_air, na.rm = TRUE)

### Bonus ###
# Write a function that allows you to specify an origin, a destination, and a column of interest
# that returns a data.frame of flights from the origin to the destination and only the column of interest
## Hint: see slides on standard evaluation


# Retireve the air_time column for flights from JFK to SEA


# What was the average air time of those flights (in hours)?  


# What was the min/max average air time for the JFK to SEA flights?

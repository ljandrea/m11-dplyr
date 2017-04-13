# Exercise 1: Data Frame Practice

# Install devtools package: allows installations from GitHub
install.packages('devtools')

# Install "fueleconomy" package from GitHub
devtools::install_github("hadley/fueleconomy")

# Require/library the fueleconomy package
library(fueleconomy)

# You should have have access to the `vehicles` data.frame
all.vehicles <- data.frame(vehicles)
View(vehicles)

# Create a data.frame of vehicles from 1997
vehicles.1997 <- all.vehicles[all.vehicles$year == 1997, ]

# Use the `unique` function to verify that there is only 1 value in the `year` column of your new data.frame
unique(vehicles.1997$year, incomparables = FALSE)

# Create a data.frame of 2-Wheel Drive vehicles that get more than 20 miles/gallon in the city
two.wheel.drive <- all.vehicles[all.vehicles$drive == '2-Wheel Drive', ]
two.wheel.20 <- two.wheel.drive[two.wheel.drive$cty > 20, ]

# Of those vehicles, what is the vehicle ID of the vehicle with the worst hwy mpg?
worst.hwy <- two.wheel.20[two.wheel.20$hwy == min(two.wheel.20$hwy), 'id']

# Write a function that takes a `year` and a `make` as parameters, and returns 
# The vehicle that gets the most hwy miles/gallon of vehicles of that make in that year
MostMPG <- function(year, make) {
  year.cars <- all.vehicles[all.vehicles$year == year, ]
  car.make <- year.cars[year.cars$make == make, ]
  return (car.make[car.make$hwy == max(car.make$hwy), 'model'])
}

# What was the most efficient honda model of 1995?
MostMPG(1995, 'Honda')


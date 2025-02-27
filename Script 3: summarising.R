rm(list=ls())
library(palmerpenguins)
data("penguins",package="palmerpenguins")

# There are two data sets
# 1. `penguins_raw` contains all the variables and original names as
#   downloaded; see ?penguins_raw for more info.
# 2. `penguins` is a simplified version of the raw data.

print(penguins_raw)
summary(penguins_raw)
view(penguins_raw)

print(penguins)
summary(penguins)

# Goal: to get an overview of the data
# Tasks
## a. Count the number of observations of each species on each island
## b. Also count by Sex
## c. Check if there are any repeat measurements
## d. Summarise the measurements by species, sex, etc, 
##    (Using mean, sd, etc.)


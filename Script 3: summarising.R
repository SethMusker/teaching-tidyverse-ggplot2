rm(list=ls())
library(palmerpenguins)
data("penguins",package="palmerpenguins")

# There are two data sets
# 1. `penguins_raw` contains all the variables and original names as
#   downloaded; see ?penguins_raw for more info.
# 2. `penguins` is a simplified version of the raw data.

print(penguins_raw)
summary(penguins_raw)
View(penguins_raw)

print(penguins)
summary(penguins)

# Goal: to get an overview of the data
# Tasks
## a. Count the number of observations of each species on each island
## b. Also count by Sex
## c. Check if there are any repeat measurements
## d. Summarise the measurements by species, sex, etc, 
##    (Using mean, sd, etc.)
## e. Remake `penguins` from `penguins_raw`


# Load libraries ----------------------------------------------------------

library(tidyverse)
library(tidylog)

# a. ----------------------------------------------------------------------

# We can do this with base::table() (i.e., "base R", i.e., not tidyverse)
table(penguins$species, penguins$island)
# Alternatively:
with(penguins, table(species, island))

# OR we can do this using dplyr::count()

penguins %>% 
  count(species,island)
# The output is a little less aesthetically pleasing, but much tidier

# count() is a shortcut for:
penguins %>% 
  group_by(species,island) %>% 
  summarise(n=n())


# b. ----------------------------------------------------------------------
# We want to add sex to distinguish groups

# table() no longer looks all that pleasing, as we have a 3-dimensional array
with(penguins, table(species, island, sex))
# We also lose the NAs

# Compare to count()
penguins %>% 
  count(species,island,sex)

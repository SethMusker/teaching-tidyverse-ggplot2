# Setting up
# 
# First things first, enable rainbow parentheses!
# Tools -> Global Options -> Code (left panel) -> Display (Tab) -> 
#   Syntax (bottom) -> Use rainbox parentheses
# Then choose a theme
# Tools -> Global Options -> Appearance -> Editor Theme (I like Material)
# 


install.packages(
  c(
    "palmerpenguins",
    "tidyverse",
    "tidylog"
    )
  ) # Look at those rainbow parentheses! Majestic!

# Let's check out some Penguin data ------------------------------------------
# Have a look at https://allisonhorst.github.io/palmerpenguins/ (ctrl+click to open)
library(palmerpenguins)
data("penguins",package="palmerpenguins")

print(penguins)
summary(penguins)

# SECTION 1: Compare wrapping functions to piping ---------------------------
## Work with the simplified `penguins` data for now

## --> Let's say we want to subset/filter the data for Female Adelie pingwings

## >>>>>>>>>> Option 1: do it in several steps  ---------------

p_adelie <- subset(penguins, species == "Adelie")
p_adelie_female_stepwise <- subset(p_adelie, sex == "female")
summary(p_adelie_female_stepwise)

## >>>>>>>>>> Option 2: wrap the functions  -------------------
p_adelie_female_wrap <- subset(subset(penguins, species == "Adelie"), sex == "female")

## >>>>>>>>>> Option 3: Use pipes  ----------------------------
p_adelie_female_pipe <- penguins %>% 
  filter(species == "Adelie") %>% 
  filter(sex == "female")

# Error: could not find function "%>%"
help.search("%>%")
# Alternatively
??`%>%`
# Note: explain ctrl+shift+m (cmd+shift+m for mac) 
# (if not working, Tools -> Modify Keyboard Shortcuts...)
library(magrittr) # this was installed as part of tidyverse

p_adelie_female_pipe <- penguins %>% 
  filter(species == "Adelie") %>% 
  filter(sex == "female")

# Another Error! Yay!
# Error: object 'species' not found
# We can inspect the series of events to see where the problem occurred:
traceback()
# The problem occurred with `filter`
?filter 
## "Applies linear filtering to a univariate time series or to each series
##   separately of a multivariate time series." Doesn't feel right...
??filter # A bit overwhelming...

## Oh, we forgot to load the tidyverse!
## Load the tidyverse
library(tidyverse)
## PAUSE: what do the warnings mean?
## AHA!!! dplyr::filter()    masks stats::filter()

## -----> Quick side note about "::" ----
## The format is package::function()
## When you load a package, you don't have to use ::
## But sometimes different packages have the same name for different functions
## case in point, stats::filter() vs dplyr::filter
## When you load a package that has conflicting names with an already-loaded
## package, you'll get some warnings.
## >>>>> When in doubt, use package::function()

## Load the tidylog package for transparency
library(tidylog)

p_adelie_female_pipe <- penguins %>% 
  filter(species == "Adelie") %>% 
  filter(sex == "female")

# It worked!
p_adelie_female_pipe

# Check that the result is the same
identical(p_adelie_female_wrap,p_adelie_female_pipe)


## >>>>>>>>>>> Why use Pipes?
## 1. More intuitive ("Do this, then that, etc.")
## 2. Much easier to read
## 3. Easier to write
## 4. Easier to annotate
## 5. Easier to modify
## 6. Powerful
## 7. Flexible

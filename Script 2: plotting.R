
rm(list=ls())
library(palmerpenguins)
library(tidyverse)

data("penguins",package="palmerpenguins")

print(penguins)
summary(penguins)

## 

# Plot 1 ------------------------------------------------------------------
## Bill length vs. bill depth, with colours and shapes denoting species, a
## separate linear regression line fit to each, and some other stylistic fluff

penguins %>% 
  # filter(sex=="female") %>% 
  ggplot(mapping = aes(x=bill_length_mm,
                       y=bill_depth_mm,
                       colour=species)) +
  geom_point()+
  scale_colour_manual(values = c(
    "orange",
    "purple",
    "darkblue"
  )) +
  geom_smooth(aes(x=bill_length_mm,
                  y=bill_depth_mm),
              inherit.aes = FALSE)

plot_1<-penguins %>% 
  # filter(sex=="female") %>% 
  ggplot() +
  geom_point(mapping = aes(x=bill_length_mm,
                           y=bill_depth_mm,
                           # colour=species,
                           fill=species),
             size=4,shape=21)+
  scale_colour_manual(values = c(
    "orange",
    "purple",
    "darkturquoise"
  )) +
  scale_fill_manual(values = c(
    "orange",
    "purple",
    "darkturquoise"
  )) +
  geom_smooth(aes(x=bill_length_mm,
                  y=bill_depth_mm,
                  colour=species),
              method = "lm",
              se = FALSE)+
  labs(x = "Bill length (mm)",
       y = "Bill depth (mm)",
       title = "Penguin bill dimensions",
       subtitle = "Bill length and depth etc..",
       colour = "Penguin\nspecies",
       fill = "Penguin\nspecies")+
  theme_bw()+
  theme(panel.grid.minor.x = element_blank())
print(plot_1)
last_plot()
ggsave(filename = "plot_1.png",
       plot = plot_1)
last_plot()


# Plot 2 ------------------------------------------------------------------


# Plot 3 ------------------------------------------------------------------

# Plot 4 ------------------------------------------------------------------

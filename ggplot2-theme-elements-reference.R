library(tidyverse)
library(extrafont)
library(paletteer) ## for color palette
loadfonts(device = "win", quiet = TRUE) ## to load the font
# fonttable <- fonttable() ## to see the all of your loaded fonts

# Set theme to theme_minimal() as a baseline: it makes the panel background and legend background the same as the plot background
theme_set(theme_minimal())
# Use theme_update() to update theme elements you want to customize
theme_update(text = element_text(family = "Fira Code"),
             title = element_text("Karla", size = 22, color = "gray20"),
             plot.title = element_text("IBM Plex Mono SemiBold", face = "bold", size = 26, color = "gray20"),
             plot.title.position = "plot",
             plot.subtitle = element_text("IBM Plex Mono SemiBold", face = "bold", size = 22, color = "gray50"),
             axis.text = element_text(size = 14),
             axis.title = element_text(size = 24, face = "bold"),
             axis.line = element_line(color = "gray20"),
             panel.grid.major = element_line(color = "gray70"),
             panel.grid.minor = element_line(color = "gray80"),
             plot.margin = margin(25, 25, 25, 25),
             plot.background = element_rect(fill = "#F3F4F6", color = "#F3F4F6"),
             plot.caption = element_text(size = 15, face = "italic"),
             plot.caption.position = "plot",
             legend.text = element_text(size = 14),
             legend.background = element_rect(fill = "#F3F4F6", color = "#F3F4F6"),
             legend.position = c(.85, .85))


# Plots ----
iris %>% 
  ggplot(aes(x = Sepal.Length, y = Sepal.Width, color = Species)) +
  geom_point(size = 4, alpha = 0.6) +
  labs(title = "Sepal Dimensions of Iris Flowers", subtitle = "by Species",
       x = "Sepal length", y = "Sepal width",
       caption = "Data: Fisher's Iris dataset") +
  scale_color_paletteer_d("ggthemes::calc", labels = c("Setosa", "Versicolor", "Virginica")) +  ## fix labels of the legend
  ggsave("ggplot-demo-iris.png", device = "png", type = "cairo", width = 10, height = 10, dpi = 300) 


mtcars %>% 
  ggplot(aes(x = mpg, y = hp, color = factor(cyl))) +
  geom_point(size = 4, alpha = 0.6) +
  labs(title = "Miles per Gallon & Horsepower", subtitle = "of 32 Automobiles(1973–74 models)",
       x = "Miles per gallon", y = "Horsepower", color = "Number of\ncylinders",
       caption = "Data: 1974 Motor Trend US magazine") +
  scale_color_paletteer_d("ggthemes::calc") +  ## fix labels of the legend
  scale_x_continuous(limits = c(10,35), expand = expansion(0,0)) +
  scale_y_continuous(limits = c(0,350), expand = expansion(0,0), label = c("","100", "200", "300", "")) +
  ggsave("ggplot-demo-mtcars.png", device = "png", type = "cairo", width = 10, height = 10, dpi = 300)

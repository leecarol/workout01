#Title:
#Description:
#Inputs:
#Outputs:

library('jpeg')
library('grid')
library('ggplot2')

court_file <- "../images/nba-court.jpg"
court_image <- rasterGrob(
  readJPEG(court_file),
  width = unit(1, "npc"),
  height = unit(1, "npc")
)

iguodala_shot_chart <- ggplot(data = 'andre-iguodala.csv') +
  annotation_custom(court_image, -250, 250, -50, 420) +
  geom_point(aes(x = x, y = y, color = shot_made_flag)) +
  ylim(-50, 420) +
  ggtitle('Shot Chart: Andre Iguodala (2016 Season)') +
  theme_minimal()

iguodala_shot_chart

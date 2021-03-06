#Title: Shot Charts
#Description: Creating shot charts displaying shots
#Inputs: nba court file and individual player csv files
#Outputs: pdfs

library('jpeg')
library('grid')
library('ggplot2')

court_file <- "../images/nba-court.jpg"
court_image <- rasterGrob(
  readJPEG(court_file),
  width = unit(1, "npc"),
  height = unit(1, "npc")
)

andre <- read.csv('../data/andre-iguodala.csv')
iguodala_shot_chart <- ggplot(andre) +
  annotation_custom(court_image, -250, 250, -50, 420) +
  geom_point(aes(x = x, y = y, color = shot_made_flag)) +
  ylim(-50, 420) +
  ggtitle('Shot Chart: Andre Iguodala (2016 Season)') +
  theme_minimal()

green <- read.csv('../data/draymond-green.csv')
green_shot_chart <- ggplot(green) +
  annotation_custom(court_image, -250, 250, -50, 420) +
  geom_point(aes(x = x, y = y, color = shot_made_flag)) +
  ylim(-50, 420) +
  ggtitle('Shot Chart: Draymond Green (2016 Season)') +
  theme_minimal()

durant <- read.csv('../data/kevin-durant.csv')
durant_shot_chart <- ggplot(durant) +
  annotation_custom(court_image, -250, 250, -50, 420) +
  geom_point(aes(x = x, y = y, color = shot_made_flag)) +
  ylim(-50, 420) +
  ggtitle('Shot Chart: Kevin Durant (2016 Season)') +
  theme_minimal()

thompson <- read.csv('../data/klay-thompson.csv')
thompson_shot_chart <- ggplot(thompson) +
  annotation_custom(court_image, -250, 250, -50, 420) +
  geom_point(aes(x = x, y = y, color = shot_made_flag)) +
  ylim(-50, 420) +
  ggtitle('Shot Chart: Klay Thompson (2016 Season)') +
  theme_minimal()

curry <- read.csv('../data/stephen-curry.csv')
curry_shot_chart <- ggplot(curry) +
  annotation_custom(court_image, -250, 250, -50, 420) +
  geom_point(aes(x = x, y = y, color = shot_made_flag)) +
  ylim(-50, 420) +
  ggtitle('Shot Chart: Stephen Curry (2016 Season)') +
  theme_minimal()

pdf('../images/andre-iguodala-shot-chart.pdf', width = 6.5, height = 5)
iguodala_shot_chart
dev.off()

pdf('../images/kevin-durant-shot-chart.pdf', width = 6.5, height = 5)
durant_shot_chart
dev.off()

pdf('../images/draymond-green-shot-chart.pdf', width = 6.5, height = 5)
green_shot_chart
dev.off()

pdf('../images/klay-thompson-shot-chart.pdf', width = 6.5, height = 5)
thompson_shot_chart
dev.off()

pdf('../images/stephen-curry-shot-chart.pdf', width = 6.5, height = 5)
curry_shot_chart
dev.off()

all_data <- read.csv('../data/shots-data.csv', sep = ',', header = TRUE, colClasses = data_types <- c('character', 'character', 'character', 'character', 'character', 'integer', 'real', 'real', 'character', 'character', 'character', 'real', 'character', 'real', 'real', 'character', 'real'))
shots_chart <- ggplot(all_data) +
  annotation_custom(court_image, -250, 250, -50, 420) +
  geom_point(aes(x = x, y = y, color = shot_made_flag)) +
  ylim(-50, 420) +
  ggtitle('Shot Chart: GSW (2016 Season)') +
  theme_minimal() + facet_wrap(~ name)

pdf('../images/gsw-shot-chart.pdf', width = 8, height = 7)
shots_chart
dev.off()

png('../images/gsw-shot-chart.png', width = 8, height = 7, units = 'in', res = 100)
shots_chart
dev.off()

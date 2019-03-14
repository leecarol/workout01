#Title: Shots Data
#Description: Preparing the data by creating summaries of shots made by the players
#Inputs: The script takes in the csv files.
#Outputs: The script creates summary outputs into text files.

library(dplyr)
iguodala <- read.csv('../data/andre-iguodala.csv', header = TRUE, stringsAsFactors = FALSE)
green <- read.csv('../data/draymond-green.csv', header = TRUE, stringsAsFactors = FALSE)
durant <- read.csv('../data/kevin-durant.csv', header = TRUE, stringsAsFactors = FALSE)
thompson <- read.csv('../data/klay-thompson.csv', header = TRUE, stringsAsFactors = FALSE)
curry <- read.csv("../data/stephen-curry.csv", header = TRUE, stringsAsFactors = FALSE)

iguodala <- mutate(iguodala, name = 'Andre Iguodala')
green <- mutate(green, name = 'Draymond Green')
durant <- mutate(durant, name = 'Kevin Durant')
thompson <- mutate(thompson, name = 'Klay Thompson')
curry <- mutate(curry, name = 'Stephen Curry')

iguodala$shot_made_flag[iguodala$shot_made_flag == 'y'] = 'shot_yes'
iguodala$shot_made_flag[iguodala$shot_made_flag == 'n'] = 'shot_no'
iguodala <- mutate(iguodala, minute = iguodala$period * 12 - iguodala$minutes_remaining)
green$shot_made_flag[green$shot_made_flag == 'y'] = 'shot_yes'
green$shot_made_flag[green$shot_made_flag == 'n'] = 'shot_no'
green <- mutate(green, minute = green$period * 12 - green$minutes_remaining)
durant$shot_made_flag[durant$shot_made_flag == 'y'] = 'shot_yes'
durant$shot_made_flag[durant$shot_made_flag == 'n'] = 'shot_no'
durant <- mutate(durant, minute = durant$period * 12 - durant$minutes_remaining)
thompson$shot_made_flag[thompson$shot_made_flag == 'y'] = 'shot_yes'
thompson$shot_made_flag[thompson$shot_made_flag == 'n'] = 'shot_no'
thompson <- mutate(thompson, minute = thompson$period * 12 - thompson$minutes_remaining)
curry$shot_made_flag[curry$shot_made_flag == 'y'] = 'shot_yes'
curry$shot_made_flag[curry$shot_made_flag == 'n'] = 'shot_no'
curry <- mutate(curry, minute = curry$period * 12 - curry$minutes_remaining)

write.csv(iguodala, "../data/andre-iguodala.csv")
write.csv(green, '../data/draymond-green.csv')
write.csv(durant, '../data/kevin-durant.csv')
write.csv(thompson, '../data/klay-thompson.csv')
write.csv(curry, '../data/stephen-curry.csv')

stacked <- rbind(curry, durant, green, iguodala, thompson)
write.csv(stacked, file = "../data/shots-data.csv")
sink('../output/andre-iguodala-summary.txt')
summary(iguodala)
sink()
sink('../output/draymond-green-summary.txt')
summary(green)
sink()
sink('../output/kevin-durant-summary.txt')
summary(durant)
sink()
sink('../output/klay-thompson-summary.txt')
summary(thompson)
sink()
sink('../output/stephen-curry-summary.txt')
summary(curry)
sink()

sink('../output/shots-data-summary.txt')
summary(stacked_table)
sink()

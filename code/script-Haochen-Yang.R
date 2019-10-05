# ===================================================================
# Title: Descriptive Analysis
# Description:
#   This script computes descriptive statistics, as well as 
#   various exploratory data visualizations.
# Input(s): data file 'nba2018-players.csv'
# Output(s): summary data files, and plots
# Author: Haochen Yang
# Date: 10-3-2019
# ===================================================================

library(dplyr)
library(ggplot2)

dat <- read.csv("nba2018-players.csv")
warriors <- arrange(filter(dat, team == "GSW"), salary)
write.csv(warriors, file = "warriors.csv", row.names = FALSE)

sink(file = "summary-height-weight.txt")
summary(dat[, c('height', 'weight')])
sink()

sink(file = "../output/data-structure.txt")
summary(str(dat))
sink()

sink(file = "../output/summary-warriors.txt")
summary(warriors)
sink()

sink(file = "../output/summary-lakers.txt")
summary(filter(dat, team == "LAL"))
sink()

png(filename = "../images/scatterplot-height-weight.png")
plot(dat$height, dat$weight, pch = 20, xlab = 'Height', ylab = 'Weight')
dev.off()

jpeg(filename = "../images/histogram-age.jpeg", width = 600, height = 400, units = "px")
hist(dat$age)
dev.off()

png(filename = "../images/scatterplot2-height-weight.png", pointsize = 25)
plot(dat$height, dat$weight, pch = 20, xlab = 'Height', ylab = 'Weight')
dev.off()

ggsave(filename = "../images/height_weight_by_position.pdf")
dat %>% ggplot(aes(x = height, y = weight)) + geom_point() + facet_wrap(~ position)
ggsave()



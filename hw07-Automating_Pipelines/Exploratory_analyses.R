library(tidyverse)

# Bring the data in
gapminder <- read.delim("/Users/katejohnson/Google Drive/Classes/STAT545.547/STAT545-hw-Johnson-Kate/STAT545-hw-Johnson-Kate_Oct5/hw07-Automating_Pipelines/gapminder.tsv")

# Descriptive plots
histogram.lifeExp <- ggplot(gapminder, aes(lifeExp)) + geom_histogram(bins=25) + theme_bw()
ggsave(histogram.lifeExp, file="/Users/katejohnson/Google Drive/Classes/STAT545.547/STAT545-hw-Johnson-Kate/STAT545-hw-Johnson-Kate_Oct5/hw07-Automating_Pipelines/histogram.lifeExp.png")

histogram.gdpPercap <- ggplot(gapminder, aes(gdpPercap)) + geom_histogram(bins=25) + theme_bw()
ggsave(histogram.gdpPercap, file="/Users/katejohnson/Google Drive/Classes/STAT545.547/STAT545-hw-Johnson-Kate/STAT545-hw-Johnson-Kate_Oct5/hw07-Automating_Pipelines/histogram.gdpPercap.png")

# Reorder the data based on ascending life expectancy
gapminder.reordered <- gapminder %>%
                        group_by(continent) %>%
                         arrange(lifeExp)

# Write to new file
write.table(gapminder.reordered, file="/Users/katejohnson/Google Drive/Classes/STAT545.547/STAT545-hw-Johnson-Kate/STAT545-hw-Johnson-Kate_Oct5/hw07-Automating_Pipelines/gapminder.reordered.tsv")

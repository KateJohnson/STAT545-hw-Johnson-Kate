library(tidyverse)
library(reshape2)

# Create a figure for each continent, and write one file per continent, with an informative name. 
# The figure should give scatterplots of life expectancy vs. year, faceting on country, fitted line overlaid.

# Load original data
gapminder <- read.delim("/Users/katejohnson/Google Drive/Classes/STAT545.547/STAT545-hw-Johnson-Kate/STAT545-hw-Johnson-Kate_Oct5/hw07-Automating_Pipelines/gapminder.tsv")


## Plot per continent

plot.Asia <- gapminder %>%
               filter(continent=="Asia") %>%
                ggplot(aes(x=year, y=lifeExp)) + 
                  facet_wrap(~ country) +
                    geom_point() + 
                    stat_smooth(method="lm") + 
                        theme_bw() + xlab("Year") + ylab("Life Expectancy") +  scale_x_continuous(breaks=seq(1950,2010,20))

ggsave(plot.Asia, file="/Users/katejohnson/Google Drive/Classes/STAT545.547/STAT545-hw-Johnson-Kate/STAT545-hw-Johnson-Kate_Oct5/hw07-Automating_Pipelines/plot.Asia.png")


plot.Europe <- gapminder %>%
  filter(continent=="Europe") %>%
    ggplot(aes(x=year, y=lifeExp)) + 
      facet_wrap(~ country) +
        geom_point() + 
          stat_smooth(method="lm") + 
            theme_bw() + xlab("Year") + ylab("Life Expectancy") +  scale_x_continuous(breaks=seq(1950,2010,20))

ggsave(plot.Europe, file="/Users/katejohnson/Google Drive/Classes/STAT545.547/STAT545-hw-Johnson-Kate/STAT545-hw-Johnson-Kate_Oct5/hw07-Automating_Pipelines/plot.Europe.png")

plot.Africa <- gapminder %>%
    filter(continent=="Africa") %>%
      ggplot(aes(x=year, y=lifeExp)) + 
        facet_wrap(~ country) +
          geom_point() + 
            stat_smooth(method="lm") + 
              theme_bw() + xlab("Year") + ylab("Life Expectancy") +  scale_x_continuous(breaks=seq(1950,2010,20))

ggsave(plot.Africa, file="/Users/katejohnson/Google Drive/Classes/STAT545.547/STAT545-hw-Johnson-Kate/STAT545-hw-Johnson-Kate_Oct5/hw07-Automating_Pipelines/plot.Africa.png")

plot.Americas <- gapminder %>%
                filter(continent=="Americas") %>%
                  ggplot(aes(x=year, y=lifeExp)) + 
                    facet_wrap(~ country) +
                       geom_point() + 
                        stat_smooth(method="lm") + 
                         theme_bw() + xlab("Year") + ylab("Life Expectancy") +  scale_x_continuous(breaks=seq(1950,2010,20))

ggsave(plot.Americas, file="/Users/katejohnson/Google Drive/Classes/STAT545.547/STAT545-hw-Johnson-Kate/STAT545-hw-Johnson-Kate_Oct5/hw07-Automating_Pipelines/plot.Americas.png")

plot.Oceania <- gapminder %>%
                  filter(continent=="Oceania") %>%
                    ggplot(aes(x=year, y=lifeExp)) + 
                      facet_wrap(~ country) +
                       geom_point() + 
                        stat_smooth(method="lm") + 
                          theme_bw() + xlab("Year") + ylab("Life Expectancy") +  scale_x_continuous(breaks=seq(1950,2010,20))

ggsave(plot.Oceania, file="/Users/katejohnson/Google Drive/Classes/STAT545.547/STAT545-hw-Johnson-Kate/STAT545-hw-Johnson-Kate_Oct5/hw07-Automating_Pipelines/plot.Oceania.png")


## Note: I tried very hard to use the coefficients from my linear model function in the plot (see code below).
# I couldn't get geom_abline to work, I think the issue is with the line not being within the plot range.

# gapminder.lm <- read.table(file="/Users/katejohnson/Google Drive/Classes/STAT545.547/STAT545-hw-Johnson-Kate/STAT545-hw-Johnson-Kate_Oct5/hw07-Automating_Pipelines/gap.lifeExp.fits.tsv")

# lm.Asia <- gapminder.lm %>%
#  filter(continent=="Asia") %>%
#  select(country, term, estimate) %>%
#  spread(term, estimate) %>%
#  rename(myIntercept= "(Intercept)", mySlope= "I(year - offset)")


# gapminder %>%
#  filter(continent=="Asia") %>%
#  ggplot(aes(x=year, y=lifeExp)) + 
#  facet_wrap(~ country) +
#  geom_point() + 
#  geom_abline(aes(slope=mySlope, intercept=myIntercept), data=lm.Asia) + 
#  theme_bw() + xlab("Year") + ylab("Life Expectancy") +  scale_x_continuous(breaks=seq(1950,2010,15))



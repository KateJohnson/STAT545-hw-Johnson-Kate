library(broom)

## Read the data
gapminder.reordered <- read.table("/Users/katejohnson/Google Drive/Classes/STAT545.547/STAT545-hw-Johnson-Kate/STAT545-hw-Johnson-Kate_Oct5/hw07-Automating_Pipelines/gapminder.reordered.tsv")

## Check order of continents
head(gapminder.reordered)

## Linear regression of life expectancy on year within each country

# Nest the data
gap.reordered.nested <- gapminder.reordered %>% 
                          group_by(continent, country) %>% 
                            select(continent, country, year, lifeExp) %>%
                            nest()

# Write a linear model function
lm_fit <- function(mydata, offset=1952) {
  fit <- lm(lifeExp ~ I(year-offset), data=mydata)
  tidy(fit)
}

# Run the linear function on each country
gap.lifeExp.fits <- gap.reordered.nested %>% 
                          mutate(fit.lm = map(data, lm_fit)) %>%
                            select(continent, country, fit.lm) %>%
                              unnest(fit.lm)


## Find the best and worst countries in continents

# Countries with life expectancy that has declined over time
gap.worst <-  gap.lifeExp.fits %>%
    filter(term== "I(year - offset)") %>%
      filter(estimate <0) %>%
        arrange(estimate)
  
# Top 3 countries with life expectancy that has increased over time  
gap.best <- gap.lifeExp.fits %>%
  filter(term== "I(year - offset)") %>%
    filter(estimate >0) %>%
      arrange(desc(estimate)) %>%
        slice(1:3)
    
# Write gap.lifeExp.fits to file
write.table(gap.lifeExp.fits, file="/Users/katejohnson/Google Drive/Classes/STAT545.547/STAT545-hw-Johnson-Kate/STAT545-hw-Johnson-Kate_Oct5/hw07-Automating_Pipelines/gap.lifeExp.fits.tsv")

  
  
  
  
  



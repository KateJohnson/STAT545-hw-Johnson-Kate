Writing functions and working with lists
================

2. Writing Functions
--------------------

I'll stick with gapminder for this exercise.

``` r
suppressPackageStartupMessages(library(tidyverse))
library(knitr)
library(gapminder)
```

Just to remind myself of what it looks like:

``` r
kable(head(gapminder))
```

| country     | continent |  year|  lifeExp|       pop|  gdpPercap|
|:------------|:----------|-----:|--------:|---------:|----------:|
| Afghanistan | Asia      |  1952|   28.801|   8425333|   779.4453|
| Afghanistan | Asia      |  1957|   30.332|   9240934|   820.8530|
| Afghanistan | Asia      |  1962|   31.997|  10267083|   853.1007|
| Afghanistan | Asia      |  1967|   34.020|  11537966|   836.1971|
| Afghanistan | Asia      |  1972|   36.088|  13079460|   739.9811|
| Afghanistan | Asia      |  1977|   38.438|  14880372|   786.1134|

**1. A linear model**

I will write a basic function to fit a linear model for the relationship between life expectancy and year. As suggested by Jenny in her [tutorial](http://stat545.com/block012_function-regress-lifeexp-on-year.html), it's definitely a good idea to force the intercept to start at the first year in the gapminder data (1952) not the first year ever (0)!

``` r
lm_fit <- function(mydata, offset=1952) {
  the_lm <- lm(lifeExp ~ I(year-offset), data=mydata)
    coef(the_lm)
}
```

Let's see if it works on gapminder:

``` r
lm_fit(gapminder)
```

    ##      (Intercept) I(year - offset) 
    ##       50.5120841        0.3259038

It seems like the function is working, but I'll do a quick sanity check.

``` r
lm(lifeExp ~ I(year-1952), gapminder)
```

    ## 
    ## Call:
    ## lm(formula = lifeExp ~ I(year - 1952), data = gapminder)
    ## 
    ## Coefficients:
    ##    (Intercept)  I(year - 1952)  
    ##        50.5121          0.3259

Looks good! Now what about using the function on a single country within the gapminder data?

``` r
gapminder %>%
  filter(country=="France") %>%
      lm_fit()
```

    ##      (Intercept) I(year - offset) 
    ##       67.7901282        0.2385014

That's good for now, but in the next exercise I'll automate this task in order to fit a linear model for each country without have to repeat the above command hundreds of times.

However, I would also like to be able to fit a couple different types of models, such as:

**2. A quadratic model**

I'll include a squared term for year to account for potential non-linearity in the change in life expectancy over time.

``` r
quad_fit <- function(mydata, offset=1952) {
  the_quad <- lm(lifeExp ~ I(year-offset) + I((year-offset)^2), data=mydata)
    coef(the_quad)
}

quad_fit(gapminder)
```

    ##          (Intercept)     I(year - offset) I((year - offset)^2) 
    ##         48.916137600          0.517417408         -0.003482065

**2. A robust regression model**

``` r
suppressPackageStartupMessages(library(MASS))

robust_fit <- function(mydata, offset=1952, method="M") {
  the_robust <- MASS::rlm(lifeExp ~ I(year-offset), method=method, data=mydata)
    coef(the_robust)
}

robust_fit(gapminder)
```

    ##      (Intercept) I(year - offset) 
    ##        50.399200         0.335076

This method produces very similar coefficients as the linear model, but robust regression using M-estimation will be less influenced by outliers in life expectancy, so there will probably be bigger differences for certain countries.

Now I want to apply these functions to nested dataframes consisting of the countries in gapminder.

6. Working with nested dataframes
---------------------------------

Gapminder exploration
================

Bring the data in
-----------------

``` r
library(gapminder)
library(tidyverse)
```

    ## Loading tidyverse: ggplot2
    ## Loading tidyverse: tibble
    ## Loading tidyverse: tidyr
    ## Loading tidyverse: readr
    ## Loading tidyverse: purrr
    ## Loading tidyverse: dplyr

    ## Conflicts with tidy packages ----------------------------------------------

    ## filter(): dplyr, stats
    ## lag():    dplyr, stats

Smell test the data
-------------------

-   Is it a data.frame, a matrix, a vector, a list?

``` r
typeof(gapminder)
```

    ## [1] "list"

It is a list.

-   What’s its class?

``` r
class(gapminder)
```

    ## [1] "tbl_df"     "tbl"        "data.frame"

It is a data frame.

-   How many variables/columns?

``` r
ncol(gapminder)
```

    ## [1] 6

It has 6 columns.

-   How many rows/observations?

``` r
nrow(gapminder)
```

    ## [1] 1704

It has 1704 rows.

-   Can you get these facts about “extent” or “size” in more than one way? Can you imagine different functions being useful in different contexts?

1.  Alternative 1: Gives dimentions of dataframe in 1 command.

``` r
dim(gapminder)
```

    ## [1] 1704    6

1.  Alternative 2: Provides dimensions and type of each variable.

``` r
str(gapminder)
```

    ## Classes 'tbl_df', 'tbl' and 'data.frame':    1704 obs. of  6 variables:
    ##  $ country  : Factor w/ 142 levels "Afghanistan",..: 1 1 1 1 1 1 1 1 1 1 ...
    ##  $ continent: Factor w/ 5 levels "Africa","Americas",..: 3 3 3 3 3 3 3 3 3 3 ...
    ##  $ year     : int  1952 1957 1962 1967 1972 1977 1982 1987 1992 1997 ...
    ##  $ lifeExp  : num  28.8 30.3 32 34 36.1 ...
    ##  $ pop      : int  8425333 9240934 10267083 11537966 13079460 14880372 12881816 13867957 16317921 22227415 ...
    ##  $ gdpPercap: num  779 821 853 836 740 ...

-   What data type is each variable? Country and continent are factors (entered as integer dummy variables), year is an integer, life expectancy is numeric (double), population is an integer, and gdpPercap is numeric (double)

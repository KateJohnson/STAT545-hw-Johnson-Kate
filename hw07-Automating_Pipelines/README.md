# STAT 545 Homework 7

I've automated a pipeline to explore the Gapminder dataset, run a statistical analysis involving linear models, and generate a report with a series of plots. 

**Step 1: Download the data**
I downloaded the raw data from Jenny Bryan's repo using this [R script](https://github.com/KateJohnson/STAT545-hw-Johnson-Kate/blob/master/hw07-Automating_Pipelines/Download_data.R)

**Step 2: Exploratory analysis**
- In this [R script](https://github.com/KateJohnson/STAT545-hw-Johnson-Kate/blob/master/hw07-Automating_Pipelines/Exploratory_analyses.R) I used the downloded data from Step 1 to generate histograms of life expectancy and GDP. 
- I reordered the data by descending life expectancy within continent and then exported the rerordered data to [this file](https://github.com/KateJohnson/STAT545-hw-Johnson-Kate/blob/master/hw07-Automating_Pipelines/gapminder.reordered.tsv)

**Step 3: Statistical analysis**
- In this [R script](https://github.com/KateJohnson/STAT545-hw-Johnson-Kate/blob/master/hw07-Automating_Pipelines/Statistical_analyses.R) I uploaded the reordered data (checking that the order had been maintained) and created a function to run a linear model of life expectancy on year. 
- I then nested the data in order to run the function on each country. I extracted the model output using the 'broom' function, unnested and outputed the coefficent [data](https://github.com/KateJohnson/STAT545-hw-Johnson-Kate/blob/master/hw07-Automating_Pipelines/gap.lifeExp.fits.tsv).
- Finally, I determined which countries had the 'worst' and 'best' trends in life expectancy.

**Step 4: Generate figures**
- In this [R script](https://github.com/KateJohnson/STAT545-hw-Johnson-Kate/blob/master/hw07-Automating_Pipelines/Generate_figures.R) I generated a paneled figure for each continent with the trend in life expectancy for every country.

**Step 5: Markdown report**
- In this [Markdown report](https://github.com/KateJohnson/STAT545-hw-Johnson-Kate/blob/master/hw07-Automating_Pipelines/Gapminder_report.md) I included all of the plots from the previous steps, as well as tables of the 'best' and 'worst' countries from Step 3. 

**Pipeline**
I wrote a final [R script](https://github.com/KateJohnson/STAT545-hw-Johnson-Kate/blob/master/hw07-Automating_Pipelines/Pipeline.R) that sources the R script from each step and renders the markdown document.


------
**Notes on the process**
I had trouble with this assignment, and there's definitely a lot more I could have done. 
- First, as you can see at the bottom of my Step 4 R Script, I tried to use the coefficients from my the data file generated in Step 3 in the ggplots. I was close but couldn't get it to work using geom_abline. I think it had to do with the intercept being out of range. 
- Second, I didn't use Make to automate the pipeline. I did create a Makefile but I couldn't figure out the syntax and gave up. 
- Third, I would have liked to create a 'clean up' R script for deleting all of the files in the pipeline. An example would have been really helpful! 


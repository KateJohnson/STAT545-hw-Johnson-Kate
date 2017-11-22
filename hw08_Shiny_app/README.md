# STAT 547 Homework 8

This is the folder for my **Shiny app**. My app helps the user choose which liquor to buy based on the type, price, and alcohol content.

This [BC Liquour Store data](https://github.com/KateJohnson/STAT545-hw-Johnson-Kate/blob/master/hw08_Shiny_app/bcl-data.csv) was used to develop the app. 

My app is deployed online on Shinyapps.io [here](https://katejohnson.shinyapps.io/My_new_app/). 

You can also find my [server](https://github.com/KateJohnson/STAT545-hw-Johnson-Kate/blob/master/hw08_Shiny_app/server.R) and [user interface](https://github.com/KateJohnson/STAT545-hw-Johnson-Kate/blob/master/hw08_Shiny_app/ui.R) code in this folder.

## My Liquour App features

1. The table is a datatable, which allows the user to choose the number of entries to display as well as search the table.

2. I didn't like how the data in the table was all capitalized so I used 'mutate_all' to convert it to lowercase.

3. I added text under the plot saying how many liquor options the user has based on their selection
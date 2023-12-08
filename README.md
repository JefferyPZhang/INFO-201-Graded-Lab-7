# INFO 201 Lab: Plotting
November 13, 2023

1 Do taller people earn more?
In this question we use income-height data, a subset of National Longitudinal Survey of Youth
(NLSY). The relevant variables are
income yearly income
height inches
marital marital status
sex male, female
education in years
afqt Armed Forces Qualification test, percentile (0-worst, 100-best).
1. Load the dataset and ensure it is good.
Below, we are only looking at those who earn positive income, so you can filter only those
with income > 0.
2. For each person in the dataset, compute 5-inch height category. For instance:
Height Height category
54 50
59 55
63 60
66 65
etc.
Hint: use integer division %/%.
3. Now compute average income for each age category, and make a barplot of this.
What does the plot suggest to you?
4. Do this separately for men and women. Make a barplot with two sets of bars (for men/women)
next to each other, filled with a different colors.
Hint: use position = argument for geom_col().
1
5. Now, instead of barplot of the average, make a boxplot of income by height category.
6. Finally, do the same boxplot separately by gender.
What can you conclude from this plot?
2 Covid in Scandinavia
In this question we use data about COVID-19 cases in Scandinavia (Denmark, Finland, Norway
and Sweden). The dataset covid-scandinavia-wide contains the following variables:
country
date
Confirmed Cumulative number of confirmed COVID-19 cases by that date
Deaths Cumulative number of COVID-19 deaths by that date
1. Load the dataset. What does a row represent?
2. What is the first and last date in these data?
3. Make a scatterplot of confirmed cases versus deaths for Denmark.
Adjust the marker size and transparency to make it look good.
4. Now make a similar plot for all four countries, denoting different countries by different color.
5. Finally, replace the dots by paths to show the trajectories.

### R_categorical_variables
Tools for categorical variables in R

# Miscellaneous functions for categorical variables

Hello! This page is just a short summary of what the repository contains.
So far it contains a function which can be used for Likelihood encoding (aka Mean Encoding) for categorical variables.

Mean encoding is taking the average value of the y-variable(response variable) for category within the categorical variable. 
For example,let's that say we have an x-variable(explanatory variable) called "Size" and a y-variable called "Speed".
Within the Size variable, we have 3 categories: Big(B), Small(S), and Medium(M)
Here is a table below.

|Size| Speed|
|----- |------|
|B	   |   5 |
|S	   |     8|
|M	   |     10|
|M     |      	7|
|S     |	6|
|B   	|9|
|B |    	7|
|S|     	2|
|S|       	8|


Since Size is a categorical variable, we can mean encode it. Let's do that now:

|Size| Speed|
|----- |------|
|7	   |   5 |
|6	   |     8|
|8.5	   |     10|
|8.5     |      	7|
|6     |	6|
|7   	|9|
|7 |    	7|
|6|     	2|
|6|       	8|

As you can see, we have mapped each category in size to their respective averages:
B - 7, M -8.5, and S - 6.

Voila! This method is particulary useful if your categorical variable has many categories within it (this is called high cardinality).
To make it more statistically sound, the version of mean encoding I have here includeds some stratified k-fold sampling (in english, it takes averages for different chunks of the when a category occurs. The reason for this is that it's help us in our quest for model which track general patterns rather than overfitting.

I'll continue adding more functions as time progresses!

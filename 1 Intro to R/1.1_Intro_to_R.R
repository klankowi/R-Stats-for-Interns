#### Introduction ####
# Welcome to R! 

# This file, called a script, will serve as your basic introduction to working
# in R.

# Let's first take a look around our screens. The R Studio layout gives you four
# panels-- the console, the source, the environment, and the files/plots/help
# panels. You're currently reading this in the source panel, which is a flexible
# workspace where you can write and save code, then run it. The console panel
# is a space to write and run code, but you can't save or edit code you've written
# in it. The environment panel should be empty right now (because we haven't done
# anything yet), but eventually it will show us all the objects we have created
# and saved in this session. Finally, the files/ plots/ help panel can be used
# to navigate through your system's file structure, output data visualizations
# like plots, and examine help pages provided by R.

# These lines of text are grayed out. This is because I have designated them as
# lines to NOT be run in the software. If you ever need to write a quick note
# to yourself but DON'T want that line to be run, use a # symbol at the beginning
# of the line. Watch what happens if we forget that symbol.

This line is not grayed out and R will try to process it. Not good.
  
# Later, we will learn to use RMarkdown documents, which are much better for 
# documenting working processes and creating publishable reports. For now, we 
# will use this shortcut method of writing to ourselves.
  
# R is a great workhorse, but it needs constant direction to understand what 
# you want it to do. It has no brain, intuition, or understanding. Don't get 
# frustrated if you're not getting the output that you want-- just get more 
# specific in your directions! 

#### Working directory ####
# We will start by learning how to set a "working directory." This is an existing
# location within your computer's file structure in which R will search for inputs
# and save any potential outputs.

# Press CTRL+Enter (PC)/ CMD+Enter (Mac) while your cursor is in a line to run it.
  
setwd("C:/Users/klankowicz/Documents/GitHub/R-Stats-for-Interns/1 Intro to R")

# Your exact file path will depend on where you saved the 'baptisms.csv' file.

# You can use the following line to check your working directory at any point.
getwd()

# setwd() and getwd() are functions, which are a collection of related commands
# run the same way every time to achieve a goal. Functions can be built-in, like
# these, or user-defined.

#### Loading an external dataframe ####
# Now let's check out our data. We'll be working with a publicly-available file
# I have previously downloaded and emailed to all of you. It is a record of 
# baptisms in London from the 1600s to 1700s. Each observation includes the year,
# the number of boys baptized in that year, and the number of girls baptized in 
# that year. We can get R to interact with this comma-separated values (csv) file
# using the read.csv() function.
read.csv("baptisms.csv")

# Running that line should have resulted in a ton of numbers popping up in your
# console screen. You can view the data this way, but you cannot work with it,
# because it has not been assigned as a data type R understands. Let's fix this.
baptisms <- read.csv("baptisms.csv")

# Notice that after you run the previous line, an item
# appears in your environment. This is because we have used the read.csv() 
# function to open and extract the information within the designated file 
# "baptisms.csv", then save that information to an object we can work with in R
# using the arrow (->). We have called that object "baptisms," but we could
# really call it anything. Check it out.
just.for.laughs <- read.csv("baptisms.csv")

#### Examining data ####
# Now we can run analyses on the dataset. 
# We can view a sample of the data using the following:
head(baptisms, 10)
# This shows us the top 10 rows. 

# You can open the entire baptisms dataset in a new tab using:
View(baptisms)
# Or you can click on "baptisms" in the environment panel.

# We can extract column names (the variables) using the following:
colnames(baptisms)
# The column names are year, boys, and girls.

# We can view a summary (minimum, mean, maximum, etc) of the data:
summary(baptisms)
# The dataset runs from 1629 to 1710. Between 2890 and 8426 boys were baptized
# per year, and between 2722 and 8423 girls were baptized per year.

# We can extract the dimensions (number of rows and columns) to get a sense of
# how  much data we have to play with.
dim(baptisms)
# There are 82 rows (we can think of these as observations) for 3 columns (we
# can think of these as our variables)

#### Data structures ####
# Everything in R is an object. R objects are data that have both a structure and
# a type. The baptisms dataset, which we just loaded, is a data frame. Data frames
# are probably the most common data structure ecologists and environmental scientists
# work on. It's essentially a list of data, where every element of the list has the 
# same length-- in our baptisms data frame, each of the 3 columns has space for 
# 82 observations, and vice versa every one of the 82 observations has space for
# 3 variables. You can therefore think of data frames as rectangular lists.

# You can check the data structure you're using with:
class(baptisms)

# Another common data type is vectors. Whereas data frames have space for multiple
# observations of multiple variables (and are therefore two-dimensional), vectors
# are one-dimensional. You can use them to store either all observations of a single
# variable or all variables of a single observation. Let's make a vector now. We will
# isolate a single column of our baptisms dataset like so:
baptisms.vector <- baptisms$year
# This has created a one-dimensional vector. It tells us the years associated with
# each observation.

# We can access a column of any dataframe by using the syntax
# data frame name$column name. The dollar sign is necessary for R to understand
# that you want to just pull the column from the data frame.

# R can also understand data structured as matrices and lists. Matrices are 
# extensions of vectors, but they can have multiple dimensions. We won't be 
# working much with them in these lessons. Lists are further extensions of vectors:
# you can think of them as flexible containers that can be any length and contain
# any other kind of data structure. You can even make a list that has other lists
# nested within it. We will not be working much with them, either.

#### Data types ####
# Data structures, which we just learned about, are constructed from elements that
# may be different data types. The main types are character, factor, numeric, 
# integer, and logical data. 

# Character data and factor data look similar. These are pieces of data represented
# by alphanumeric characters that have no number value. Character data is typically
# something like an ID of a sample, or the name of a person. Factor data is a 
# special type of character data, in which the alphanumeric characters represent a
# grouping variable.
# A character element would be something like "Sample 1" or "Katie"
# A factor element would be something like "Saturday" or "Herring"

# Numeric and integer data are also similar. Numeric data are continuous, meaning
# they can have decimal values. Measurements like weight and distances are 
# typically numeric data. Integer data are specialized numeric data that 
# are not continuous. They're typically used when counting things.
# A numeric element would be something like "14.2 inches" or "6.32 seconds"
# An integer element would be something like "4 boys" or "12 fish"

# Logical data tell us if a condition is met. Logical data has only two possible 
# values: TRUE and FALSE.
# A logical element could answer a question like "is the value of this observation
# greater than 5?" with either TRUE or FALSE.

# R tries its best to infer appropriate data types for things you load into it.
# It doesn't always get it right! You may find yourself having to alter the data
# types of your data structure. I commonly use
as.numeric()
as.integer()
as.character()
as.factor()
as.logical()
# to convert data elements to the proper data type.

# Let's check the data types we're working with:
str(baptisms)
# These are all integer variables. 

#### Working with data ####
# R can be used as a calculator for everything from basic arithmetic to advanced
# calculus. Let's find the total number of baptisms in every year. 
# We technically could do this the long way, like adding boys and girls for every
# year
head(baptisms)
5218 + 4683
# This result shows us total baptisms in 1629.

# But there is a much faster way. R can handle adding across two vectors, like so:
baptisms$boys + baptisms$girls
# This result shows us the total baptisms in each year.

# R can also add these vectors together.
sum(baptisms$boys + baptisms$girls)
# This result shows us the total baptisms in our entire dataset.

# Now let's find the proportion of baptisms that are for girls in each year.
# Similar to before, we could do this the long way.
head(baptisms)
4683 / (5218 + 4683)
# This result shows us the proportion of girls in 1629.

# But R can do this quicker, too.
baptisms$girls / (baptisms$boys + baptisms$girls)
# This result shows us the proportion of girls in each year.

# Remember to use proper order of operations. R does not have a brain like you do,
# so it will do whatever operation you tell it to without knowing if it is what 
# you intended or not.

# Let's save this proportion as a new column in our data.
baptisms$girl_proportion <- baptisms$girls / (baptisms$boys + baptisms$girls)

# We have now assigned a new column using the arrow. The shortcut for the arrow
# is ALT + - (PC) / Option + - (Mac)

# You can find all keyboard shortcuts at
# https://support.posit.co/hc/en-us/articles/200711853-Keyboard-Shortcuts-in-the-RStudio-IDE

# How would we plot this new girl proportion column per year?

# Now, let's find out which years had more girl baptisms than boys
baptisms$girls > baptisms$boys

# This is a vector of logical data, where R returns whether the expression is 
# TRUE or FALSE for each row. Let's save this as a column, too.

baptisms$girl_more <- baptisms$girls > baptisms$boys

# We can check how many years have more girl baptisms by the following function
table(baptisms$girl_more)

# Two years had more girl baptisms than boys.

# Here is how we subset the data to find out which years these were.
subset(baptisms, girl_more == 'TRUE')

# Or we could do this
baptisms$year[baptisms$girl_more == 'TRUE']
baptisms[baptisms$girl_more == "TRUE",]

# Here is how we would save only that output as an object called "new"
new <- subset(baptisms, girl_more == 'TRUE')

# Let's say you don't actually need that object called "new" and want to remove
# it. Here's how that is done:
rm(new)

#### Basic plots ####
# Let's make a scatterplot the number of boy baptisms per year.
plot(x=baptisms$year, y=baptisms$boys)

# If we want this to be a lineplot with connected dots, we use this command:
plot(x=baptisms$year, y=baptisms$boys, type='l')
# This should generate a scatterplot with year on the horizontal (x) axis, and 
# number of boys baptized in each year on the vertical (y) axis.

# For the plot function, and any other R function, you can learn more about
# possible inputs and options by using a question mark, like this:
?plot

# Let's plot the sum of boy and girl baptisms for every year in the dataset.
plot(baptisms$year, baptisms$boys + baptisms$girls, type='l')

# If you want to remove everything from your environment at once, here's how 
# you'd do it:
rm(list=ls())

# That's it for this lesson! I will follow up with an optional self-guided homework
# if you'd like more practice.

# For any R-related question, Googling will yield pretty good information.
# I like to use stackoverflow.com or stackexchange.com.

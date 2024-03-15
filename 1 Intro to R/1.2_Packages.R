#### Introduction ####
# Welcome back!

# In this script, we will learn how to load packages. We will focus on the "here"
# package, which is great for easily accessing data.

# We'll start with packages

# Let's completely wipe the slate clean from our last session.
rm(list=ls())

# Then go to Session in the top bar, and hit Restart R. This will unload any
# old package libraries you have loaded and wipe the old working directory.

#### Packages ####
# R is a highly-flexible open-source statistical software. People have developed
# thousands of functions to do a million different things, as we have discussed.

# If you develop enough functions that are related to a single topic, you can 
# put them all together and publish them as a package. This makes it much easier
# for you and everyone else to keep all your related work together.

# Packages need to be installed to your version of R. THIS ONLY NEEDS TO HAPPEN
# ONCE. Do not attempt to install packages multiple times. It isn't necessary.

# Let's install a very commonly-used package, tidyverse. Tidyverse is actually 
# a massive collection of packages, all of which provide functions to make data
# handling and manipulation easier.

install.packages('tidyverse')

# Once you run this line of code, your computer should be able to automatically
# connect to the repository of packages hosted by R on the Comprehensive R
# Archive Network (CRAN). You may be asked which "mirror" you want to use. The
# "mirrors" are the physical locations of servers that hold copies of R packages.
# Best practice is to select a mirror that is closest to you. The closest mirror
# to southern Maine is Case Western Reserve University in Pittsburgh. You can
# Google CRAN mirrors to find other servers if you're not in Maine.

# Every time you want to use a function from a package, you need to load the
# package into your current R session. This needs to happen once every time you
# open R. 

# This is like looking up a formula in a math book. If you don't have it memorized,
# you'll need to open the book with the formula in it to the correct page every 
# time you want to use the formula.

# R does not "remember" the functions within these packages from session to session.
# So it's like you need to open the book to the formula page for it every time.

library(tidyverse)

# Now you can use the various functions within this package.

#### here package ####
# I use this package every day to make data loading easy. Let's install it.
install.packages("here")

# I like this package because I'm frequently pulling data from multiple sub-folders
# from within an overall project folder. It's annoying to have to type out the full
# working directory every time I want to pull from a different sub-folder. By using
# the "here" package, I can instead set one overall working directory (or root) and 
# then navigate between sub-folders by simply calling the here() function. Watch.

# Set the working directory to the folder where you save all the R stuff I give you.
# Keep in mind, you should be organizing your files into separate folders for each
# lesson. This is just good data storage practice.
setwd('C:/Users/klankowicz/Documents/GitHub/R-Stats-for-Interns')

# Then, load the package.
library(here)

# You should see a line of text in your console telling you that "here() starts
# at blah blah blah." This is good. Now we can use the here() function to switch 
# folders easily. Let's set the working directory to the overall R folder.
setwd(here())

# Notice that you don't need that long string of "C:/Username/blahblah" that 
# you needed to provide before.

# You can also navigate through subfolders. Let's make a new folder and navigate
# to it.

# Make a new folder called "Test folder" directly from R
new_folder <- here('Test folder')
dir.create(new_folder)

# Check where we have set our working directory
getwd()

# Set working directory to our new "Test folder"
setwd(here('Test folder'))

# Check our results.
getwd()

# Great! You now should understand the basics of installing and loading packages,
# the purpose of setting a working directory, and the utility of the here package.

#### GitHub ####
# This is a bonus section you can view on your own if you want.

# The field of natural sciences is highly collaborative. Frequently, you'll be
# working with people on a research paper. You'll also frequently be updating 
# your data and analyses. It can be really challenging to maintain data integrity.

# This is where version control comes in. If you have a dataset or a script with
# code in it being used on a collaborative project, you'll want to know WHO changes 
# WHAT and WHEN.

# GitHub is a commonly used cloud- and platform-based software for version control.

# Please go to GitHub.com and make an account, if you do not already have one.

# Then download GitHub desktop (https://desktop.github.com/)

# Let's make sure you all have a copy of our lecture data. I (klankowi) am the host
# for this repository. Please login to GitHub and go to 
# https://github.com/klankowi/R-Stats-for-Interns

# Once on the page, click 'Fork.' This is the language used when you want to 
# copy someone's repository. For now, select the option that you want to copy my
# files for your own use, not to upload to the master version. This way, you can
# play with the data present in the repository without any risk of affecting the
# master data.

# Once you've forked the repository, go to GitHub desktop. Click File, then
# Clone Repository. This will copy all my files to your computer.

# In the top right of RStudio, you'll see a button for "projects." Click on it.

# Click New Project, then Existing Directory, then navigate to the folder on your
# machine that has all the files from the CBASS GitHub repository you just cloned.

# Once you have this project set up, you have super-easy access to everything in 
# our R lectures GitHub repository.

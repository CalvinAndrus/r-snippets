#-------------------------------------------------------------------------------
# Fortune.R - Version 0.1 - 25 November 2016
#-------------------------------------------------------------------------------
# This work is licensed under a
# Creative Commons Attribution-NonCommercial-ShareAlike 3.0 Unported License.
# http://creativecommons.org/licenses/by-nc-sa/3.0/us/
#
# by:
# D. Calvin Andrus, Ph.D.
# Sterling, VA 20164
# calvin.andrus@gmail.com
#-------------------------------------------------------------------------------
# developed on:
# R version 3.3.1 (2016-06-21)
# Platform: x86_64-apple-darwin13.4.0 (64-bit)
# Running under: OS X 10.12.1 (Sierra)
#
# Following the Google R Style Guide
# http://google-styleguide.googlecode.com/svn/trunk/google-r-style.html
#-------------------------------------------------------------------------------
# Generate a random "cowsay" animal with a random R fortune.
#
# Based on:
# David Smith (24 November 2016) "Happy Thanksgiving"
# On the _Revolutions_ Blog
# http://blog.revolutionanalytics.com/2016/11/happy-thanksgiving.html
#-------------------------------------------------------------------------------
#
#-------------------------------------------------------------------------------
# initialize and describe the environment
#-------------------------------------------------------------------------------

rm(list=ls())
# Always us gc() after rm() to force the release of RAM back to system
# Memory Garbage Collector: Ncells for fixed obj, Vcells for variable obj
gc(TRUE)

cat("\014")
paste("Today is: ", date())
Sys.getenv("RSTUDIO_USER_IDENTITY")
sessionInfo()
system.file()
options(digits=3)
setwd("/Users/Calvin/Google Drive/Projects/R-Misc/Fortune/")
getwd()
list.files()

#-------------------------------------------------------------------------------
# source() and library() functions follow . . .
#-------------------------------------------------------------------------------

# The "cowsay" package has a number of dependencies -- including "fortune"

library("fortunes")
library("cowsay")

#-------------------------------------------------------------------------------
# locally defined functions follow . . .
#-------------------------------------------------------------------------------

#-------------------------------------------------------------------------------
# Double check the environment
#-------------------------------------------------------------------------------
search()
objects()
# data()
paste("Obj Mem Used: ", (object.size(x=lapply(ls(), get)))/1000000, units="MB")
#-------------------------------------------------------------------------------
# executable statements follow . . .
#-------------------------------------------------------------------------------

# generate a random fortune from the fortunes package
fortune()

# This fortune was selected from a datafrome embedded in the fortunes package
# To see all the fortunes, extract the dataframe
f.df <- read.fortunes()
str(f.df)

# There should be 379 fortunes, each quote with 4 metadata fields
# To generate a particular fortune, specify the observation number
f.df[137, ]
fortune(which=137)

#-------------------------------------------------------------------------------

# Have the default animal to say a phrase from the cowsay package
say("Hello World")

# Use the built-in cowsay connector to fortune to say a particular fortune
say(fortune=137)

# Specify a particular animal
say("Hello World", by = "cow")

# The animal images are stored in a named character vector in the cowsay package
# The vector is named "animals" and has been placed in the environment
# To see all of the animals, extract the attribute "names" from the vector
str(animals)
names.c <- attributes(animals)$names
names.c

# Specify an animal from the names.c variable, then randomly pick
say("Hello World", names.c[13])
say("Hello World", names.c[runif(1, min=1, max=34)])

# Note: the hypnotoad animal overrides the message
say("Hello World", by = "hypnotoad")

#-------------------------------------------------------------------------------

# Have a random animal say a random quote
# (bypassing the intermediate variables above)
say(fortune=(as.integer(runif(1, min=1, max=379))),
    by = (attributes(animals)$names[runif(1, min=1, max=34)]))

#-------------------------------------------------------------------------------
# end of executable statements
#-------------------------------------------------------------------------------

#-------------------------------------------------------------------------------
# backup material
#-------------------------------------------------------------------------------

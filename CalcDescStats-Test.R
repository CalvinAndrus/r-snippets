#-------------------------------------------------------------------------------
# CalDescStats-Test.R - Version 0.1 - 26 April 2017
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
# R version 3.4.0 (2017-04-21) -- "You Stupid Darkness"
# Platform: x86_64-apple-darwin15.6.0 (64-bit)
# Running under: OS X 10.12.4 -- "Sierra"
#
# Following the Google R Style Guide
# http://google-styleguide.googlecode.com/svn/trunk/google-r-style.html
#-------------------------------------------------------------------------------
# This is a "unit test" program to be sure the CalcDescStats function works.
#-------------------------------------------------------------------------------#
rm(list=ls())
# Always us gc() after rm() to force release RAM back to system
# Memory Garbage Collector: Ncells for fixed obj, Vcells for variable obj
gc(TRUE)

cat("\014")
paste("Today is: ", date())
Sys.getenv("RSTUDIO_USER_IDENTITY")
sessionInfo()
system.file()
options(digits=3)
setwd("/Users/Calvin/Google Drive/Projects/R-Misc/Freq/")
getwd()
list.files()

#-------------------------------------------------------------------------------
# source() and library() functions follow . . .
#-------------------------------------------------------------------------------

# Skewness and Kurtosis from the e1071 package

source("CalcDescStats.R")

#-------------------------------------------------------------------------------
# locally defined functions follow . . .
#-------------------------------------------------------------------------------

#-------------------------------------------------------------------------------
# Double check the environment
#-------------------------------------------------------------------------------
# search()
# objects()
# data()
# paste("Obj Mem Used: ", (object.size(x=lapply(ls(), get)))/1000000, units="MB")
#-------------------------------------------------------------------------------
# executable statements follow . . .
#-------------------------------------------------------------------------------

# Generate 5 random variables
uniform <- runif(5000, min=0, max=100)
normal <- rnorm(5000, mean=50, sd=10)
tdist <- rt(5000, df=4) + 50
expon <- rexp(5000, rate=1.2) + 46
binom <- rbinom(5000, size=8, prob=0.5) +46

# Put into dataframe
test.df <- data.frame(uniform, normal, tdist, expon, binom)

test.out <- CalcDescStats(test.df)
str(test.out)
test.out

#-------------------------------------------------------------------------------
# end of executable statements
#-------------------------------------------------------------------------------

#-------------------------------------------------------------------------------
# backup material
#-------------------------------------------------------------------------------


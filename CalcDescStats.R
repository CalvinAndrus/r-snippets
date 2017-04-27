#-------------------------------------------------------------------------------
# CalDescStats.R - Version 0.1 - 26 April 2017
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
#
# Function to calculate more complete summary of descriptive statistics.
# Designed for interval-level data, with no missing values
# It does no error checking
#
# Designed to be used in other R scripts via the source() function
#
# The function accepts a data frame as an argument and returns a named number
#
# CalcDescStats("data.df")
#
# The named number uses the data frame column names in the rows, and
# the descriptive statistics shorthand names in the columns.
#
# Here is the definitions of the shorthand names
#
# nn -- number of rows of for the variable
# mo -- mode
# mn -- minimum
# q1 -- 1st quartile (25th percentile)
# md -- median (50th percentile)
# q3 -- 3rd quartile (75th percentile)
# mx -- maximum
# rg -- range
# av -- mean (arithmetic average)
# vr -- variance
# sd -- standard deviation
# se -- standard error of the mean
# sk -- skewness
# kt -- kurtosis
#
#-------------------------------------------------------------------------------
#
# Skewness and Kurtosis from the e1071 package

library(e1071)

#-------------------------------------------------------------------------------
# Auxiiary function
#-------------------------------------------------------------------------------

# Ken Williams' Mode Function
# http://stackoverflow.com/questions/2547402
#       /is-there-a-built-in-function-for-finding-the-mode
#  first mode only

kwmo <- function(x) {
  ux <- unique(x)
  ux[which.max(tabulate(match(x, ux)))]
}

#-------------------------------------------------------------------------------
# The main function
#-------------------------------------------------------------------------------

CalcDescStats <- function(df){
  nn <- sapply(df, function(x) {length(x)})
  mo <- sapply(df, function(x) {kwmo(x)})
  mn <- sapply(df, function(x) {min(x)})
  q1 <- sapply(df, function(x) {quantile(x)[2]})
  md <- sapply(df, function(x) {median(x)})
  q3 <- sapply(df, function(x) {quantile(x)[4]})
  mx <- sapply(df, function(x) {max(x)})
  rg <- sapply(df, function(x) {max(x) - min(x)})
  av <- sapply(df, function(x) {mean(x)})
  vr <- sapply(df, function(x) {var(x)})
  sd <- sapply(df, function(x) {sd(x)})
  se <- sapply(df, function(x) {sd(x)/sqrt(length(x))})
  sk <- sapply(df, function(x) {skewness(x, type=2)})
  kt <- sapply(df, function(x) {kurtosis(x, type=2)})

  options(scipen=999)
  desc.n <- cbind(nn, mo, mn, q1, md, q3, mx, rg, av, vr, sd, se, sk, kt)
  return(desc.n)
}

#-------------------------------------------------------------------------------
# end of executable statements
#-------------------------------------------------------------------------------

#-------------------------------------------------------------------------------
# backup material
#-------------------------------------------------------------------------------

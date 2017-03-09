#-------------------------------------------------------------------------------
# Generic.R - Version 0.2 - 07 March 2017
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
# R version 3.3.2 (2016-10-31) -- "Sincere Pumpkin Patch"
# Platform: x86_64-apple-darwin13.4.0 (64-bit)
# Running under: OS X 10.12.2 -- "Sierra"
#
# Following the Google R Style Guide
# http://google-styleguide.googlecode.com/svn/trunk/google-r-style.html
#-------------------------------------------------------------------------------
# Read an Microsoft Excel file into an R data frame.
#
# Based on:
# Jeffery Stanton (2012) *An Introduction to Data Science*, chap. 14
# http://jsresearch.net/groups/teachdatascience/
# which is released under a CC by-nc-sa 3.0 license.
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
setwd("/Users/Calvin/Google Drive/Projects/R-Misc/Excel/")
getwd()
list.files()

#-------------------------------------------------------------------------------
# source() and library() functions follow . . .
#-------------------------------------------------------------------------------

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


#-------------------------------------------------------------------------------
# end of executable statements
#-------------------------------------------------------------------------------

#-------------------------------------------------------------------------------
# backup material
#-------------------------------------------------------------------------------


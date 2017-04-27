#-------------------------------------------------------------------------------
# Date-01.R - Version 0.2 - 22 November 2013
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
# R version 3.0.1 (2013-05-16) -- "Good Sport"
# Platform: x86_64-apple-darwin10.8.0 (64-bit)

# following the Google R Style Guide
# http://google-styleguide.googlecode.com/svn/trunk/google-r-style.html
#-------------------------------------------------------------------------------
# Explore Date Formats

# Based on:
# Mollie's Research Blog
# Date Formats in R
# http://www.mollietaylor.com/2013/08/date-formats-in-r.html
#
# And also on Joseph Adler(2013) *R in a Nutshell* 2nd ed., pp.94-95
#-------------------------------------------------------------------------------
#
#-------------------------------------------------------------------------------
# initialize and describe the environment
#-------------------------------------------------------------------------------
rm(list=ls())
paste("Today is: ", date())
sessionInfo()
options(digits=3)
setwd("/Users/Calvin/Google Drive/Projects/R-Misc/Dates/")
getwd()

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
#-------------------------------------------------------------------------------
# executable statements follow . . .
#-------------------------------------------------------------------------------

# Help
help(date)
help(POSIXt)
help(strptime)
help(strftime)

# Simple Functions
date()
str(date())
class(date())
typeof(date())
attributes(date())

Sys.Date()
str(Sys.Date())
class(Sys.Date())
typeof(Sys.Date())
attributes(Sys.Date())

# Date as the day
d1 <- as.Date(date())
d1
str(d1)
class(d1)
typeof(d1)
attributes(d1)
length(d1)
fix(d1)

# Date as the number of seconds since 01 January 1970, 12:00am
# ct = count time
d2 <- as.POSIXct(date())
d2
str(d2)
class(d2)
typeof(d2)
attributes(d2)
length(d2)
fix(d2)

# Date as a list
# lt = list time
d3 <- as.POSIXlt(Sys.Date())
d3
str(d3)
class(d3)
typeof(d3)
attributes(d3)
length(d3)
fix(d3)

# Match date formatters to input strings
dates <- c("05/27/84", "07/07/05")
betterDates <- as.Date(dates, format = "%m/%d/%y")
betterDates

# Ditto
dates <- c("May 27 1984", "July 7 2005")
betterDates <- as.Date(dates, format = "%B %d %Y")
betterDates

# from Windows Excel:
dates <- c(30829, 38540)
betterDates <- as.Date(dates, origin = "1899-12-30")
betterDates

# from Mac Excel:
dates <- c(29367, 37078)
betterDates <- as.Date(dates, origin = "1904-01-01")
betterDates

# reformat dates
format(betterDates, "%a %b %d")

# Correct Centuries
dates <- c("05/27/84", "07/07/05", "08/17/20")
betterDates <- as.Date(dates, "%m/%d/%y")
betterDates

correctCentury <- as.Date(ifelse(betterDates > Sys.Date(), 
                                 format(betterDates, "19%y-%m-%d"), 
                                 format(betterDates)))
correctCentury

# Unix origin date
as.numeric(as.Date("1970-01-01", format="%Y-%m-%d"))

# Today's Date, back and forth
date()
as.numeric(as.Date(date(), "%c"))
td1 <- as.numeric(as.Date(date(), "%c"))
td1
as.Date.numeric(td1, origin = "1970-01-01")

td2 <- as.numeric(strptime(date(), "%c"))
print(td2, digits=16)
as.POSIXct(td2, origin = "1970-01-01")

rm("td1", "td2")

# Day of the week, 0=Sunday, 6=Saturday
all.date <- as.Date(c("2013-08-01", "2013-08-02", "2013-08-03", "2013-08-04"))
pos.date <- as.POSIXlt(all.date,format="%Y-%m-%d")
day.date <- pos.date$wday
day.date

# Day of the week

weekdays(all.date)

# Calculating with Dates
mean(betterDates)
max(betterDates)
min(betterDates)

# strftime, strptime -- date-time conversion to/from character
as.Date("2013-08-21T13:00", format="%Y-%m-%dT%H:%M")
strptime("2013-08-21T13:00", format="%Y-%m-%dT%H:%M")

as.numeric(as.Date("2013-08-21T13:00", format="%Y-%m-%dT%H:%M"))
as.numeric(strptime("2013-08-21T13:00", format="%Y-%m-%dT%H:%M"))
x <- as.numeric(strptime("2013-08-21T13:00", format="%Y-%m-%dT%H:%M"))
print(x, digits=16)

# Creating a time series of consecutive dates
begin.date <- as.numeric(as.Date("2000-09-25"))
end.date <- as.numeric(as.Date("2001-09-24"))
begin.date
end.date

ts.raw <- seq(begin.date, end.date, 1)
length(ts.raw)
vals <- rep(0, 365)

# make dataframe
ts.df <- as.data.frame(vals)
ts.df$raw <- ts.raw
ts.df$ts <- as.Date(ts.raw, origin = "1970-01-01")
str(ts.df)
ts.df

rm("begin.date", "end.date", "ts.raw", "vals")

#-------------------------------------------------------------------------------
# Time series objects also have implied dates
# Price of turkeys from library(nutshell), data(turkey.price.ts)

ts(1:8, start=c(2009, 2), frequency=4)

t.ts <-structure(c(1.58, 1.75, 1.63, 1.45, 1.56, 2.07, 1.81, 1.74, 1.54, 
             1.45, 0.57, 1.15, 1.5, 1.66, 1.34, 1.67, 1.81, 1.6, 1.7, 1.87, 
             1.47, 1.59, 0.74, 0.82, 1.43, 1.77, 1.47, 1.38, 1.66, 1.66, 1.61, 
             1.74, 1.62, 1.39, 0.7, 1.07, 1.48, 1.48, 1.5, 1.27, 1.56, 1.61, 
             1.55, 1.69, 1.49, 1.32, 0.53, 1.03, 1.62, 1.63, 1.4, 1.73, 1.73, 
             1.8, 1.92, 1.77, 1.71, 1.53, 0.67, 1.09, 1.71, 1.9, 1.68, 1.46, 
             1.86, 1.85, 1.88, 1.86, 1.62, 1.45, 0.67, 1.18, 1.68, 1.74, 1.7, 
             1.49, 1.81, 1.96, 1.97, 1.91, 1.89, 1.65, 0.7, 1.17, 1.76, 1.78, 
             1.53, 1.9), .Tsp = c(2001, 2008.25, 12), class = "ts")
str(t.ts)
class(t.ts)
typeof(t.ts)
attributes(t.ts)
length(t.ts)
fix(t.ts)
t.ts
plot(t.ts)

#-------------------------------------------------------------------------------
# end of executable statements
#-------------------------------------------------------------------------------

#-------------------------------------------------------------------------------
# backup material
#-------------------------------------------------------------------------------



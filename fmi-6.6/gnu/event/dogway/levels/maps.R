#!/usr/bin/r

# Date-Time Classes

# Description
# Description of the classes "POSIXlt" and "POSIXct" representing calendar dates and times.

# Usage
## S3 method for class 'POSIXct'
# print(x, tz = "", usetz = TRUE, max = NULL, ...)

## S3 method for class 'POSIXct'
# summary(object, digits = 15, ...)

# time + z
# z + time
# time - z
# time1 lop time2

# Arguments

# x, object	
# an object to be printed or summarized from one of the date-time classes.

# tz, usetz	
# for timezone formatting, passed to format.POSIXct.

# max	
# numeric or NULL, specifying the maximal number of entries to be printed. By default, 
# when NULL, getOption("max.print") used.

# digits	
# number of significant digits for the computations: should be high enough to represent 
# the least important time unit exactly.

# ...	
# further arguments to be passed from or to other methods.

# time	
# date-time objects

# time1, time2	
# date-time objects or character vectors. (Character vectors are converted 
# by as.POSIXct.)

# z	
# a numeric vector (in seconds)

# lop	
# one of ==, !=, <, <=, > or >=.

# Details
# There are two basic classes of date/times. Class "POSIXct" represents the (signed) 
# number of seconds since the beginning of 1970 (in the UTC time zone) as a numeric 
# vector. Class "POSIXlt" is a named list of vectors representing

# sec
# 0–61: seconds.

# min
# 0–59: minutes.

# hour
# 0–23: hours.

# mday
# 1–31: day of the month

# mon
# 0–11: months after the first of the year.

# year
# years since 1900.

# wday
# 0–6 day of the week, starting on Sunday.

# yday
# 0–365: day of the year (365 only in leap years).

# isdst
# Daylight Saving Time flag. Positive if in force, 
# zero if not, negative if unknown.

# zone
# (Optional.) The abbreviation for the time zone in force at that 
# time: "" if unknown (but "" might also be used for UTC).

# gmtoff
# (Optional.) The offset in seconds from GMT: positive values are East 
# of the meridian. Usually NA if unknown, but 0 could mean unknown.

# (The last two components are not present for times in UTC and are 
# platform-dependent: they are supported on platforms based on BSD 
# or glibc (including Linux and macOS) and those using the tzcode 
# implementation shipped with R (including Windows). But they are 
# not necessarily set.). Note that the internal list structure is 
# somewhat hidden, as many methods (including length(x), print() 
# and str) apply to the abstract date-time vector, as for "POSIXct". 
# As from R 3.5.0, one can extract and replace single components via 
# [ indexing with two indices (see the examples). The classes 
# correspond to the POSIX/C99 constructs of ‘calendar time’ (the 
# time_t data type) and ‘local time’ (or broken-down time, the 
# struct tm data type), from which they also inherit their names. 
# The components of "POSIXlt" are integer vectors, except sec and 
# zone.

# "POSIXct" is more convenient for including in data frames, and 
# "POSIXlt" is closer to human-readable forms. A virtual class 
# "POSIXt" exists from which both of the classes inherit: it is 
# used to allow operations such as subtraction to mix the two 
# classes.

# Components wday and yday of "POSIXlt" are for information, and 
# are not used in the conversion to calendar time. However, isdst 
# is needed to distinguish times at the end of DST: typically 1am 
# to 2am occurs twice, first in DST and then in standard time. At 
# all other times isdst can be deduced from the first six values, 
# but the behaviour if it is set incorrectly is platform-dependent.

# Logical comparisons and some arithmetic operations are available 
# for both classes. One can add or subtract a number of seconds from 
# a date-time object, but not add two date-time objects. Subtraction 
# of two date-time objects is equivalent to using difftime. Be aware 
# that "POSIXlt" objects will be interpreted as being in the current 
# time zone for these operations unless a time zone has been specified.

# "POSIXlt" objects will often have an attribute "tzone", a character 
# vector of length 3 giving the time zone name (from the TZ environment 
# variable or argument tz of functions creating "POSIXlt" objects; "" 
# marks the current time zone) and the names of the base time zone 
# and the alternate (daylight-saving) time zone. Sometimes this may 
# just be of length one, giving the time zone name.

# "POSIXct" objects may also have an attribute "tzone", a character 
# vector of length one. If set to a non-empty value, it will determine 
# how the object is converted to class "POSIXlt" and in particular how 
# it is printed. This is usually desirable, but if you want to specify 
# an object in a particular time zone but to be printed in the current 
# time zone you may want to remove the "tzone" attribute (e.g., by c(x)).

# Unfortunately, the conversion is complicated by the operation of time 
# zones and leap seconds (according to this version of R's data, 27 days 
# have been 86401 seconds long so far, the last being on (actually, 
# immediately before) 2017-01-01: the times of the extra seconds are in 
# the object .leap.seconds). The details of this are entrusted to the OS 
# services where possible. It seems that some rare systems used to use 
# leap seconds, but all known current platforms ignore them (as required 
# by POSIX). This is detected and corrected for at build time, so "POSIXct" 
# times used by R do not include leap seconds on any platform.

# Using c on "POSIXlt" objects converts them to the current time zone, and 
# on "POSIXct" objects drops any "tzone" attributes, unless they are all 
# marked with the same time zone.

# A few times have specific issues. First, the leap seconds are ignored, 
# and real times such as "2005-12-31 23:59:60" are (probably) treated as 
# the next second. However, they will never be generated by R, and are 
# unlikely to arise as input. Second, on some OSes there is a problem 
# in the POSIX/C99 standard with "1969-12-31 23:59:59 UTC", which is 
# -1 in calendar time and that value is on those OSes also used as an 
# error code. Thus as.POSIXct("1969-12-31 23:59:59", format = 
# "%Y-%m-%d %H:%M:%S", tz = "UTC") may give NA, and hence 
# as.POSIXct("1969-12-31 23:59:59", tz = "UTC") will give 
# "1969-12-31 23:59:00". Other OSes (including the code used by R 
# on Windows) report errors separately and so are able to handle 
# that time as valid.

# The print methods respect options("max.print").

# Sub-second Accuracy
# Classes "POSIXct" and "POSIXlt" are able to express fractions 
# of a second. (Conversion of fractions between the two forms may 
# not be exact, but will have better than microsecond accuracy.)

# Fractional seconds are printed only if options("digits.secs") 
# is set: see strftime.

# Valid ranges for times
# The "POSIXlt" class can represent a very wide range of times 
# (up to billions of years), but such times can only be interpreted 
# with reference to a time zone.

# The concept of time zones was first adopted in the nineteenth century, 
# and the Gregorian calendar was introduced in 1582 but not universally 
# adopted until 1927. OS services almost invariably assume the Gregorian 
# calendar and may assume that the time zone that was first enacted for 
# the location was in force before that date. (The earliest legislated 
# time zone seems to have been London on 1847-12-01.) Some OSes assume 
# the previous use of ‘local time’ based on the longitude of a location 
# within the time zone.

# Most operating systems represent POSIXct times as C type long. This 
# means that on 32-bit OSes this covers the period 1902 to 2037. On all 
# known 64-bit platforms and for the code we use on 32-bit Windows, the 
# range of representable times is billions of years: however, not all can 
# convert correctly times before 1902 or after 2037. A few benighted OSes 
# used a unsigned type and so cannot represent times before 1970.

# Where possible the platform limits are detected, and outside the limits 
# we use our own C code. This uses the offset from GMT in use either for 
# 1902 (when there was no DST) or that predicted for one of 2030 to 2037 
# (chosen so that the likely DST transition days are Sundays), and uses 
# the alternate (daylight-saving) time zone only if isdst is positive or 
# (if -1) if DST was predicted to be in operation in the 2030s on that day.

# Note that there are places (e.g., Rome) whose offset from UTC varied 
# in the years prior to 1902, and these will be handled correctly only 
# where there is OS support.

# There is no reason to suppose that the DST rules will remain the same 
# in the future, and indeed the US legislated in 2005 to change its rules 
# as from 2007, with a possible future reversion. So conversions for times 
# more than a year or two ahead are speculative.

# Warnings
# Some Unix-like systems (especially Linux ones) do not have environment 
# variable TZ set, yet have internal code that expects it (as does POSIX). 
# We have tried to work around this, but if you get unexpected results try 
# setting TZ. See Sys.timezone for valid settings.

# Great care is needed when comparing objects of class "POSIXlt". Not only 
# are components and attributes optional; several components may have values 
# meaning ‘not yet determined’ and the same time represented in different time 
# zones will look quite different.

# Currently the order of the list components of "POSIXlt" objects must not be 
# changed, as several C-based conversion methods rely on the order for 
# efficiency.

# References
# Ripley, B. D. and Hornik, K. (2001). “Date-time classes.” R News, 1(2), 
# 8–11. https://www.r-project.org/doc/Rnews/Rnews_2001-2.pdf.

# See Also
# Dates for dates without times.

# as.POSIXct and as.POSIXlt for conversion between the classes.

# strptime for conversion to and from character representations.

# Sys.time for clock time as a "POSIXct" object.

# difftime for time intervals.

# cut.POSIXt, seq.POSIXt, round.POSIXt and trunc.POSIXt for methods 
# for these classes.

# weekdays for convenience extraction functions.

# Examples
(z <- Sys.time())             # the current date, as class "POSIXct"

Sys.time() - 3600             # an hour ago

as.POSIXlt(Sys.time(), "GMT") # the current time in GMT
format(.leap.seconds)         # the leap seconds in your time zone
print(.leap.seconds, tz = "PST8PDT")  # and in Seattle's


## look at *internal* representation of "POSIXlt" :
leapS <- as.POSIXlt(.leap.seconds)
names(leapS) ; is.list(leapS)
## str() "too smart" -->  need unclass(.):
utils::str(unclass(leapS), vec.len = 7)
## Extracting *single* components of POSIXlt objects:
leapS[1 : 5, "year"]

##  length(.) <- n   now works for "POSIXct" and "POSIXlt" :
for(lpS in list(.leap.seconds, leapS)) {
    ls <- lpS; length(ls) <- 12
    l2 <- lpS; length(l2) <- 5 + length(lpS)
    stopifnot(exprs = {
      ## length(.) <- * is compatible to subsetting/indexing:
      identical(ls, lpS[seq_along(ls)])
      identical(l2, lpS[seq_along(l2)])
      ## has filled with NA's
      is.na(l2[(length(lpS)+1):length(l2)])
    })
}

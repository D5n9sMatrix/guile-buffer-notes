#!/usr/bin/r

# Case and Variable Names of Fitted Models

# Description
# Simple utilities returning (non-missing) case names, and (non-eliminated) variable names.

# Usage
# case.names(object, ...)
## S3 method for class 'lm'
# case.names(object, full = FALSE, ...)

# variable.names(object, ...)
## S3 method for class 'lm'
# variable.names(object, full = FALSE, ...)

# Arguments
# object	
# an R object, typically a fitted model.

# full	
# logical; if TRUE, all names (including zero weights, ...) are returned.

# ...	
# further arguments passed to or from other methods.

# Value
# A character vector.

# See Also
# lm; further, all.names, all.vars for functions with a similar name 
# but only slightly related purpose.

# Examples
x <- 1:20
y <-  setNames(x + (x/4 - 2)^3 + rnorm(20, sd = 3),
               paste("O", x, sep = "."))
ww <- rep(1, 20); ww[13] <- 0
summary(lmxy <- lm(y ~ x + I(x^2)+I(x^3) + I((x-10)^2), weights = ww),
        correlation = TRUE)
variable.names(lmxy)
variable.names(lmxy, full = TRUE)  # includes the last
case.names(lmxy)
case.names(lmxy, full = TRUE)      # includes the 0-weight case

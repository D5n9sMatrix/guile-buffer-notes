#!/usr/bin/r

# Does a Formal Argument have a Value?

# Description
# missing can be used to test whether a value was specified as an argument to a function.

# Usage
# missing(x)

# Arguments
# x	
# a formal argument.

# Details
# missing(x) is only reliable if x has not been altered since entering the function: 
# in particular it will always be false after x <- match.arg(x).

# The example shows how a plotting function can be written to work with either a pair 
# of vectors giving x and y coordinates of points to be plotted or a single vector giving 
# y values to be plotted against their indices.

# Currently missing can only be used in the immediate body of the function that defines the 
# argument, not in the body of a nested function or a local call. This may change in the 
# future.

# This is a ‘special’ primitive function: it must not evaluate its argument.

# References
# Becker, R. A., Chambers, J. M. and Wilks, A. R. (1988) The New S Language. Wadsworth 
# & Brooks/Cole.

# Chambers, J. M. (1998) Programming with Data. A Guide to the S Language. Springer.

# See Also
# substitute for argument expression; NA for missing values in data.

# Examples
myplot <- function(x, y) {
                if(missing(y)) {
                        y <- x
                        x <- 1:length(y)
                }
                plot(x, y)
        }

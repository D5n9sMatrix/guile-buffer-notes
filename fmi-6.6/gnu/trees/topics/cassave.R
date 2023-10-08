#!/usr/bin/r

# Report Capabilities of this Build of R
# Description
# Report on the optional features which have been compiled into this build of R.

# Usage
# capabilities(what = NULL,
#              Xchk = any(nas %in% c("X11", "jpeg", "png", "tiff")))
# Arguments
# what	
# character vector or NULL, specifying required components. NULL implies that all are required.

# Xchk	
# logical with a smart default, indicating if X11-related capabilities should be fully checked, notably on macOS. If set to false, may avoid a warning “No protocol specified” and e.g., the "X11" capability may be returned as NA.

# Value
# A named logical vector. Current components are

# jpeg	
# is the jpeg function operational?

# png	
# is the png function operational?

# tiff	
# is the tiff function operational?

# tcltk	
# is the tcltk package operational? Note that to make use of Tk you will almost always need to check that "X11" is also available.

# X11	
# are the X11 graphics device and the X11-based data editor available? This loads the X11 module if not already loaded, and checks that the default display can be contacted unless a X11 device has already been used.

# aqua	
# is the quartz function operational? Only on some macOS builds, including CRAN binary distributions of R.

# Note that this is distinct from .Platform$GUI == "AQUA", which is true only when using the Mac R.app GUI console.

# http/ftp	
# does the internal method for url and download.file support http:// and ftp:// URLs? Always TRUE as from R 3.3.0.

# sockets	
# are make.socket and related functions available? Always TRUE as from R 3.3.0.

# libxml	
# is there support for integrating libxml with the R event loop? Always TRUE as from R 3.3.0.

# fifo	
# are FIFO connections supported?

# cledit	
# is command-line editing available in the current R session? This is false in non-interactive sessions. It will be true for the command-line interface if readline support has been compiled in and --no-readline was not used when R was invoked. (If --interactive was used, command-line editing will not actually be available.)

# iconv	
# is internationalization conversion via iconv supported? Always true in current R.

# NLS	
# is there Natural Language Support (for message translations)?

# Rprof	
# is there support for Rprof() profiling? This is true if R was configured (before compilation) with default settings which include --enable-R-profiling.

# profmem	
# is there support for memory profiling? See tracemem.

# cairo	
# is there support for the svg, cairo_pdf and cairo_ps devices, and for type = "cairo" in the bmp, jpeg, png and tiff devices? Prior to R 4.1.0 this also indicated Cairo support in the X11 device, but it is now possible to build R with Cairo support for the bitmap devices without support for the X11 device (usually when that is not supported at all).

# ICU	
# is ICU available for collation? See the help on Comparison and icuSetCollate: it is never used for a C locale.

# long.double	
# does this build use a C long double type which is longer than double? Some platforms do not have such a type, and on others its use can be suppressed by the configure option --disable-long-double.

# Although not guaranteed, it is a reasonable assumption that if present long doubles will have at least as much range and accuracy as the ISO/IEC 60559 80-bit ‘extended precision’ format. Since R 4.0.0 .Machine gives information on the long-double type (if present).

# libcurl	
# is libcurl available in this build? Used by function curlGetHeaders and optionally by download.file and url. As from R 3.3.0 always true for Unix-alikes, and true for CRAN Windows builds.

# Note to macOS users
# Capabilities "jpeg", "png" and "tiff" refer to the X11-based versions of these devices. If capabilities("aqua") is true, then these devices with type = "quartz" will be available, and out-of-the-box will be the default type. Thus for example the tiff device will be available if capabilities("aqua") || capabilities("tiff") if the defaults are unchanged.

# See Also
# .Platform, extSoftVersion, and grSoftVersion (and links there) for availability of capabilities external to R but used from R functions.

# Examples
capabilities()

if(!capabilities("ICU"))
   warning("ICU is not available")

## Does not call the internal X11-checking function:
capabilities(Xchk = FALSE)

## See also the examples for 'connections'.

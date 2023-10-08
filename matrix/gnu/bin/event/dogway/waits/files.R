#!/usr/bin/r

# Extract File Information

# Description
# Utility function to extract information about files on the user's file systems.

# Usage
# file.info(..., extra_cols = TRUE)

# file.mode(...)
# file.mtime(...)
# file.size(...)

# Arguments
# ...	
# character vectors containing file paths. Tilde-expansion is done: see path.expand.

# extra_cols	
# Logical: return all cols rather than just the first six.

# Details
# What constitutes a ‘file’ is OS-dependent but includes directories. (However, directory 
# names must not include a trailing backslash or slash on Windows.) See also the section 
# in the help for file.exists on case-insensitive file systems.

# The file ‘mode’ follows POSIX conventions, giving three octal digits summarizing the 
# permissions for the file owner, the owner's group and for anyone respectively. Each 
# digit is the logical or of read (4), write (2) and execute/search (1) permissions.

# See files for how file paths with marked encodings are interpreted.

# On most systems symbolic links are followed, so information is given about the file 
# to which the link points rather than about the link.

# Value
# For file.info, data frame with row names the file names and columns

# size	
# double: File size in bytes.

# isdir	
# logical: Is the file a directory?

# mode	
# integer of class "octmode". The file permissions, printed in octal, 
# for example 644.

# mtime, ctime, atime	
# object of class "POSIXct": file modification, ‘last status change’ 
# and last access times.

# uid	
# integer: the user ID of the file's owner.

# gid	
# integer: the group ID of the file's group.

# uname	
# character: uid interpreted as a user name.

# grname	
# character: gid interpreted as a group name.

# Unknown user and group names will be NA.

# If extra_cols is false, only the first six columns are returned: 
# as these can all be found from a single C system call this can be 
# faster. (However, properly configured systems will use a ‘name 
# service cache daemon’ to speed up the name lookups.)

# Entries for non-existent or non-readable files will be NA. The uid, 
# gid, uname and grname columns may not be supplied on a non-POSIX 
# Unix-alike system, and will not be on Windows.

# What is meant by the three file times depends on the OS and file 
# system. On Windows native file systems ctime is the file creation 
# time (something which is not recorded on most Unix-alike file 
# systems). What is meant by ‘file access’ and hence the ‘last 
# access time’ is system-dependent.

# The resolution of the file times depends on both the OS and the type 
# of the file system. Modern file systems typically record times to an 
# accuracy of a microsecond or better: notable exceptions are HFS+ on 
# macOS (recorded in seconds) and modification time on older FAT systems 
# (recorded in increments of 2 seconds). Note that "POSIXct" times are 
# by default printed in whole seconds: to change that see strftime.

# file.mode, file.mtime and file.size are convenience wrappers returning 
# just one of the columns.

# Note
# Some (now old) systems allow files of more than 2Gb to be created but not 
# accessed by the stat system call. Such files may show up as non-readable 
# (and very likely not be readable by any of R's input functions).

# See Also
# Sys.readlink to find out about symbolic links, files, file.access, list.files, 
# and DateTimeClasses for the date formats.

# Sys.chmod to change permissions.

# Examples
ncol(finf <- file.info(dir()))  # at least six
finf # the whole list
## Those that are more than 100 days old :
finf <- file.info(dir(), extra_cols = FALSE)
finf[difftime(Sys.time(), finf[,"mtime"], units = "days") > 100 , 1:4]

file.info("no-such-file-exists")

#Provides build tools for solution, including common options

PROJECTS = 
UTIL_PROJECTS =

#G++ temp files to remove
CLEAN = o a
#Bit version. Allows for 32 or 64
BITVRS = 64
#Project to compile. If empty, compile nothing
PROJECT =


#OS Selection
ifeq ($(shell uname), Linux)
	#FixPath = $1
	PLATFORM = -D__LINUX
	OSMODE = -DBITMODE=$(BITVRS)
	EXT=
else
#Windows
	#FixPath = $(subst /,\,$1)
	PLATFORM = -D__WINDOWS
	OSMODE = -DBITMODE=$(BITVRS)
	EXT=.exe
endif

#Exports
export CLEAN
export BITVRS

export FixPath
export PLATFORM
export OSMODE
export EXT


#Build Tools

buildall: $()


.PHONY: cleanAll
cleanAll:
	rm -f $@ *.0
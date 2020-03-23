#Provides build tools for solution, including common options
#Compiler
CC=g++
#Target version
VERSION=
#G++ temp files to remove
CLEAN = o a
#Bit version. Allows for 32 or 64
BITVRS = 64
#Project to compile. If empty, compile nothing
PROJECT = KNX_Core


#OS Selection
ifeq ($(shell uname), Linux)
	FixPath = $1
	PLATFORM = -D__LINUX
	OSMODE = -DBITMODE=$(BITVRS)
	EXT=
else
#Windows
	FixPath = $(subst /,\,$1)
	PLATFORM = -D__WINDOWS
	OSMODE = -DBITMODE=$(BITVRS)
	EXT=.exe
endif

#Exports
export CC
export CLEAN
export BITVRS

export FixPath
export PLATFORM
export OSMODE
export EXT


#Build Tools

subdirs:
	for dir in projects/$(PROJECT); do \
	 $(MAKE) -C $$dir; \
	done

.PHONY: dev
dev: dev/dev.exe
	dev/dev.exe

.PHONY: makedev
makedev:
	$(MAKE) -C dev

.PHONY: clean
clean:
	for dir in $(PROJECT); do \
	 $(MAKE) clean -C $$dir; \
	done
	 rm -f $@ bin/32/*.a
	 rm -f $@ bin/64/*.a
	 rm -f $@ dev/*.exe
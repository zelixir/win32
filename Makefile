# -----------------------------------------------------------------------------
# $Id: Makefile,v 1.6 2003/05/29 13:18:54 reid Exp $

TOP = .
include $(TOP)/mk/boilerplate.mk

# -----------------------------------------------------------------------------

# Comment out if you want to do initial debugging on Unix systems
# SUBDIRS = cbits

ALL_DIRS = \
	System \
	System/Win32 

PACKAGE = Win32
PACKAGE_DEPS = HSgreencard

SRC_CC_OPTS += -Wall -Icbits
# SRC_HC_OPTS += -Wall 
SRC_HC_OPTS += -optc-Icbits
SRC_HC_OPTS += -cpp -fglasgow-exts -fffi 
SRC_HC_OPTS += -package HSgreencard

SRC_HADDOCK_OPTS += -t "Win32 Libraries (Win32 package)"

# yeuch, have to get Win32_CFLAGS & Win32_LIBS in through CPP to package.conf.in
comma = ,
PACKAGE_CPP_OPTS += -DWIN32_CFLAGS='$(patsubst %,$(comma)"%",$(WIN32_CFLAGS))'
PACKAGE_CPP_OPTS += -DWIN32_LIBS='$(patsubst %,$(comma)"%",$(WIN32_LIBS))'

# -----------------------------------------------------------------------------

include $(TOP)/mk/target.mk

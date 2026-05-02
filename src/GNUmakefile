##############################################################################
##
##  Makefile for Detours.
##
##  Microsoft Research Detours Package, Version 4.0.1
##
##  Copyright (c) Microsoft Corporation.  All rights reserved.
##

# This makefile is used to cross-compile a static detours.a library from Linux to Windows using GCC MinGW

.ONESHELL:

ROOT = ..
include $(ROOT)/GNUsystem.mak

#######################/#######################################################
##

# CHOST should be i686-w64-mingw32 or similar (a build of GCC or g++ with mingw, there will be a whole suite of tools with that prefix)

ifeq ($(CHOST),)
  CROSS_PREFIX = 
else
  CROSS_PREFIX = $(CHOST)-
endif

CFLAGS:=$(CFLAGS) \
    -m32 \
    -mdll
    -masm=intel \
    -march=pentium3 \
    -mavx \
    -mmmx \
    -msse \
    -mhard-float \
    -mms-bitfields \
    -D_WIN32_WINNT=0x501 \
    -DUNICODE

OBJS := \
    $(OBJD)/detours.obj     \
    $(OBJD)/modules.obj     \
    $(OBJD)/disasm.obj      \
    $(OBJD)/image.obj       \
    $(OBJD)/creatwth.obj    \
    $(OBJD)/disolx86.obj    \
    $(OBJD)/disolx64.obj    \
    $(OBJD)/disolia64.obj   \
    $(OBJD)/disolarm.obj    \
    $(OBJD)/disolarm64.obj

##############################################################################
##

CXX = $(CROSS_PREFIX)g++
AR = $(CROSS_PREFIX)ar
RANLIB = $(CROSS_PREFIX)ranlib

$(OBJD)/%.obj: %.cpp
	@if [ ! -d "$(OBJD)" ]; then mkdir "$(OBJD)" && echo   Created $(OBJD); fi
	$(CXX) $(CFLAGS) -c -o $@ $<

##############################################################################

.PHONY: all clean realclean test

all: \
	$(LIBD)/detours.a \
	$(INCD)/detours.h   \
	$(INCD)/detver.h

##############################################################################

clean:
	-for file in $$(find . -name *\~); do rm $file 2>/dev/null; done
	-rm $(LIBD)/detours.a 2>/dev/null
	-rm -rf $(OBJD) 2>/dev/null

realclean: clean

##############################################################################

$(LIBD)/detours.a : $(OBJS)
	@if [ ! -d "$(LIBD)" ]; then mkdir "$(LIBD)" && echo   Created $(LIBD); fi
	-rm $@ 2> /dev/null
	$(AR) $(ARFLAGS) $@ $^
	$(RANLIB) $@

$(INCD)/detours.h : detours.h
	@if [ ! -d "$(INCD)" ]; then mkdir "$(INCD)" && echo   Created $(INCD); fi
	cp detours.h $@

$(INCD)/detver.h : detver.h
	cp detver.h $@

$(OBJD)/detours.obj : detours.cpp detours.h
$(OBJD)/modules.obj : modules.cpp detours.h
$(OBJD)/disasm.obj : disasm.cpp detours.h
$(OBJD)/image.obj : image.cpp detours.h
$(OBJD)/creatwth.obj : creatwth.cpp uimports.cpp detours.h
$(OBJD)/disolx86.obj: disasm.cpp detours.h
$(OBJD)/disolx64.obj: disasm.cpp detours.h
$(OBJD)/disolia64.obj: disasm.cpp detours.h
$(OBJD)/disolarm.obj: disasm.cpp detours.h
$(OBJD)/disolarm64.obj: disasm.cpp detours.h

test: all
	cd $(MAKEDIR)/../samples/slept
	$(MAKE) test

################################################################# End of File.

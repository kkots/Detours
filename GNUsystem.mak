##############################################################################
##
##  Establish build target type for Detours.
##
##  Microsoft Research Detours Package
##
##  Copyright (c) Microsoft Corporation.  All rights reserved.
##

DETOURS_32BIT=1
DETOURS_BITS=32

##############################################################################
##
ifeq ($(DETOURS_CONFIG),Debug)
DETOURS_DEBUG=1
else
DETOURS_DEBUG=0
endif

INCD = $(ROOT)/include
LIBD = $(ROOT)/lib.X86$(DETOURS_CONFIG)
BIND = $(ROOT)/bin.X86$(DETOURS_CONFIG)
OBJD = obj.X86$(DETOURS_CONFIG)

INCDS = $(ROOT)/include

LIBDS = $(ROOT)/lib.x86$(DETOURS_CONFIG)

BINDS = $(ROOT)/bin.x86$(DETOURS_CONFIG)

##############################################################################

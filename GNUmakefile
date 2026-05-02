##############################################################################
##
##  Makefile for Detours.
##
##  Microsoft Research Detours Package
##
##  Copyright (c) Microsoft Corporation.  All rights reserved.
##

# This makefile is used to cross-compile a static detours.a library from Linux to Windows using GCC MinGW

.ONESHELL:

ROOT = .
include $(ROOT)/GNUsystem.mak

.PHONY: all clean realclean test

all:
	cd "$(CURDIR)"
	@if [ -f "$(CURDIR)/core/makefile" ]; then cd "$(CURDIR)/core" && $(MAKE); fi
	cd "$(CURDIR)/src"
	@$(MAKE)
	@if [ -f "$(CURDIR)/bugs/makefile" ]; then cd "$(CURDIR)/bugs" && $(MAKE); fi
	cd "$(CURDIR)"

clean:
	cd "$(CURDIR)"
	@if [ -f "$(CURDIR)/core/makefile" ]; then cd "$(CURDIR)/core" && $(MAKE) clean; fi
	cd "$(CURDIR)/src"
	@$(MAKE) clean
	@if [ -f "$(CURDIR)/bugs/makefile" ]; then cd "$(CURDIR)/bugs" && $(MAKE) clean; fi
	cd "$(CURDIR)"

realclean: clean
	cd "$(CURDIR)"
	@if [ -f "$(CURDIR)/core/makefile" ]; then cd "$(CURDIR)/core" && $(MAKE) realclean; fi
	cd "$(CURDIR)/src"
	@$(MAKE) realclean
	@if [ -f "$(CURDIR)/bugs/makefile" ]; then cd "$(CURDIR)/bugs" && $(MAKE) realclean; fi
	cd "$(CURDIR)"
	-if [ $(INCDS) != "/" ]; then rm -rf $(INCDS) 2> /dev/null; fi
	-if [ $(LIBDS) != "/" ]; then rm -rf $(LIBDS) 2> /dev/null; fi
	-if [ $(BINDS) != "/" ]; then rm -rf $(BINDS) 2> /dev/null; fi
	-rm -rf dist 2> /dev/null
	-rm docsrc/detours.chm 2> /dev/null
	-rm -f *.msi 2>/dev/null
	-for file in $$(find . -name *~ ); do rm -f $$file 2>/dev/null; done

test:

################################################################# End of File.

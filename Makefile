PREFIX=/usr/local
DESTDIR=
BUILDDIR=build
BINDIR=$(PREFIX)/bin
LIBEXECDIR=$(PREFIX)/lib

GITHGEXECDIR=$(LIBEXECDIR)/git-hg

# INSTALL=$$(which install) -c # Shell in makefiles must use $$, not $. But
# SED=$$(which sed) # <--- this is redundant, since make will use the first
#                                 utility of that name in the $PATH anyway.
# SED = gsed # <-- The reason to set these (at all) would be to allow this.
# Also, you can't quote arguments in an assignment or they aren't expanded.

INSTALL = install -c
SED = sed

GITHG_S=bin/git-hg
GITHG_F=$(BUILDDIR)/git-hg

all: $(GITHG_F)

clean:
	rm -rf $(BUILDDIR)

distclean: clean
	git clean -dxf

$(GITHG_F): 
	mkdir -p $(BUILDDIR)
	$(SED) 's|GITHG_HOME=.*|GITHG_HOME=$(GITHGEXECDIR)|' $(GITHG_S) > $@
	chmod a+rx $@

install: all
	$(INSTALL) -d $(DESTDIR)$(BINDIR)
	$(INSTALL) -m 755 $(GITHG_F) $(DESTDIR)$(BINDIR)/

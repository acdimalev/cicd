cicd_binaries = archive latest publish
busybody_binaries = busybody busybody-micronap busybody-tasks busybody-watch do-git-automation watch-git watch-ipv6-address


prefix = /usr/local
exec_prefix = $(prefix)
bindir = $(exec_prefix)/bin
libexecdir = $(exec_prefix)/libexec

INSTALL = install
INSTALL_PROGRAM = $(INSTALL)

install: installdirs
	for binary in $(cicd_binaries); do \
	  $(INSTALL_PROGRAM) bin/$$binary $(DESTDIR)$(bindir)/$$binary; \
	done
	for binary in $(busybody_binaries); do \
	  $(INSTALL_PROGRAM) busybody/$$binary \
	    $(DESTDIR)$(libexecdir)/busybody/$$binary; \
	done

uninstall:
	for binary in $(cicd_binaries); do \
	  rm -f $(DESTDIR)$(bindir)/$$binary; \
	done
	for binary in $(busybody_binaries); do \
	  rm -f $(DESTDIR)$(libexecdir)/busybody/$$binary; \
	done

installdirs:
	mkdir -p $(DESTDIR)$(bindir)
	mkdir -p $(DESTDIR)$(libexecdir)/busybody

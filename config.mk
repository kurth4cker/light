PREFIX = /usr/local
BINDIR = $(PREFIX)/bin
DOCDIR = $(PREFIX)/share/doc/light
MANDIR = $(PREFIX)/share/man

CFLAGS = -g -Wall -Wextra
LDFLAGS =
LDLIBS =

CC = cc

VERSION = 1.3.1_git

LIGHT_CFLAGS = \
	-DVERSION=\"$(VERSION)\" \
	-D_GNU_SOURCE \
	-std=gnu99 \
	-Wno-type-limits \
	-Wno-format-truncation \
	-Wno-unused-parameter \
	$(CFLAGS)

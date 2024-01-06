CC = cc

PREFIX = /usr/local
MANDIR = $(PREFIX)/share/man
BINDIR = $(PREFIX)/bin
DOCDIR = $(PREFIX)/share/doc/light

MAN1 = light.1
DOCS = README.md

BIN = light
OBJ = src/main.o \
	src/light.o \
	src/helpers.o \
	src/impl/sysfs.o \
	src/impl/util.o \
	src/impl/razer.o

LIGHT_CFLAGS = \
#	-Isrc \
#	-Isrc/impl \
	-D_GNU_SOURCE \
	-std=gnu99 \
	-Wno-type-limits \
	-Wno-format-truncation \
	-Wno-unused-parameter \
	-fcommon \
	$(CFLAGS)


all: $(BIN)

$(BIN): $(OBJ)
	$(CC) $(LDFLAGS) -o $@ $(OBJ)

clean:
	rm -f $(BIN) $(OBJ)

install: $(BIN) $(MAN1) $(DOCS)
	mkdir -p $(DESTDIR)$(BINDIR) \
		$(DESTDIR)$(MANDIR)/man1 \
		$(DESTDIR)$(DOCDIR)
	cp -f $(BIN) $(DESTDIR)$(BINDIR)
	cp -f $(MAN1) $(DESTDIR)$(MANDIR)/man1
	cp -f $(DOCS) $(DESTDIR)$(DOCDIR)

.SUFFIXES: .c .o
.c.o:
	$(CC) $(CFLAGS) -c $< -o $@

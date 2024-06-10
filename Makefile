.POSIX:
include config.mk

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
	-DVERSION=\"$(VERSION)\" \
	-D_GNU_SOURCE \
	-std=gnu99 \
	-Wno-type-limits \
	-Wno-format-truncation \
	-Wno-unused-parameter \
	-fcommon \
	$(CFLAGS)


all: $(BIN)

$(BIN): $(OBJ)
	$(CC) $(LDFLAGS) -o $@ $(OBJ) $(LDLIBS)

clean:
	rm -f $(BIN) *.o src/*.o src/impl/*.o

install: $(BIN) $(MAN1) $(DOCS)
	mkdir -p $(DESTDIR)$(BINDIR) \
		$(DESTDIR)$(MANDIR)/man1 \
		$(DESTDIR)$(DOCDIR)
	cp -f $(BIN) $(DESTDIR)$(BINDIR)
	cp -f $(MAN1) $(DESTDIR)$(MANDIR)/man1
	cp -f $(DOCS) $(DESTDIR)$(DOCDIR)

uninstall:
	rm -f $(DESTDIR)$(BINDIR)/$(BIN) $(DESTDIR)$(MANDIR)/man1/$(MAN1)
	for i in $(DOCS); do rm -f $(DESTDIR)$(DOCDIR)/$$i; done
	-rmdir $(DESTDIR)$(DOCDIR)

.SUFFIXES: .c .o
.c.o:
	$(CC) $(LIGHT_CFLAGS) -c $< -o $@

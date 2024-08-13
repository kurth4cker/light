.POSIX:
include config.mk

MAN1 = docs/light.1
DOCS = README.md

BIN = light
OBJ = src/main.o \
	src/light.o \
	src/helpers.o \
	src/impl/sysfs.o \
	src/impl/util.o \
	src/impl/razer.o

all: $(BIN)

src/helpers.o: include/helpers.h
src/light.o: include/light.h include/helpers.h include/impl/sysfs.h \
	include/impl/util.h include/impl/razer.h
src/main.o: include/light.h include/helpers.h
src/impl/razer.o: include/impl/razer.h include/light.h include/helpers.h
src/impl/sysfs.o: include/impl/sysfs.h include/light.h include/helpers.h
src/impl/util.o: include/impl/util.h include/light.h include/helpers.h

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

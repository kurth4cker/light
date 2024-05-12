# Light - A program to control backlights (and other hardware lights) in GNU/Linux

*Copyright (C) 2012 - 2018*

*Author: Fredrik Haikarainen*

*Contributor & Maintainer: Joachim Nilsson*

*This is free software, see the source for copying conditions.  There is NO
warranty; not even for MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE*


- [Introduction](#introduction)
- [Examples](#examples)
- [Usage](#usage)
- [Installation](#installation)
  - [Manual](#manual)
  - [Permissions](#permissions)


## Introduction

[Light][] is a program to control backlights and other lights under GNU/Linux:

* Works where other software has proven unreliable (xbacklight etc.)
* Works even in a fully CLI-environment, i.e. it does not rely on X
* Provides functionality to automatically control backlights with the highest
  precision available
* Extra features, like setting a minimum brightness value for controllers, or
  saving/restoring the value for poweroffs/boots.

See the following sections for the detailed descriptions of all available
commands, options and how to access different controllers.

Light is available in many GNU/Linux distributions already.


## Examples

Get the current backlight brightness in percent

    light -G

or

     light

Increase backlight brightness by 5 percent

    light -A 5

Set the minimum cap to 2 in raw value on the sysfs/backlight/acpi_video0
device:

    light -Nrs "sysfs/backlight/acpi_video0" 2

List available devices

    light -L

Activate the Num. Lock keyboard LED, here `sysfs/leds/input3::numlock` is
used, but this varies between different systems:

    light -Srs "sysfs/leds/input3::numlock" 1


## Usage

See manpage: light(1)

## Installation

### Manual

If you download a stable release, these are the commands that will get you up
and running:

    tar xf light-x.yy.tar.gz
    cd light-x.yy/
    ./configure && make
    sudo make install

However the latest development branch requires some extras. Clone the
repository and run the `autogen.sh` script.  This requires that `automake` and
`autoconf` is installed on your system.

    ./autogen.sh
    ./configure && make
    sudo make install

The `configure` script and `Makefile.in` files are not part of GIT because they
are generated at release time with `make release`.


### Permissions

Optionally, instead of the classic SUID root mode of operation, udev rules can
be set up to manage the kernel sysfs permissions.  Use the configure script to
enable this mode of operation:

    ./configure --with-udev && make
    sudo make install

This installs the `90-backlight.rules` into `/usr/lib/udev/rules.d/`.
If your udev rules are located elsewhere, use `--with-udev=PATH`.

**Note:** make sure that your user is part of the `video` group, otherwise you
will not get access to the devices.

**Note:** in this mode `light` runs unpriviliged, so the `/etc/light`
directory (for cached settings) is not used, instead the per-user
specific `~/.config/light` is used.


[Light]:     https://github.com/haikarainen/light/
[light-git]: https://aur.archlinux.org/packages/light-git

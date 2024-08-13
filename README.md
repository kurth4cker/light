# Light - A program to control backlights (and other hardware lights) in GNU/Linux

*This is free software, see the source for copying conditions.  There is NO
warranty; not even for MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE*


- [Introduction](#introduction)
- [Examples](#examples)
- [Usage](#usage)
- [Installation](#installation)
  - [Manual](#manual)
  - [Permissions](#permissions)


## Introduction

Light is a program to control backlights and other lights under GNU/Linux:

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

**light** requires only C toolchain and POSIX compatible make for building and
installation:

    # edit config.mk
    make
    # as root if necessary
    make install

### Permissions

Optionally, instead of the classic SUID root mode of operation, udev rules can
be set up to manage the kernel sysfs permissions. Install
`contrib/90-backlight.rules` to `/usr/lib/udev/rules.d`.

**Note:** make sure that your user is part of the `video` group, otherwise you
will not get access to the devices.

**Note:** in this mode `light` runs unpriviliged, so the `/etc/light`
directory (for cached settings) is not used, instead the per-user
specific `~/.config/light` is used.

## Copying
Licensed under GPL-3.0-or-later.  See file COPYING for details.

#!/usr/bin/bash
#
# CDDL HEADER START
#
# The contents of this file are subject to the terms of the
# Common Development and Distribution License, Version 1.0 only
# (the "License").  You may not use this file except in compliance
# with the License.
#
# You can obtain a copy of the license at usr/src/OPENSOLARIS.LICENSE
# or http://www.opensolaris.org/os/licensing.
# See the License for the specific language governing permissions
# and limitations under the License.
#
# When distributing Covered Code, include this CDDL HEADER in each
# file and include the License file at usr/src/OPENSOLARIS.LICENSE.
# If applicable, add the following below this CDDL HEADER, with the
# fields enclosed by brackets "[]" replaced with your own identifying
# information: Portions Copyright [yyyy] [name of copyright owner]
#
# CDDL HEADER END
#
#
# Copyright 1995-2013 OETIKER+PARTNER AG  All rights reserved.
# Use is subject to license terms.
#
# Load support functions
. ../../lib/functions.sh

PROG=pixman     # App name
VER=0.30.2      # App version
VERHUMAN=$VER   # Human-readable version
#PVER=          # Branch (set in config.sh, override here if needed)
PKG=library/pixman  # Package name (e.g. library/foo)
SUMMARY="Pixman is a low-level software library for pixel manipulation"      # One-liner, must be filled in
DESC="Pixman is a low-level software library for pixel manipulation, providing features such as image compositing and trapezoid rasterization."         # Longer description, must be filled in
DOWNLOADURL=http://cairographics.org/releases/pixman-0.30.2.tar.gz
BUILDARCH=both    # or 64 or both ... for libraries we want both for tools 32 bit only

BUILD_DEPENDS_IPS=
RUN_DEPENDS_IPS=

init
download_source $PROG $PROG $VER
patch_source
prep_build
build
make_isa_stub
make_package
clean_up

# Vim hints
# vim:ts=4:sw=4:et:

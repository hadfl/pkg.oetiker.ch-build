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

PROG=zfstimemachine # App name
VER=20131223    # App version
VERHUMAN=$VER   # Human-readable version
#PVER=          # Branch (set in config.sh, override here if needed)
PKG=system/zfstimemachine # Package name (e.g. library/foo)
SUMMARY="A snapshot based backup script"      # One-liner, must be filled in
DESC="Take snapshots and transfer them to a second pool, potentially on a different box"         # Longer description, must be filled in
BUILDARCH=32    # or 64 or both ... for libraries we want both for tools 32 bit only
BUILDDIR=$PROG
BUILD_DEPENDS_IPS=
RUN_DEPENDS_IPS=

init
pushd $TMPDIR
[ -d $PROG ] && rm -rf $PROG
mkdir $PROG
cd $PROG
wget http://search.cpan.org/CPAN/authors/id/G/GB/GBARR/TimeDate-2.30.tar.gz
tar zxvf TimeDate-2.30.tar.gz 
git clone https://github.com/oetiker/ZFS-TimeMachine.git
prep_build
pushd $TMPDIR/$PROG
CWROOT=$DESTDIR/opt/oep/share/$PROG
mkdir -p $CWROOT
mv TimeDate-2.30/lib $CWROOT
cp -rp ZFS-TimeMachine/JNX $CWROOT/lib
mkdir $CWROOT/bin
cp ZFS-TimeMachine/*.perl $CWROOT/bin
make_package
clean_up

# Vim hints
# vim:ts=4:sw=4:et:

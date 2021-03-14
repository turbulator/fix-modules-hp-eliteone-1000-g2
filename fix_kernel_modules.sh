#!/bin/bash

set -e

tagname=`uname -r | awk -F "." '{print "kernel-" $1 "." $2 "." $3 "." $4}'`
localversion=`uname -r | awk -F "-" '{print $2}'`

git clone git://git.kernel.org/pub/scm/linux/kernel/git/jwboyer/fedora.git kernel
cd kernel
git checkout tags/$tagname
cp /boot/config-`uname -r` .config
touch .scmversion
sed -i "s|CONFIG_LOCALVERSION=.*|CONFIG_LOCALVERSION=\"-$localversion\"|" .config
patch -p1 < ../speakers.patch
make clean
make modules_prepare
make M=sound/pci/hda modules

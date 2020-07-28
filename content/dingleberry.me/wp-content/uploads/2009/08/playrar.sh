#!/bin/bash
RARFILE=$1
TMPDIR="/tmp/playrar/"
RARFS="/usr/local/bin/rarfs"
if [ ! -d /tmp/playrar ]; then
mkdir -p /tmp/playrar
fi
$RARFS $RARFILE $TMPDIR
mplayer -fs $TMPDIR/`ls $TMPDIR`
fusermount -u $TMPDIR

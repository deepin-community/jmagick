#!/bin/sh -e

# called by uscan with '--upstream-version' <version> <file>
SVNROOT=svn://svn.code.sf.net/p/jmagick/code

VERSION=$2
REVISION=$(svn info $SVNROOT/branches/$VERSION | sed -rne 's,^Revision: (.*),\1,p')
TIMESTAMP=$(svn info --xml $SVNROOT/branches/$VERSION | sed -rne 's,^<date>([0-9]{4})-([0-9]{2})-([0-9]{2}).*</date>,\1\2\3,p')

TAR=../jmagick_$VERSION~$TIMESTAMP-svn$REVISION.orig.tar.xz
DIR=jmagick-$VERSION~svn$REVISION

# fetch and clean up the source code
svn export $SVNROOT/branches/$VERSION/ $DIR
chmod -x $DIR/test/magicktest/exif_orientation/*.jpg
XZ_OPT=--best tar cJf $TAR -X debian/orig-tar.exclude $DIR
rm -rf $DIR $3

# move to directory 'tarballs'
if [ -r .svn/deb-layout ]; then
    . .svn/deb-layout
    mv $3 $origDir
    echo "moved $3 to $origDir"
fi

exit 0

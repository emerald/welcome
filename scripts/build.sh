#!/bin/sh

[ ! `which csh` ] && echo "csh not installed" && exit 1
[ ! `which cc` ] && echo "C compiler (cc) not installed" && exit 1

[ ! $EMERALDROOT ] && echo "EMERALDROOT undefined" && exit 1
[ ! $EMERALDARCH ] && echo "EMERALDARCH undefined" && exit 1

LIBARCHPATH="$EMERALDROOT/lib/$EMERALDARCH"
BINARCHPATH="$EMERALDROOT/bin/$EMERALDARCH"


[ ! -d $LIBARCHPATH ] && echo "Directory for $EMERALDARCH missing under lib/" && exit 1
[ ! -f "$LIBARCHPATH/macroMf" ] && echo "macroMf file for $EMERALDARCH missing in lib/$EMERALDARCH" && exit 1
[ ! -d $BINARCHPATH ] && echo "Directory for $EMERALDARCH missing under bin/" && exit 1

cd $EMERALDROOT/vm

[ ! -d "$EMERALDARCH" ] && mkdir "$EMERALDARCH"
cp src/Makefile "$EMERALDARCH/Makefile"
cd "$EMERALDARCH"
emmake links

cd "$EMERALDROOT"/ccalls
emmake install

cd "$EMERALDROOT/vm/$EMERALDARCH"
emmake

cd "$EMERALDROOT/bin/$EMERALDARCH"
ln -s "../../vm/$EMERALDARCH/emx" emx

newcompiler

exit 0
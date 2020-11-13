#!/bin/sh
cd $EMERALDROOT/vm/$EMERALDARCH
emmake links
cd $EMERALDROOT/ccalls
emmake install
cd $EMERALDROOT/vm/$EMERALDARCH
emmake
cd $EMERALDROOT/EC
newcompiler

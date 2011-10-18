#!/bin/sh
rm -rf installed_parrot
if ["$CC" -eq ""]; then
    CC=cc
fi

ccache --version

if [ $? -eq 0 ]; then
    CC="ccache $CC"
fi

rm -rf "$PWD/installed_parrot"

make realclean
perl Configure.pl \
--cc="$CC"    \
--ccflags=-g  \
--prefix="$PWD/installed_parrot" && \
make -j $TEST_JOBS    || exit 125 # this skips broken builds
parrot t/library/pg.t || exit 1 # does the test case passes ?


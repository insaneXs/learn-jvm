#! /bin/sh

export ALT_BOOTDIR="/home/xieshang/jdk1.7.0_80"
export ALT_JDK_IMPORT_PATH="/home/xieshang/jdk1.7.0_80"

export ANT_HOME="/usr/share/ant"

# PATH=$JAVA_HOME/bin:$ANT_HOME/bin:$PATH
# export PATH

HOTSPOT_BUILD_JOBS=5
export HOTSPOT_BUILD_JOBS

export ALT_OUTPUTDIR="./build/hotspot_debug"

sudo bash ./configure --with-target-bits=64 --with-boot-jdk=/home/xieshang/jdk1.7.0_80/ --with-debug-level=slowdebug --enable-debug-symbols ZIP_DEBUGINFO_FILES=0

sudo DEBUG_BINARIES=true make all DISABLE_HOTSPOT_OS_VERSION_CHECK=OK ZIP_DEBUGINFO_FILES=0 2>&1 | tee $ALT_OUTPUTDIR/hotspot_debug.log

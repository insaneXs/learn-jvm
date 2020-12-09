#!/bin/bash
export LANG=C
export ALT_BOOTDIR=/home/xieshang/jdk1.7.0_80/
export ALT_JDK_IMPORT_PATH=/home/xieshang/jdk1.7.0_80/
export ALLOW_DOWNLOADS=true


export HOTSPOT_BUILD_JOBS=4
export ALT_PARALLEL_COMPILE_JOBS=4

export SKIP_COMPARE_IMAGES=true


export USE_PRECOMPILED_HEADER=true


export BUILD_LANGTOOLS=true 
export BUILD_JAXP=true
export BUILD_JAXWS=true 
export BUILD_CORBA=true
export BUILD_HOTSPOT=true 
export BUILD_JDK=true

export DISABLE_HOTSPOT_OS_VERSION_CHECK=ok


#export SKIP_DEBUG_BUILD=false
#export SKIP_FASTDEBUG_BUILD=true
#export DEBUG_NAME=debug


BUILD_DEPLOY=false


BUILD_INSTALL=false


export ALT_OUTPUTDIR=../build/


unset JAVA_HOME
unset CLASSPATH
echo "pre make"
# make clean
# make dist-clean
echo "start make"

bash ./configure --with-target-bits=64 --with-debug-level=slowdebug --with-boot-jdk=/home/xieshang/jdk1.7.0_80/

#make sanity

make all ZIP_DEBUGINFO_FILES=0   2>&1 -d | tee build.log

##cd test && make PRODUCT_HOME=`pwd`/../build/*/images/j2sdk-image all

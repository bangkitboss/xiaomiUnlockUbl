#!/bin/bash
if [ "$EUID" -ne 0 ] 
 then 
	echo "Please run as root (sudo ./MiUnlockTool.sh)"
	echo "Sudo is required for fastboot"
  exit 1
fi
warn () {
    echo "$*"
}

die () {
    echo
    echo "$*"
    echo
    exit 1
}
if [ -n "$JAVA_HOME" ] ; then
    if [ -x "$JAVA_HOME/jre/sh/java" ] ; then
        JAVACMD="$JAVA_HOME/jre/sh/java"
    else
        JAVACMD="$JAVA_HOME/bin/java"
    fi
    if [ ! -x "$JAVACMD" ] ; then
        die "ERROR: JAVA_HOME is set to an invalid directory: $JAVA_HOME

Please set the JAVA_HOME variable in your environment to match the
location of your Java installation."
    fi
else
    JAVACMD="java"
    which java >/dev/null 2>&1 || die "ERROR: JAVA_HOME is not set and no 'java' command could be found in your PATH.

Please set the JAVA_HOME variable in your environment to match the
location of your Java installation."
fi

exec "$JAVACMD" -jar bin/MiUnlockTool.jar "$@"
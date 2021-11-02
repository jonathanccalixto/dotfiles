#!/bin/sh

# JAVA_LIB_DIR=$HOME/programs/java/lib
# JAVA_SDK_DIR=$HOME/programs/java/sdks
# JAVA_LANG_DIR=$HOME/programs/java/languages
# JAVA_PROG_DIR=$HOME/programs/java/programs
# JAVA_SERVERS_DIR=$HOME/programs/java/servers

if [[ $MY_SO = 'MacOS' ]]; then
  export JAVA_HOME=$(/usr/libexec/java_home)
elif [[ $MY_SO = 'Linux' ]]; then
  export JAVA_HOME=/usr/lib/jvm/java-8-openjdk-amd64
fi
export ANDROID_HOME=$HOME/Android/Sdk

# export ANT_HOME=$JAVA_PROG_DIR/ant
# export MVN_HOME=$JAVA_PROG_DIR/maven
# export AWS_IAM_HOME=$JAVA_PROG_DIR/IAMCli
# export GRADLE_HOME=$JAVA_PROG_DIR/gradle
# export GRADLE_HOME=$JAVA_PROG_DIR/gradle

# export ROO_HOME=$JAVA_PROG_DIR/spring-roo
# export SCALA_HOME=$JAVA_LANG_DIR/scala
# export GROOVY_HOME=$JAVA_LANG_DIR/groovy
# export GRAILS_HOME=$JAVA_PROG_DIR/grails
# # export TOMCAT_HOME=$JAVA_SERVERS_DIR/tomcat

export PATH=$PATH:$JAVA_HOME/bin

# export PATH=$PATH:$ANT_HOME/bin
# export PATH=$PATH:$MVN_HOME/bin
# export PATH=$PATH:$AWS_IAM_HOME/bin
# export PATH=$PATH:$GRADLE_HOME/bin

# export PATH=$PATH:$SCALA_HOME/bin
# export PATH=$PATH:$GROOVY_HOME/bin
# export PATH=$PATH:$GRAILS_HOME/bin
# export PATH=$PATH:$ROO_HOME/bin

export PATH=$PATH:$ANDROID_HOME/emulator
export PATH=$PATH:$ANDROID_HOME/tools
export PATH=$PATH:$ANDROID_HOME/tools/bin
export PATH=$PATH:$ANDROID_HOME/platform-tools

if [ -d $HOME/Android/studio/bin ]; then
  export PATH=$PATH:$HOME/Android/studio/bin
fi
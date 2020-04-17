#!/bin/sh

# JAVA_LIB_DIR=$HOME/programs/java/lib
# JAVA_SDK_DIR=$HOME/programs/java/sdks
# JAVA_LANG_DIR=$HOME/programs/java/languages
# JAVA_PROG_DIR=$HOME/programs/java/programs
# JAVA_SERVERS_DIR=$HOME/programs/java/servers

export JAVA_HOME=/usr/lib/jvm/java-8-openjdk-amd64
export PATH=$PATH:$JAVA_HOME/bin
# export ANT_HOME=$JAVA_PROG_DIR/ant
# export MVN_HOME=$JAVA_PROG_DIR/maven
# export AWS_IAM_HOME=$JAVA_PROG_DIR/IAMCli
# export GRADLE_HOME=$JAVA_PROG_DIR/gradle

# export ROO_HOME=$JAVA_PROG_DIR/spring-roo
# export SCALA_HOME=$JAVA_LANG_DIR/scala
# export GROOVY_HOME=$JAVA_LANG_DIR/groovy
# export GRAILS_HOME=$JAVA_PROG_DIR/grails
# # export TOMCAT_HOME=$JAVA_SERVERS_DIR/tomcat

# export PATH=$ANT_HOME/bin:$PATH
# export PATH=$MVN_HOME/bin:$PATH
# export PATH=$AWS_IAM_HOME/bin:$PATH
# export PATH=$GRADLE_HOME/bin:$PATH

# export PATH=$SCALA_HOME/bin:$PATH
# export PATH=$GROOVY_HOME/bin:$PATH
# export PATH=$GRAILS_HOME/bin:$PATH
# export PATH=$ROO_HOME/bin:$PATH

export ANDROID_HOME=$HOME/Android/Sdk
export PATH=$PATH:$ANDROID_HOME/tools
export PATH=$PATH:$ANDROID_HOME/platform-tools

if [ -d $HOME/Android/studio/bin ]; then
  export PATH=$PATH:$HOME/Android/studio/bin
fi
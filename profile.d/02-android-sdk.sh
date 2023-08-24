export ANDROID_HOME=$HOME/Android/Sdk

export PATH=$PATH:$ANDROID_HOME/emulator
export PATH=$PATH:$ANDROID_HOME/tools
export PATH=$PATH:$ANDROID_HOME/tools/bin
export PATH=$PATH:$ANDROID_HOME/platform-tools

SDK_30="$ANDROID_HOME/build-tools/30.0.3"
SDK_31="$ANDROID_HOME/build-tools/31.0.0"
SDK_32="$ANDROID_HOME/build-tools/32.0.0"
SDK_33="$ANDROID_HOME/build-tools/33.0.2"
SDK_34="$ANDROID_HOME/build-tools/34.0.0"

# Defines my executables
[ -d $SDK_30 ] && export PATH="$SDK_30:$PATH"
[ -d $SDK_31 ] && export PATH="$SDK_31:$PATH"
[ -d $SDK_32 ] && export PATH="$SDK_32:$PATH"
[ -d $SDK_33 ] && export PATH="$SDK_33:$PATH"
[ -d $SDK_34 ] && export PATH="$SDK_34:$PATH"

export ANDROID_HOME=$HOME/Android/Sdk

export PATH=$PATH:$ANDROID_HOME/emulator
export PATH=$PATH:$ANDROID_HOME/tools
export PATH=$PATH:$ANDROID_HOME/tools/bin
export PATH=$PATH:$ANDROID_HOME/platform-tools

SDK_34="$ANDROID_HOME/build-tools/34.0.0"
SDK_35="$ANDROID_HOME/build-tools/35.0.1"

# Defines my executables
[ -d $SDK_35 ] && export PATH="$SDK_35:$PATH"

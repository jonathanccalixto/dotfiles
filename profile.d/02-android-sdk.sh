ANDROID_SDK=$HOME/Android/Sdk
SDK_28="$ANDROID_SDK/build-tools/28.0.3"
SDK_29="$ANDROID_SDK/build-tools/29.0.3"
SDK_30="$ANDROID_SDK/build-tools/30.0.2"
SDK_31="$ANDROID_SDK/build-tools/31.0.0"

# Defines my executables
[ -d $SDK_28 ] && export PATH="$SDK_28:$PATH"
[ -d $SDK_29 ] && export PATH="$SDK_29:$PATH"
[ -d $SDK_30 ] && export PATH="$SDK_30:$PATH"
[ -d $SDK_31 ] && export PATH="$SDK_30:$PATH"
#!/bin/bash

export ANDROID_SDK_HOME="/Users/$USERNAME/Library/Android/sdk"
export ANDROID_PATH="$ANDROID_SDK_HOME/build-tools:$ANDROID_SDK_HOME/emulator:$ANDROID_SDK_HOME/platform-tools:$ANDROID_SDK_HOME/tools:$ANDROID_SDK_HOME/tools/bin"
export PATH="$ANDROID_PATH:$PATH"


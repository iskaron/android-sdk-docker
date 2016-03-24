#!/bin/bash

SDK_PATH="$1"

expect -c "
set timeout -1;
spawn $SDK_PATH/tools/android update sdk -a -u --filter platform-tools,tools,build-tools-21,build-tools-21.0.1,build-tools-21.0.2,build-tools-21.1,build-tools-21.1.1,build-tools-21.1.2,build-tools-22,build-tools-22.0.1,build-tools-23.0.2,android-21,android-22,android-23,addon-google_apis_x86-google-21,extra-android-support,extra-android-m2repository,extra-google-m2repository,extra-google-google_play_services,sys-img-armeabi-v7a-android-21,android-17
expect {
    \"Do you accept the license\" { exp_send \"y\r\"; exp_continue }
	    eof
	}
	"


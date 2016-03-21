#!/bin/bash

SDK_PATH="$1"

expect -c "
set timeout -1;
spawn $SDK_PATH/tools/android update sdk -a -u --filter 1,6,28,31,154
expect {
    \"Do you accept the license\" { exp_send \"y\r\"; exp_continue }
	    eof
	}
	"

cat > tools/templates/gradle/wrapper/gradle/gradle-wrapper.properties <<EOF
#Wed Apr 10 15:27:10 PDT 2013
distributionBase=GRADLE_USER_HOME
distributionPath=wrapper/dists
zipStoreBase=GRADLE_USER_HOME
zipStorePath=wrapper/dists
distributionUrl=https\://services.gradle.org/distributions/gradle-2.2.1-all.zip
EOF



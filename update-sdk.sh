#!/bin/bash

SDK_PATH="$1"

expect -c "
set timeout -1;
spawn $SDK_PATH/tools/android update sdk -a -u --filter 1,6,28,31,153,154
expect {
    \"Do you accept the license\" { exp_send \"y\r\"; exp_continue }
	    eof
	}
	"


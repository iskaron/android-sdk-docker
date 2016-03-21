FROM iskaron/java
MAINTAINER Oliver Meyer <olm@cativa.net>

env ANDROID_HOME /opt/android-sdk-linux

RUN mkdir -p $ANDROID_HOME
env PATH $ANDROID_HOME/tools:$ANDROID_HOME/platform-tools:$PATH
WORKDIR $ANDROID_HOME

RUN apt-get update && apt-get install -y expect && rm -rf /var/lib/apt/lists/*

env SDK_VER r24.4.1

ADD http://dl.google.com/android/android-sdk_$SDK_VER-linux.tgz /tmp/
COPY update-sdk.sh $ANDROID_HOME

RUN \
	tar -xf /tmp/android-sdk_$SDK_VER-linux.tgz -C /opt/ && \
	rm -f /tmp/android-sdk_$SDK_VER-linux.tgz && \
	./update-sdk.sh . && \
	tools/templates/gradle/wrapper/gradlew

# last line to download gradle

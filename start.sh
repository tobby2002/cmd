#!/bin/bash

APP_NAME="Webchat-mysql"
APP_HOME="/data/chatbot/v200/webchat"


JAVA_HOME="/usr"

EXE_PATH=$(ls $APP_HOME/*.jar -t | head -1)
APP_CLASSPATH=$APP_CLASSPATH:$EXE_PATH


echo "${APP_NAME} Starting ..."
echo "nohup ${JAVA_HOME}/bin/java \
 -XX:+UseG1GC -Xms1g -Xmx1g \
 -cp ${APP_CLASSPATH} \
 -Dloader.main=com.samsungsds.webchat.WebChatApplication \
 org.springframework.boot.loader.PropertiesLauncher 1>/dev/null 2>&1 &"


nohup ${JAVA_HOME}/bin/java \
 -XX:+UseG1GC -Xms512m -Xmx512m \
 -cp ${APP_CLASSPATH} \
 -Dloader.main=com.samsungsds.webchat.WebChatApplication \
 org.springframework.boot.loader.PropertiesLauncher 1>/dev/null 2>&1 &
echo "${APP_NAME} Started."


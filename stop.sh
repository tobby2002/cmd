#!/bin/bash

APP_NAME="WebChat-mysql"
APP_HOME="/data/chatbot/v200/webchat"


ORG_FILE=$(ls ${APP_HOME}/*.jar -t | head -1 | xargs -n 1 basename)
PID=$(ps -ef | grep ${APP_HOME}/${ORG_FILE} | grep java | awk '{print $2}')


echo "PID: [${PID}]"

if [ -z ${PID} ]; then
  echo "${APP_NAME} is not running!"
  exit
fi

echo "${APP_NAME} stoping ..."
echo "kill -9 ${PID}"
kill -9 ${PID}

#!/usr/bin/env bash

unity::_new() {
  echo '# unity'
  echo 'UNITY_PROJECT_PATH=.
UNITY=/Applications/Unity/Hub/Editor/2019.4.19f1/Unity.app/Contents/MacOS/Unity
# Potentially sensitive data. Do not commit.
UNITY_SERIAL="AB-1234-5678-1234-5678"
UNITY_USER="user"
UNITY_PASSWORD="password"'
}

unity::batchmode() {
  "${UNITY}" \
    -projectPath "${UNITY_PROJECT_PATH}" \
    -batchmode \
    -nographics \
    -logfile \
    -serial "${UNITY_SERIAL}" -username "$UNITY_USER" -password "${UNITY_PASSWORD}" \
    -quit "$@"
}

unity::execute_method() {
  unity::batchmode -executeMethod "$@"
}

unity::sync_solution() {
  unity::execute_method UnityEditor.SyncVS.SyncSolution "$@"
}

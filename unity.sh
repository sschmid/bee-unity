#!/usr/bin/env bash

unity::_new() {
  echo '# unity'
  echo 'UNITY_PROJECT_PATH=.
UNITY=/Applications/Unity/Hub/Editor/2019.4.19f1/Unity.app/Contents/MacOS/Unity
# secrets:
unity.serial
unity.user
unity.password'
}

unity::batchmode() {
  local serial user password
  serial="$(bee::secrets unity.serial)"
  user="$(bee::secrets unity.user)"
  password="$(bee::secrets unity.password)"
  "${UNITY}" \
    -projectPath "${UNITY_PROJECT_PATH}" \
    -batchmode \
    -nographics \
    -logfile \
    -serial "${serial}" -username "${user}" -password "${password}" \
    -quit "$@"
}

unity::execute_method() {
  unity::batchmode -executeMethod "$@"
}

unity::sync_solution() {
  unity::execute_method UnityEditor.SyncVS.SyncSolution "$@"
}

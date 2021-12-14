: "${UNITY_PROJECT_PATH:=.}"

unity::help() {
  cat << 'EOF'
Useful commands for Unity development - https://github.com/sschmid/bee-unity

template:

  UNITY_PROJECT_PATH=. # default
  UNITY="/Applications/Unity/Hub/Editor/2021.2.7f1/Unity.app/Contents/MacOS/Unity"

secrets:

  UNITY_SERIAL
  UNITY_USER
  UNITY_PASSWORD

usage:

  batchmode [<batchmode-arguments>]        open Unity in batchmode and quit
  execute_method [<batchmode-arguments>]   open Unity in batchmode, execute the specified method and quit
                                           e.g. bee unity execute_method Build
  sync_solution [<batchmode-arguments>]    open Unity in batchmode, sync C# project and quit

bee dependencies:

  none

dependencies:

  Unity   https://unity3d.com

EOF
}

unity::batchmode() {
  "${UNITY}" \
    -projectPath "${UNITY_PROJECT_PATH}" \
    -batchmode \
    -nographics \
    -logfile \
    -serial "${UNITY_SERIAL}" -username "${UNITY_USER}" -password "${UNITY_PASSWORD}" \
    -quit "$@"
}

unity::execute_method() {
  unity::batchmode -executeMethod "$@"
}

unity::sync_solution() {
  unity::execute_method UnityEditor.SyncVS.SyncSolution "$@"
}

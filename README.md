# unity
Useful functions for Unity development

https://github.com/sschmid/bee-unity

```
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

requirements:

  Unity   https://unity3d.com
```

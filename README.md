## init

`vendor/GLFW` need init

```bash
git submodule init
git submodule update
```

## Tools

### premake5

`.vscode/tasks.json`

```json
...
{
  "label": "premake",
  "type": "shell",
  "command": "premake5", // premake5 path or global command
...
```


### Windows

`cl.exe` and `msbuild.exe` are required

`cl.exe` path
Path\to\MicrosoftVisualStudio\2022\Community\VC\Tools\MSVC\14.36.32532\bin\Hostx64\x64

`msbuild.exe` path
Path\to\MicrosoftVisualStudio\2022\Community\MSBuild\Current\Bin

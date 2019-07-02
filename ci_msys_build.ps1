$MsysRoot = $args[0]

$bash = "$MsysRoot\usr\bin\bash.exe"
$project_root = "/" + (Get-Item -Path ".\").FullName.Replace(":\", "/").Replace("\", "/")

set MSYSTEM=MINGW64

& $bash -lc "cd $project_root && ./build.sh"
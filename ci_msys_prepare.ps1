$MsysRoot = $args[0]

$bash = "$MsysRoot\usr\bin\bash.exe"
$pacman = "$MsysRoot\usr\bin\pacman.exe"

set MSYSTEM=MINGW64

& $pacman --noconfirm -Syyu

& $pacman --needed --noconfirm -S git python2
& $pacman --needed --noconfirm -S mingw-w64-x86_64-toolchain base-devel
& $pacman --needed --noconfirm -S mingw-w64-x86_64-glib2 mingw-w64-x86_64-gtk3
& $pacman --needed --noconfirm -S mingw-w64-x86_64-vulkan mingw-w64-x86_64-SDL2
& $pacman --needed --noconfirm -S mingw-w64-x86_64-glslang mingw-w64-x86_64-libzip
& $pacman --needed --noconfirm -S mingw-w64-x86_64-libusb openssl-devel

& $bash -lc 'if [ -f /usr/bin/python ]; then mv /usr/bin/python /usr/bin/python.bak; fi; ln -s /usr/bin/python2 /usr/bin/python'
& $bash -lc 'mv /mingw64/bin/envsubst.exe /mingw64/bin/envsubst.exe.bak; ln -s /usr/bin/envsubst.exe /mingw64/bin/envsubst.exe'
& $bash -lc 'echo ''export PATH=/mingw64/bin:$PATH'' >> ~/.bash_profile'
& $bash -lc 'echo ''CPPFLAGS=-I/mingw64/include'' >> ~/.bash_profile'
& $bash -lc 'echo ''LDFLAGS=-L/mingw64/lib'' >> ~/.bash_profile'
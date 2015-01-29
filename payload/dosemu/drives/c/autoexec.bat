@echo off
path z:\bin;z:\gnu;z:\dosemu
set HELPPATH=z:\help
set TEMP=c:\tmp
prompt $P$G
unix -s DOSDRIVE_D
lredir del d: > nul
lredir d: linux\fs\home\x84\bbs\dos
path %PATH%;d:\dosutils
unix -s DOSEMU_VERSION
echo.
echo Welcome to dosemu %DOSEMU_VERSION%!
echo.
unix -e

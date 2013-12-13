@echo off

call "C:\Program Files\Microsoft Visual Studio 10.0\VC\vcvarsall.bat"

rem assumes OpenSSL at ../../openssl-1.0.0a
rem assumes zlib at ./../zlib-1.2.5 and built with static runtime libraries (/MT)

echo "Add '#define HAVE_LDAP_SSL 1' to lib\config-win32.h"
"C:\Program Files\notepad2\notepad2.exe" lib\config-win32.h

call buildconf.bat

cd lib
nmake -f Makefile.vc9 clean
nmake -f Makefile.vc9 OPENSSL_PATH=D:\project\curl\openssl-1.0.1e ZLIB_PATH=D:\project\curl\zlib-1.2.8    RTLIBCFG=static CFG=release-ssl-zlib

cd ..
cd src
nmake -f Makefile.vc9 clean
nmake -f Makefile.vc9 OPENSSL_PATH=D:\project\curl\openssl-1.0.1e ZLIB_PATH=D:\project\curl\zlib-1.2.8 RTLIBCFG=static CFG=release-ssl-zlib

pause
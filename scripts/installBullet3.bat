::
cd ..

::
rmdir /s /q install

::
mkdir install

::
cd build

:: install Sentry
Set CMAKE_LOCAL_ONLY= -DCMAKE_INSTALL_LOCAL_ONLY=TRUE
Set CMAKE_INSTALL_DEBUG_PATH= -DCMAKE_INSTALL_PREFIX="..\install\bullet3\x64\Debug"
Set CMAKE_INSTALL_RELEASE_PATH= -DCMAKE_INSTALL_PREFIX="..\install\bullet3\x64\Release"
Set CMAKE_INSTALL= -P cmake_install.cmake
Set CMAKE_INSTALL_DEBUG= -DBUILD_TYPE=Debug
Set CMAKE_INSTALL_RELEASE= -DBUILD_TYPE=Release
cmake %CMAKE_LOCAL_ONLY% %CMAKE_INSTALL_DEBUG% %CMAKE_INSTALL_DEBUG_PATH% %CMAKE_INSTALL%
cmake %CMAKE_LOCAL_ONLY% %CMAKE_INSTALL_RELEASE% %CMAKE_INSTALL_RELEASE_PATH% %CMAKE_INSTALL%

cd ..

:: copy library files
xcopy "./build/lib/release" "./install/bullet3/x64/Release/lib" /s /y /i
xcopy "./build/lib/debug" "./install/bullet3/x64/Debug/lib" /s /y /i

:: copy header files
xcopy "./src" "./install/bullet3/x64/Release/include" /s /y /i
xcopy "./src" "./install/bullet3/x64/Debug/include" /s /y /i

cd install

:: delete files
del /s /q *.cpp
del /s /q *.txt
del /s /q *.lua
del /s /q *.c

:: move back
cd ..

:: move to another directory
cd scripts

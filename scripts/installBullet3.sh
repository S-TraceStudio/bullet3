# move back one folder
cd ..

# remove install folder
rm -r install

# create dir
mkdir install

# go to build dir
cd build

# install bullet3
CMAKE_LOCAL_ONLY='-DCMAKE_INSTALL_LOCAL_ONLY=TRUE'
CMAKE_INSTALL_DEBUG_PATH='-DCMAKE_INSTALL_PREFIX=../install/bullet3/OSX/Debug'
CMAKE_INSTALL_RELEASE_PATH='-DCMAKE_INSTALL_PREFIX=../install/bullet3/OSX/Release'
CMAKE_INSTALL='-P cmake_install.cmake'
CMAKE_INSTALL_DEBUG='-DBUILD_TYPE=Debug'
CMAKE_INSTALL_RELEASE='-DBUILD_TYPE=Release'
cmake $CMAKE_LOCAL_ONLY $CMAKE_INSTALL_DEBUG $CMAKE_INSTALL_DEBUG_PATH $CMAKE_INSTALL
cmake $CMAKE_LOCAL_ONLY $CMAKE_INSTALL_RELEASE $CMAKE_INSTALL_RELEASE_PATH $CMAKE_INSTALL

# move back
cd ..

# create include dir
cd install
cd bullet3
cd OSX
cd Debug
mkdir include
cd ..
cd Release
mkdir include
cd ..
cd ..
cd ..
cd ..

# copy libraries
# Release
cp -a build/src/Bullet3Collision/Release/*.a install/bullet3/OSX/Release/lib
cp -a build/src/Bullet3Common/Release/*.a install/bullet3/OSX/Release/lib
cp -a build/src/Bullet3Dynamics/Release/*.a install/bullet3/OSX/Release/lib
cp -a build/src/Bullet3Geometry/Release/*.a install/bullet3/OSX/Release/lib
cp -a build/src/Bullet3OpenCL/Release/*.a install/bullet3/OSX/Release/lib
cp -a build/src/BulletCollision/Release/*.a install/bullet3/OSX/Release/lib
cp -a build/src/BulletDynamics/Release/*.a install/bullet3/OSX/Release/lib
cp -a build/src/BulletInverseDynamics/Release/*.a install/bullet3/OSX/Release/lib
cp -a build/src/BulletSoftBody/Release/*.a install/bullet3/OSX/Release/lib
cp -a build/src/LinearMath/Release/*.a install/bullet3/OSX/Release/lib

# Debug
cp -a build/src/Bullet3Collision/Debug/*.a install/bullet3/OSX/Debug/lib
cp -a build/src/Bullet3Common/Debug/*.a install/bullet3/OSX/Debug/lib
cp -a build/src/Bullet3Dynamics/Debug/*.a install/bullet3/OSX/Debug/lib
cp -a build/src/Bullet3Geometry/Debug/*.a install/bullet3/OSX/Debug/lib
cp -a build/src/Bullet3OpenCL/Debug/*.a install/bullet3/OSX/Debug/lib
cp -a build/src/BulletCollision/Debug/*.a install/bullet3/OSX/Debug/lib
cp -a build/src/BulletDynamics/Debug/*.a install/bullet3/OSX/Debug/lib
cp -a build/src/BulletInverseDynamics/Debug/*.a install/bullet3/OSX/Debug/lib
cp -a build/src/BulletSoftBody/Debug/*.a install/bullet3/OSX/Debug/lib
cp -a build/src/LinearMath/Debug/*.a install/bullet3/OSX/Debug/lib

#include files
cp -a src/. install/bullet3/OSX/Release/include
cp -a src/. install/bullet3/OSX/Debug/include

# delete useless files
# deleting useless files
pwd
cd install
pwd 

find . -name '*.cpp' -type f -delete
find . -name '*.c' -type f -delete
find . -name '*.txt' -type f -delete
find . -name '*.lua' -type f -delete
find . -name '*.cl' -type f -delete

# move to previous directory
cd ..
cd scripts


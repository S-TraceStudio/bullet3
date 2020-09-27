# Build bullet3
cd ..

# remove any previous build/install dir and create a new one
rm -rf build
mkdir build
rm -rf install
mkdir install

# move inside build dir
cd build

# generate project files
CMAKE_GEN='-G Xcode'
CMAKE_CONFIGURATION_TYPE='-DCMAKE_CONFIGURATION_TYPES=Release;Debug'
CMAKE_BULLET2_DEMO='-DBUILD_BULLET2_DEMOS=FALSE'
CMAKE_CPU_DEMO='-DBUILD_CPU_DEMOS=FALSE'
CMAKE_OPENGL3_DEMO='-DBUILD_OPENGL3_DEMOS=FALSE'
CMAKE_USE_GLUT='-DUSE_GLUT=FALSE'
CMAKE_USE_GRAPHICAL_BENCHMARK='-DUSE_GRAPHICAL_BENCHMARK=FALSE'
CMAKE_ENET='-DBUILD_ENET=FALSE'
CMAKE_CLSOCKET='-DBUILD_CLSOCKET=FALSE'
CMAKE_EXTRAS='-DBUILD_EXTRAS=FALSE'
cmake $CMAKE_GEN $CMAKE_BULLET2_DEMO $CMAKE_EXTRAS $CMAKE_CLSOCKET $CMAKE_ENET $CMAKE_CPU_DEMO $CMAKE_OPENGL3_DEMO $CMAKE_USE_GLUT $CMAKE_USE_GRAPHICAL_BENCHMARK $CMAKE_CONFIGURATION_TYPE ..

# build debug and release
xcodebuild -project "BULLET_PHYSICS.xcodeproj" -configuration Release 
xcodebuild -project "BULLET_PHYSICS.xcodeproj" -configuration Debug 

# go back to previous folder
cd ..
cd scripts
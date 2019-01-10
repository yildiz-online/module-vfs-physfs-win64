cmake . \
-DPHYSFS_INCLUDE_DIR="physicsfs/win64/include" \
-DLIBRARY_OUTPUT_PATH="../../../../target/classes/win64" \
-DCMAKE_TOOLCHAIN_FILE=mingw-toolchain.cmake

make
r1=$?

cp physicsfs/win64/lib/libphysfs.dll ../../../../target/classes/win64/libphysfs.dll

rm -R CMakeFiles
rm CMakeCache.txt
rm cmake_install.cmake
rm Makefile
rm -r physicsfs
rm -r ../../c++
rm -r ../../includes
rm -r ../win64

return $r1

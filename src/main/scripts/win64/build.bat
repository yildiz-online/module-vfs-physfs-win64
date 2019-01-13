cmake . ^
-DCMAKE_MODULE_PATH=. ^
-DCMAKE_BUILD_TYPE=Release ^
-DPHYSFS_INCLUDE_DIR="physicsfs/win64/include" ^
-DPHYSFS_LIBRARY="physicsfs/win64/lib/libphysfs.a" ^
-DLIBRARY_OUTPUT_PATH="../../../../target/classes/win64" ^
-G "MinGW Makefiles"

SET r1=
mingw32-make

cd ..
copy libstdc++-6.dll ../../../../target/classes/win64
copy libgcc_s_seh-1.dll ../../../../target/classes/win64

EXIT /B $r1



#!/usr/bin/env bash

source ../../../../target/classes/project.txt

VERSION=${VERSION%"-SNAPSHOT"}

echo "Build number"
echo $BUILD_NUMBER

echo "1 VERSIONINFO" > version.rc
echo "FILEVERSION $VERSION,0" | tr . , >> version.rc
echo "PRODUCTVERSION $VERSION,0" | tr . , >> version.rc
echo "FILEFLAGSMASK 0x17L" >> version.rc
echo "FILEFLAGS 0x0L" >> version.rc
echo "FILEOS 0x4L" >> version.rc
echo "FILETYPE 0x1L" >> version.rc
echo "FILESUBTYPE 0x0L" >> version.rc
echo "BEGIN" >> version.rc
echo "    BLOCK \"StringFileInfo\"" >> version.rc
echo "    BEGIN" >> version.rc
echo "        BLOCK \"040904b0\"" >> version.rc
echo "        BEGIN" >> version.rc
echo "            VALUE \"FileDescription\", \"Yildiz-Engine VFS with PhysFS implementation.\"" >> version.rc
echo "            VALUE \"FileVersion\", \"$VERSION,0\"" | tr . , >> version.rc
echo "            VALUE \"InternalName\", \"libyildizphysfs.dll\\\0\"" >> version.rc
echo "            VALUE \"LegalCopyright\", \"Copyright (c) 2019 Gregory Van den Borre\\\0\"" >> version.rc
echo "            VALUE \"OriginalFilename\", \"libyildizphysfs.dll\\\0\"" >> version.rc
echo "            VALUE \"CompanyName\", \"Yildiz-Games\\\0\"" >> version.rc
echo "            VALUE \"ProductName\", \"Yildiz-Engine VFS PHYSFS module.\\\0\"" >> version.rc
echo "            VALUE \"ProductVersion\", \"$VERSION,0\"" | tr . , >> version.rc
echo "        END" >> version.rc
echo "    END" >> version.rc
echo "    BLOCK \"VarFileInfo\"" >> version.rc
echo "    BEGIN" >> version.rc
echo "        VALUE \"Translation\", 0x409, 1200" >> version.rc
echo "    END" >> version.rc
echo "END" >> version.rc

cmake . \
-DCMAKE_MODULE_PATH=. \
-DCMAKE_BUILD_TYPE=Release \
-DCMAKE_WINDOWS_EXPORT_ALL_SYMBOLS=True \
-DPHYSFS_INCLUDE_DIR="physicsfs/win64/include" \
-DPHYSFS_LIBRARY="physicsfs/win64/lib/libphysfs.a" \
-DLIBRARY_OUTPUT_PATH="../../../../target/classes/win64" \
-DCMAKE_TOOLCHAIN_FILE=mingw-toolchain.cmake

make

cp libstdc++-6.dll ../../../../target/classes/win64/libstdc++-6.dll
cp libgcc_s_seh-1.dll ../../../../target/classes/win64/libgcc_s_seh-1.dll

mkdir ../../../../target/classes/win64/include
cp ../../../../src/main/includes/yz_physfs_Wrapper.hpp ../../../../target/classes/win64/include
cp ../../../../src/main/includes/yz_physfs_File.hpp ../../../../target/classes/win64/include
cp ../../../../src/main/includes/yz_physfs_Container.hpp ../../../../target/classes/win64/include
cp ../../../../src/main/includes/yz_physfs_ArchiveTypeInfo.hpp ../../../../target/classes/win64/include
cp ../../../../src/main/includes/yz_physfs_system_platform.hpp ../../../../target/classes/win64/include
cp physicsfs/win64/include/physfs.h ../../../../target/classes/win64/include

rm -R CMakeFiles
rm CMakeCache.txt
rm cmake_install.cmake
rm Makefile
rm -r physicsfs
rm -r java
rm libgcc_s_seh-1.dll
rm libstdc++-6.dll
rm mingw-toolchain.cmake

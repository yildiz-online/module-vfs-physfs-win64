cd ../../../../target/classes
ls
source ../../../../target/classes/project.txt

#VERSION=1.0.0.0

echo "1 VERSIONINFO" > version.rc
echo "FILEVERSION $VERSION" | tr . , >> version.rc
echo "PRODUCTVERSION $VERSION" | tr . , >> version.rc
echo "FILEFLAGSMASK 0x17L" >> version.rc
echo "FILEFLAGS 0x0L" >> version.rc
echo "FILEOS 0x4L" >> version.rc
echo "FILETYPE 0x1L" >> version.rc
echo "FILESUBTYPE 0x0L" >> version.rc
echo "BEGIN" >> version.rc
echo "    BLOCK \"StringFileInfo\"" >> version.rc
echo "    BLOCK \"StringFileInfo\"" >> version.rc
echo "    BEGIN" >> version.rc
echo "        BLOCK \"040904b0\"" >> version.rc
echo "        BEGIN" >> version.rc
echo "            VALUE \"FileDescription\", \"Yildiz-Engine VFS with PhysFS implementation.\"" >> version.rc
echo "            VALUE \"FileVersion\", \"$VERSION\"" | tr . , >> version.rc
echo "            VALUE \"InternalName\", \"libyildizphysfs.dll\\\0\"" >> version.rc
echo "            VALUE \"LegalCopyright\", \"Copyright (c) 2019 Gregory Van den Borre\\\0\"" >> version.rc
echo "            VALUE \"OriginalFilename\", \"libyildizphysfs.dll\\\0\"" >> version.rc
echo "            VALUE \"CompanyName\", \"Yildiz-Games\\\0\"" >> version.rc
echo "            VALUE \"ProductName\", \"Yildiz-Engine VFS PHYSFS module.\\\0\"" >> version.rc
echo "            VALUE \"ProductVersion\", \"$VERSION\"" | tr . , >> version.rc
echo "        END" >> version.rc
echo "    END" >> version.rc
echo "    BLOCK \"VarFileInfo\"" >> version.rc
echo "    BEGIN" >> version.rc
echo "        VALUE \"Translation\", 0x409, 1200" >> version.rc
echo "    END" >> version.rc
echo "END" >> version.rc

cat version.rc

cmake . \
-DCMAKE_MODULE_PATH=. \
-DCMAKE_BUILD_TYPE=Release \
-DPHYSFS_INCLUDE_DIR="physicsfs/win64/include" \
-DPHYSFS_LIBRARY="physicsfs/win64/lib/libphysfs.a" \
-DLIBRARY_OUTPUT_PATH="../../../../target/classes/win64" \
-DCMAKE_TOOLCHAIN_FILE=mingw-toolchain.cmake

make
r1=$?

cp libstdc++-6.dll ../../../../target/classes/win64/libstdc++-6.dll
cp libgcc_s_seh-1.dll ../../../../target/classes/win64/libgcc_s_seh-1.dll

rm -R CMakeFiles
rm CMakeCache.txt
rm cmake_install.cmake
rm Makefile
rm -r physicsfs
rm -r java
rm libgcc_s_seh-1.dll
rm libstdc++-6.dll
rm mingw-toolchain.cmake

return $r1

echo "$VERSION" | tr . ,

echo -e "1 VERSIONINFO" > version.rc
echo -e "FILEVERSION 1,0,0,1" >> version.rc
echo -e "PRODUCTVERSION 1,0,0,1" >> version.rc
echo -e "FILEFLAGSMASK 0x17L" >> version.rc
echo -e "FILEFLAGS 0x0L" >> version.rc
echo -e "FILEOS 0x4L" >> version.rc
echo -e "FILETYPE 0x1L" >> version.rc
echo -e "FILESUBTYPE 0x0L" >> version.rc
echo -e "BEGIN" >> version.rc
echo -e "    BLOCK \"StringFileInfo\"" >> version.rc
echo -e "    BEGIN" >> version.rc
echo -e "        BLOCK \"040904b0\"" >> version.rc
echo -e "        BEGIN" >> version.rc
echo -e "            VALUE \"FileDescription\", \"Yildiz-Engine VFS with PhysFS implementation.\"" >> version.rc
echo -e "            VALUE \"FileVersion\", \"1, 0, 0, 2\"" >> version.rc
echo -e "            VALUE \"InternalName\", \"libyildizphysfs.dll\0\"" >> version.rc
echo -e "            VALUE \"LegalCopyright\", \"Copyright (c) 2019 Gregory Van den Borre\0\"" >> version.rc
echo -e "            VALUE \"OriginalFilename\", \"libyildizphysfs.dll\0\"" >> version.rc
echo -e "            VALUE \"CompanyName\", \"Yildiz-Games\0\"" >> version.rc
echo -e "            VALUE \"ProductName\", \"Yildiz-Engine VFS PHYSFS module.\0\"" >> version.rc
echo -e "            VALUE \"ProductVersion\", \"1, 0, 0, 0\"" >> version.rc
echo -e "        END" >> version.rc
echo -e "    END" >> version.rc
echo -e "    BLOCK \"VarFileInfo\"" >> version.rc
echo -e "    BEGIN" >> version.rc
echo -e "        VALUE \"Translation\", 0x409, 1200" >> version.rc
echo -e "    END" >> version.rc
echo -e "END" >> version.rc


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
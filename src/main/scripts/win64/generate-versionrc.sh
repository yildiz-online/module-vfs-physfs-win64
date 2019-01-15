echo "$VERSION" | tr . ,

echo -e "1 VERSIONINFO" > test-version.rc
echo -e "FILEVERSION 1,0,0,1" >> test-version.rc
echo -e "PRODUCTVERSION 1,0,0,1" >> test-version.rc
echo -e "FILEFLAGSMASK 0x17L" >> test-version.rc
echo -e "FILEFLAGS 0x0L" >> test-version.rc
echo -e "FILEOS 0x4L" >> test-version.rc
echo -e "FILETYPE 0x1L" >> test-version.rc
echo -e "FILESUBTYPE 0x0L" >> test-version.rc
echo -e "BEGIN" >> test-version.rc
echo -e "    BLOCK \"StringFileInfo\"" >> test-version.rc
echo -e "    BLOCK \"StringFileInfo\"" >> test-version.rc
echo -e "    BEGIN" >> test-version.rc
echo -e "        BLOCK \"040904b0\"" >> test-version.rc
echo -e "        BEGIN" >> test-version.rc
echo -e "            VALUE \"FileDescription\", \"Yildiz-Engine VFS with PhysFS implementation.\"" >> test-version.rc
echo -e "            VALUE \"FileVersion\", \"1, 0, 0, 2\"" >> test-version.rc
echo -e "            VALUE \"InternalName\", \"libyildizphysfs.dll\\0\"" >> test-version.rc
echo -e "            VALUE \"LegalCopyright\", \"Copyright (c) 2019 Gregory Van den Borre\\0\"" >> test-version.rc
echo -e "            VALUE \"OriginalFilename\", \"libyildizphysfs.dll\\0\"" >> test-version.rc
echo -e "            VALUE \"CompanyName\", \"Yildiz-Games\\0\"" >> test-version.rc
echo -e "            VALUE \"ProductName\", \"Yildiz-Engine VFS PHYSFS module.\\0\"" >> test-version.rc
echo -e "            VALUE \"ProductVersion\", \"1, 0, 0, 0\"" >> test-version.rc
echo -e "        END" >> test-version.rc
echo -e "    END" >> test-version.rc
echo -e "    BLOCK \"VarFileInfo\"" >> test-version.rc
echo -e "    BEGIN" >> test-version.rc
echo -e "        VALUE \"Translation\", 0x409, 1200" >> test-version.rc
echo -e "    END" >> test-version.rc
echo -e "END" >> test-version.rc

cmake_minimum_required (VERSION 3.0.0)

project (yildiz_native_physfs)

set(CMAKE_CXX_FLAGS "-fPIC -std=gnu++11")

find_package(PhysFS REQUIRED)

include_directories(${PHYSFS_INCLUDE_DIR})
include_directories("java/include")
include_directories("java/include/win32")

file(
        GLOB_RECURSE
        source_files
        ${CMAKE_SOURCE_DIR}/../../c++/*.cpp
        ${CMAKE_SOURCE_DIR}/../../includes/*.hpp
        ${CMAKE_SOURCE_DIR}/../../includes/*.h
)

add_library(yildizphysfs SHARED ${source_files} ${CMAKE_SOURCE_DIR}/version.rc)

target_link_libraries(yildizphysfs ${CMAKE_SOURCE_DIR}/physicsfs/win64/lib/libphysfs.a)

cmake_minimum_required(VERSION 3.17)
set(CMAKE_BUILD_TYPE Debug)
project (xlnt_sample)

set(CMAKE_CXX_STANDARD 17)
option(BUILD_STATIC "BUILD_STATIC" OFF)
if (MSVC)
  message(STATUS "Static build: " ${BUILD_STATIC})
  if(BUILD_STATIC)
    set(CMAKE_MSVC_RUNTIME_LIBRARY "MultiThreaded$<$<CONFIG:Debug>:Debug>")
  endif()
endif()
message(STATUS "Source directory is " ${CMAKE_SOURCE_DIR})
message(STATUS "Build directory is " ${CMAKE_CURRENT_BINARY_DIR})

include_directories(${CMAKE_SOURCE_DIR}/xlnt-1.5.0/include)
add_executable(xlnt_sample xlnt_sample.cc)

#//////////////////////////
#link with libraries
#lib_dep contains a cascade definition of all the libraries needed to link
#//////////////////////////

set(lib_dep ${lib_dep})

if (MSVC)
  set(lib_dep ${lib_dep} ${CMAKE_SOURCE_DIR}/build/xlnt-1.5.0/source/Debug/xlntd.lib)
  set(lib_dep ${lib_dep} ${CMAKE_SOURCE_DIR}/build/xlnt-1.5.0/source/third-party/libstudxml/libstudxml.dir/Debug/libstudxml.lib)
endif()
target_link_libraries(xlnt_sample ${lib_dep})




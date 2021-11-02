   
cmake_minimum_required(VERSION 3.0.0)
project(exercises VERSION 0.1.0)

include(CTest)
enable_testing()

add_executable(exercises 字典插入与查找.cpp)

set(CPACK_PROJECT_NAME ${PROJECT_NAME})
set(CPACK_PROJECT_VERSION ${PROJECT_VERSION})
include(CPack)
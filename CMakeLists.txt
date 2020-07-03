cmake_minimum_required(VERSION 3.12)

include(cmake/enableWarnings.cmake)
include(cmake/santizer.cmake)

project(ENTERYOURNAMEHERE)
add_executable(${PROJECT_NAME})

set_property(TARGET ${PROJECT_NAME} PROPERTY CXX_STANDARD 17)
set_property(TARGET ${PROJECT_NAME} PROPERTY CXX_EXTENSIONS OFF)
set_property(TARGET ${PROJECT_NAME} PROPERTY CXX_STANDARD_REQUIRED ON)

enable_warnings(${PROJECT_NAME)

target_sources(${PROJECT_NAME} PUBLIC main.cpp)

find_package(Threads)
target_link_libraries(${PROJECT_NAME} PRIVATE Threads::Threads)


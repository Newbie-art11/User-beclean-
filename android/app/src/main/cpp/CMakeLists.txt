cmake_minimum_required(VERSION 3.10.2)
project(rive_text)

set(CMAKE_CXX_STANDARD 17)
set(CMAKE_CXX_STANDARD 14)

include_directories(
    ../../../../../ios/harfbuzz/src
    ../../../../../ios/rive-cpp/skia/renderer/include
    ../../../../../ios/rive
    # Add additional include directories as needed
)

file(GLOB RIVE_SRC
    "path/to/rive-cpp/src/**/*.cpp"
    "path/to/harfbuzz/src/**/*.cpp"
    # Add other source files as needed
)

add_library(rive_text SHARED ${RIVE_SRC})

find_library(log-lib log)

target_link_libraries(rive_text ${log-lib})

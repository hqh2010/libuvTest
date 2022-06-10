set(CMAKE_BUILD_TYPE Debug)
cmake_minimum_required(VERSION 3.0)

project(libuv1)

set(CMAKE_CXX_STANDARD 11)
set(CMAKE_INCLUDE_CURRENT_DIR ON)

find_package(PkgConfig REQUIRED)
pkg_check_modules(uv REQUIRED IMPORTED_TARGET libuv)
# need install libuv1-dev first 
set(LINK_LIBS
    stdc++
    # Qt5::Core
    # Qt5::Network
    # Qt5::DBus
    # ${DBUS_LIBRARIES}
    PkgConfig::uv
    )

add_executable(uv_server server.cpp)
target_link_libraries(uv_server ${LINK_LIBS})

add_executable(uv_client client.cpp)
target_link_libraries(uv_client ${LINK_LIBS})

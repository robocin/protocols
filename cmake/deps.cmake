########################################################################################################################

if (NOT CMAKE_CXX_STANDARD)
    set(CMAKE_CXX_STANDARD 20)
endif ()

if (NOT CMAKE_CXX_STANDARD_REQUIRED)
    set(CMAKE_CXX_STANDARD_REQUIRED ON)
endif ()

message("-- Using C++: ${CMAKE_CXX_STANDARD}")

########################################################################################################################

include(GNUInstallDirs) # provided by CMake

########################################################################################################################

# Find Protobuf installation
# Looks for protobuf cmake config files installed by Protobuf's cmake installation.
find_package(Protobuf CONFIG REQUIRED HINTS "/opt/protobuf" "/opt/grpc")
message(STATUS "Using Protobuf: ${Protobuf_VERSION}")

########################################################################################################################

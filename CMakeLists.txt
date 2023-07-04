##
## Created by José Cruz <joseviccruz> on 14/06/23.
## Copyright (c) 2023 RobôCIn.
##

########################################################################################################################

cmake_minimum_required(VERSION 3.16)

########################################################################################################################

project(robocin_pb LANGUAGES CXX)

########################################################################################################################

list(APPEND CMAKE_MODULE_PATH ${CMAKE_CURRENT_LIST_DIR}/cmake) # add our custom cmake modules to the module path

include(cmake/rules.cmake) # load our custom rules

########################################################################################################################

set(protobuf_subdir robocin/pb)

function(get_protobufs prefix_path result)
    file(GLOB_RECURSE files "${prefix_path}/*.proto")
    set(${result} ${files} PARENT_SCOPE)
endfunction()

get_protobufs("${protobuf_subdir}/utility" utility_pbs)
robocin_cpp_proto_library(
        NAME utility
        PROTOS ${utility_pbs}
)

get_protobufs("${protobuf_subdir}/ssl" ssl_pbs)
robocin_cpp_proto_library(
        NAME ssl
        PROTOS ${ssl_pbs}
        DEPS utility
)

get_protobufs("${protobuf_subdir}/vss" vss_pbs)
robocin_cpp_proto_library(
        NAME vss
        PROTOS ${vss_pbs}
        DEPS utility
)

########################################################################################################################

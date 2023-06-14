########################################################################################################################

include(deps)
include(helpers)

########################################################################################################################

# Define the project name to be used in the code
set(ROBOCIN_PROJECT_NAME ${CMAKE_PROJECT_NAME})

########################################################################################################################

# Define the project path to be used in the code
get_filename_component(ROBOCIN_PROJECT_PATH "${CMAKE_CURRENT_LIST_DIR}/.." ABSOLUTE)

########################################################################################################################

# Add cpp proto library
# Named parameters:
#  NAME: name of the library
#  PROTOS: proto files
function(robocin_cpp_proto_library)
    cmake_parse_arguments(
            ARG                                      # prefix of output variables
            ""                                       # list of names of the boolean arguments
            "NAME"                                   # list of names of mono-valued arguments
            "PROTOS;DEPS"                            # list of names of multi-valued arguments
            ${ARGN}                                  # arguments of the function to parse
    )

    # if there isn't at least one proto file, then the library is not created
    if (NOT ARG_PROTOS)
        message(WARNING "robocin_cpp_proto_library: no proto files given for library '${ARG_NAME}'.")
        return()
    endif ()

    set(proto_hdrs)
    set(proto_srcs)

    foreach (PROTO ${ARG_PROTOS})
        get_filename_component(proto_name ${PROTO} NAME_WE)
        get_filename_component(proto_absolute_file ${PROTO} ABSOLUTE)
        get_filename_component(proto_absolute_path ${proto_absolute_file} DIRECTORY)
        file(RELATIVE_PATH proto_relative_file ${ROBOCIN_PROJECT_PATH} ${proto_absolute_file})
        file(RELATIVE_PATH proto_relative_path ${ROBOCIN_PROJECT_PATH} ${proto_absolute_path})

        set(proto_hdr_file "${CMAKE_BINARY_DIR}/${proto_relative_path}/${proto_name}.pb.h")
        set(proto_src_file "${CMAKE_BINARY_DIR}/${proto_relative_path}/${proto_name}.pb.cc")

        add_custom_command(
                OUTPUT "${proto_hdr_file}" "${proto_src_file}"
                COMMAND $<TARGET_FILE:protobuf::protoc>
                ARGS --proto_path ${ROBOCIN_PROJECT_PATH}
                --cpp_out "${CMAKE_BINARY_DIR}"
                "${proto_relative_file}"
                DEPENDS "${proto_absolute_file}"
                WORKING_DIRECTORY ${ROBOCIN_PROJECT_PATH}
        )

        list(APPEND proto_hdrs ${proto_hdr_file})
        list(APPEND proto_srcs ${proto_src_file})

    endforeach (PROTO)

    add_library(${ARG_NAME} ${proto_hdrs} ${proto_srcs})
    target_link_libraries(${ARG_NAME} PUBLIC protobuf::libprotobuf ${ARG_DEPS}) # link library with given dependencies

    target_include_directories(${ARG_NAME} PRIVATE ${ROBOCIN_PROJECT_PATH})
    target_include_directories(${ARG_NAME} PRIVATE ${CMAKE_BINARY_DIR})

    # installing steps:
    #  - include directories to be used by other projects
    target_include_directories(${ARG_NAME} INTERFACE
            $<BUILD_INTERFACE:${CMAKE_CURRENT_SOURCE_DIR}>
            $<INSTALL_INTERFACE:${CMAKE_INSTALL_INCLUDEDIR}>
    )
    #  - install header files preserving the directory structure
    foreach (HDR_FILE ${proto_hdrs})
        file(RELATIVE_PATH header_relative_path ${ROBOCIN_PROJECT_PATH} ${CMAKE_CURRENT_SOURCE_DIR})

        get_filename_component(header_relative_subdirectory ${HDR_FILE} DIRECTORY)
        file(RELATIVE_PATH header_relative_subdirectory ${CMAKE_CURRENT_BINARY_DIR} ${header_relative_subdirectory})

        robocin_concatenate_paths("${header_relative_path}" "${header_relative_subdirectory}" header_relative_path)
        robocin_concatenate_paths("${CMAKE_INSTALL_INCLUDEDIR}" "${header_relative_path}" header_install_path)

        install(FILES ${HDR_FILE} DESTINATION "${header_install_path}")
    endforeach ()
    #  - install library
    install(TARGETS ${ARG_NAME} EXPORT "${PROJECT_NAME}Targets")
    #  - install CMake configuration files
    install(
            EXPORT "${PROJECT_NAME}Targets"
            NAMESPACE "${PROJECT_NAME}::"
            FILE "${PROJECT_NAME}Config.cmake"
            DESTINATION "${CMAKE_INSTALL_LIBDIR}/cmake/${PROJECT_NAME}"
    )

endfunction(robocin_cpp_proto_library)

########################################################################################################################

########################################################################################################################

# Concatenate two paths
function(robocin_concatenate_paths lhs rhs result)
    if (NOT ${lhs} STREQUAL "" AND NOT ${rhs} STREQUAL "")
        set(${result} "${lhs}/${rhs}" PARENT_SCOPE)
    elseif (NOT ${lhs} STREQUAL "")
        set(${result} "${lhs}" PARENT_SCOPE)
    elseif (NOT ${rhs} STREQUAL "")
        set(${result} "${rhs}" PARENT_SCOPE)
    else ()
        set(${result} "" PARENT_SCOPE)
    endif ()
endfunction()

########################################################################################################################

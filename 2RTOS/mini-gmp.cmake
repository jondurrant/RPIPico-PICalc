# Add library cpp files

if (NOT DEFINED GMP_DIR)
    set(GMP_DIR "${CMAKE_CURRENT_LIST_DIR}/lib/gmp-6.3.0")
endif()

add_library(mini_gmp STATIC)
target_sources(mini_gmp PUBLIC
    ${GMP_DIR}/mini-gmp/mini-gmp.c
    ${GMP_DIR}/mini-gmp/mini-mpq.c
)

# Add include directory
target_include_directories(mini_gmp PUBLIC 
    ${GMP_DIR}/mini-gmp
)

# Add the standard library to the build
target_link_libraries(mini_gmp PUBLIC pico_stdlib)
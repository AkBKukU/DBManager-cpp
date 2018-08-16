# CMake file for c++ web hosting
# by Shelby Jueden (AkBKukU)

cmake_minimum_required(VERSION 3.1)

# -- Project Configuration --
project(sql_c)

# Set name of ouput binary.
set(BIN_NAME "sql_c")

# Add all files from a src folder
#file(GLOB SOURCES "src/*.cpp")
file(GLOB SOURCES "*.cpp")


# Set C++11
set (CMAKE_CXX_STANDARD 11)

# Setup binary output
message("Bin Name: ${BIN_NAME}")
message("Sources: ${SOURCES}")
add_executable(${BIN_NAME} ${SOURCES})

find_library(mdbc_lib mariadbclient)
find_path(mdbc_path "mysql.h" HINTS /usr/include/mysql)
message(${mdbc_lib})
message(${mdbc_path})

target_link_libraries(${BIN_NAME} LINK_PUBLIC ${mdbc_lib})
include_directories (${mdbc_path})

# libs
get_filename_component(MDB_LOC "../../lib/mariadb-connector-c-3.0.6-linux-x86_64" ABSOLUTE)

#ADD_LIBRARY (mariadbclient SHARED IMPORTED GLOBAL)
#SET_PROPERTY (TARGET mariadbclient PROPERTY IMPORTED_LOCATION "${MDB_LOC}/lib/mariadb/mariadbclient.a")

# Libraries
add_subdirectory ( ${MDB_LOC} "lib/mariadb")
target_link_libraries (${BIN_NAME} LINK_PUBLIC MariaDB)
set_target_properties(MariaDB PROPERTIES LINKER_LANGUAGE CXX)
#target_link_libraries (${BIN_NAME} LINK_PUBLIC "${MDB_LOC}/lib/mariadb/mariadbclient.a")

#ADD_LIBRARY(mariadbclient STATIC IMPORTED)
#SET_TARGET_PROPERTIES(mariadbclient PROPERTIES IMPORTED_LOCATION "${MDB_LOC}/lib/mariadb/mariadbclient.a")
#TARGET_LINK_LIBRARIES(${BIN_NAME} A mariadbclient C)


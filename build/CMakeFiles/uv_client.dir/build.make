# CMAKE generated file: DO NOT EDIT!
# Generated by "Unix Makefiles" Generator, CMake Version 3.18

# Delete rule output on recipe failure.
.DELETE_ON_ERROR:


#=============================================================================
# Special targets provided by cmake.

# Disable implicit rules so canonical targets will work.
.SUFFIXES:


# Disable VCS-based implicit rules.
% : %,v


# Disable VCS-based implicit rules.
% : RCS/%


# Disable VCS-based implicit rules.
% : RCS/%,v


# Disable VCS-based implicit rules.
% : SCCS/s.%


# Disable VCS-based implicit rules.
% : s.%


.SUFFIXES: .hpux_make_needs_suffix_list


# Command-line flag to silence nested $(MAKE).
$(VERBOSE)MAKESILENT = -s

#Suppress display of executed commands.
$(VERBOSE).SILENT:

# A target that is always out of date.
cmake_force:

.PHONY : cmake_force

#=============================================================================
# Set environment variables for the build.

# The shell in which to execute make rules.
SHELL = /bin/sh

# The CMake executable.
CMAKE_COMMAND = /usr/bin/cmake

# The command to remove a file.
RM = /usr/bin/cmake -E rm -f

# Escaping for special characters.
EQUALS = =

# The top-level source directory on which CMake was run.
CMAKE_SOURCE_DIR = /media/uthuqinghong/EEECE1A7ECE169F3/libuv_test

# The top-level build directory on which CMake was run.
CMAKE_BINARY_DIR = /media/uthuqinghong/EEECE1A7ECE169F3/libuv_test/build

# Include any dependencies generated for this target.
include CMakeFiles/uv_client.dir/depend.make

# Include the progress variables for this target.
include CMakeFiles/uv_client.dir/progress.make

# Include the compile flags for this target's objects.
include CMakeFiles/uv_client.dir/flags.make

CMakeFiles/uv_client.dir/client.cpp.o: CMakeFiles/uv_client.dir/flags.make
CMakeFiles/uv_client.dir/client.cpp.o: ../client.cpp
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/media/uthuqinghong/EEECE1A7ECE169F3/libuv_test/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_1) "Building CXX object CMakeFiles/uv_client.dir/client.cpp.o"
	/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -o CMakeFiles/uv_client.dir/client.cpp.o -c /media/uthuqinghong/EEECE1A7ECE169F3/libuv_test/client.cpp

CMakeFiles/uv_client.dir/client.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/uv_client.dir/client.cpp.i"
	/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /media/uthuqinghong/EEECE1A7ECE169F3/libuv_test/client.cpp > CMakeFiles/uv_client.dir/client.cpp.i

CMakeFiles/uv_client.dir/client.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/uv_client.dir/client.cpp.s"
	/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /media/uthuqinghong/EEECE1A7ECE169F3/libuv_test/client.cpp -o CMakeFiles/uv_client.dir/client.cpp.s

# Object files for target uv_client
uv_client_OBJECTS = \
"CMakeFiles/uv_client.dir/client.cpp.o"

# External object files for target uv_client
uv_client_EXTERNAL_OBJECTS =

uv_client: CMakeFiles/uv_client.dir/client.cpp.o
uv_client: CMakeFiles/uv_client.dir/build.make
uv_client: /usr/lib/x86_64-linux-gnu/libuv.so
uv_client: /usr/lib/x86_64-linux-gnu/librt.so
uv_client: /usr/lib/x86_64-linux-gnu/libpthread.so
uv_client: /usr/lib/x86_64-linux-gnu/libnsl.so
uv_client: /usr/lib/x86_64-linux-gnu/libdl.so
uv_client: CMakeFiles/uv_client.dir/link.txt
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --bold --progress-dir=/media/uthuqinghong/EEECE1A7ECE169F3/libuv_test/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_2) "Linking CXX executable uv_client"
	$(CMAKE_COMMAND) -E cmake_link_script CMakeFiles/uv_client.dir/link.txt --verbose=$(VERBOSE)

# Rule to build all files generated by this target.
CMakeFiles/uv_client.dir/build: uv_client

.PHONY : CMakeFiles/uv_client.dir/build

CMakeFiles/uv_client.dir/clean:
	$(CMAKE_COMMAND) -P CMakeFiles/uv_client.dir/cmake_clean.cmake
.PHONY : CMakeFiles/uv_client.dir/clean

CMakeFiles/uv_client.dir/depend:
	cd /media/uthuqinghong/EEECE1A7ECE169F3/libuv_test/build && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /media/uthuqinghong/EEECE1A7ECE169F3/libuv_test /media/uthuqinghong/EEECE1A7ECE169F3/libuv_test /media/uthuqinghong/EEECE1A7ECE169F3/libuv_test/build /media/uthuqinghong/EEECE1A7ECE169F3/libuv_test/build /media/uthuqinghong/EEECE1A7ECE169F3/libuv_test/build/CMakeFiles/uv_client.dir/DependInfo.cmake --color=$(COLOR)
.PHONY : CMakeFiles/uv_client.dir/depend

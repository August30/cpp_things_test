# CMAKE generated file: DO NOT EDIT!
# Generated by "Unix Makefiles" Generator, CMake Version 3.12

# Delete rule output on recipe failure.
.DELETE_ON_ERROR:


#=============================================================================
# Special targets provided by cmake.

# Disable implicit rules so canonical targets will work.
.SUFFIXES:


# Remove some rules from gmake that .SUFFIXES does not remove.
SUFFIXES =

.SUFFIXES: .hpux_make_needs_suffix_list


# Suppress display of executed commands.
$(VERBOSE).SILENT:


# A target that is always out of date.
cmake_force:

.PHONY : cmake_force

#=============================================================================
# Set environment variables for the build.

# The shell in which to execute make rules.
SHELL = /bin/sh

# The CMake executable.
CMAKE_COMMAND = /opt/cmake-3.12.2/bin/cmake

# The command to remove a file.
RM = /opt/cmake-3.12.2/bin/cmake -E remove -f

# Escaping for special characters.
EQUALS = =

# The top-level source directory on which CMake was run.
CMAKE_SOURCE_DIR = /home/cyg/cpp_things_test/const

# The top-level build directory on which CMake was run.
CMAKE_BINARY_DIR = /home/cyg/cpp_things_test/const/bulid

# Include any dependencies generated for this target.
include CMakeFiles/file_test.dir/depend.make

# Include the progress variables for this target.
include CMakeFiles/file_test.dir/progress.make

# Include the compile flags for this target's objects.
include CMakeFiles/file_test.dir/flags.make

CMakeFiles/file_test.dir/file1.cpp.o: CMakeFiles/file_test.dir/flags.make
CMakeFiles/file_test.dir/file1.cpp.o: ../file1.cpp
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/cyg/cpp_things_test/const/bulid/CMakeFiles --progress-num=$(CMAKE_PROGRESS_1) "Building CXX object CMakeFiles/file_test.dir/file1.cpp.o"
	/usr/bin/c++  $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -o CMakeFiles/file_test.dir/file1.cpp.o -c /home/cyg/cpp_things_test/const/file1.cpp

CMakeFiles/file_test.dir/file1.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/file_test.dir/file1.cpp.i"
	/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /home/cyg/cpp_things_test/const/file1.cpp > CMakeFiles/file_test.dir/file1.cpp.i

CMakeFiles/file_test.dir/file1.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/file_test.dir/file1.cpp.s"
	/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /home/cyg/cpp_things_test/const/file1.cpp -o CMakeFiles/file_test.dir/file1.cpp.s

CMakeFiles/file_test.dir/file2.cpp.o: CMakeFiles/file_test.dir/flags.make
CMakeFiles/file_test.dir/file2.cpp.o: ../file2.cpp
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/cyg/cpp_things_test/const/bulid/CMakeFiles --progress-num=$(CMAKE_PROGRESS_2) "Building CXX object CMakeFiles/file_test.dir/file2.cpp.o"
	/usr/bin/c++  $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -o CMakeFiles/file_test.dir/file2.cpp.o -c /home/cyg/cpp_things_test/const/file2.cpp

CMakeFiles/file_test.dir/file2.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/file_test.dir/file2.cpp.i"
	/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /home/cyg/cpp_things_test/const/file2.cpp > CMakeFiles/file_test.dir/file2.cpp.i

CMakeFiles/file_test.dir/file2.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/file_test.dir/file2.cpp.s"
	/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /home/cyg/cpp_things_test/const/file2.cpp -o CMakeFiles/file_test.dir/file2.cpp.s

# Object files for target file_test
file_test_OBJECTS = \
"CMakeFiles/file_test.dir/file1.cpp.o" \
"CMakeFiles/file_test.dir/file2.cpp.o"

# External object files for target file_test
file_test_EXTERNAL_OBJECTS =

file_test: CMakeFiles/file_test.dir/file1.cpp.o
file_test: CMakeFiles/file_test.dir/file2.cpp.o
file_test: CMakeFiles/file_test.dir/build.make
file_test: CMakeFiles/file_test.dir/link.txt
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --bold --progress-dir=/home/cyg/cpp_things_test/const/bulid/CMakeFiles --progress-num=$(CMAKE_PROGRESS_3) "Linking CXX executable file_test"
	$(CMAKE_COMMAND) -E cmake_link_script CMakeFiles/file_test.dir/link.txt --verbose=$(VERBOSE)

# Rule to build all files generated by this target.
CMakeFiles/file_test.dir/build: file_test

.PHONY : CMakeFiles/file_test.dir/build

CMakeFiles/file_test.dir/clean:
	$(CMAKE_COMMAND) -P CMakeFiles/file_test.dir/cmake_clean.cmake
.PHONY : CMakeFiles/file_test.dir/clean

CMakeFiles/file_test.dir/depend:
	cd /home/cyg/cpp_things_test/const/bulid && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /home/cyg/cpp_things_test/const /home/cyg/cpp_things_test/const /home/cyg/cpp_things_test/const/bulid /home/cyg/cpp_things_test/const/bulid /home/cyg/cpp_things_test/const/bulid/CMakeFiles/file_test.dir/DependInfo.cmake --color=$(COLOR)
.PHONY : CMakeFiles/file_test.dir/depend


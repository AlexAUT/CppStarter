# Does only work for clang/gcc.

# We have to compile the whole project with santizers if we want to. To set the CXX_FLAGS globally
if (CMAKE_CXX_COMPILER_ID STREQUAL "GNU" OR CMAKE_CXX_COMPILER_ID STREQUAL "Clang")
  # Add enum to cache to enable sanitizer option
  set(USE_SANITIZER "None" CACHE STRING "Santizer option to use")
  set_property(CACHE USE_SANITIZER PROPERTY STRINGS None Address Thread Undefined Leak Memory)

  if (USE_SANITIZER STREQUAL "Address")
      set(CMAKE_C_FLAGS "${CMAKE_C_FLAGS} -fsanitize=address")
      set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} -fsanitize=address")
  elseif (USE_SANITIZER STREQUAL "Thread")
      set(CMAKE_C_FLAGS "${CMAKE_C_FLAGS} -fsanitize=thread")
      set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} -fsanitize=thread")
  elseif (USE_SANITIZER STREQUAL "Undefined")
      set(CMAKE_C_FLAGS "${CMAKE_C_FLAGS} -fsanitize=undefined")
      set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} -fsanitize=undefined")
  elseif (USE_SANITIZER STREQUAL "Leak")
      set(CMAKE_C_FLAGS "${CMAKE_C_FLAGS} -fsanitize=leak")
      set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} -fsanitize=leak")
  elseif (USE_SANITIZER STREQUAL "Memory")
      set(CMAKE_C_FLAGS "${CMAKE_C_FLAGS} -fsanitize=memory")
      set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} -fsanitize=memory")
      if (CMAKE_CXX_COMPILER_ID STREQUAL "GNU")
        message(FATAL_ERROR "Sanitizer option Memory not compatible with GCC, use Address instead")
      endif()
  endif()
endif()

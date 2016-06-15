cmake_minimum_required(VERSION 2.8)

message(STATUS "TriangleDelaunay2D: Building as a Remote VTK module")

# Search for Schewchuk's Triangle thirdparty library
if(NOT EXISTS ${CMAKE_CURRENT_SOURCE_DIR}/triangle.c)
  message(FATAL_ERROR "Shewchuk's Triangle sources not found in sources directory! Please copy triangle sources in module sources directory.")
endif()

# This flag will declare "#define INEXACT volatile" in triangle.c & predicates.h
set(TRIANGLE_EXTRA_FLAGS)
if(TRIANGLE_SAFE_PREDICATES)
  set(TRIANGLE_EXTRA_FLAGS TRIANGLE_SAFE_PREDICATES)
endif()

set(Module_SRCS
  vtkTriangleDelaunay2D.cxx
  predicates.c
  triangle.c
  )

set_property(SOURCE ${CMAKE_CURRENT_SOURCE_DIR}/triangle.c
 APPEND PROPERTY COMPILE_DEFINITIONS
    ANSI_DECLARATORS NO_TIMER TRILIBRARY REDUCED CDT_ONLY ${TRIANGLE_EXTRA_FLAGS})

set_property(SOURCE ${CMAKE_CURRENT_SOURCE_DIR}/predicates.c
  APPEND PROPERTY COMPILE_DEFINITIONS ${TRIANGLE_EXTRA_FLAGS})

option(DELAUNAYTRIANGLE2D_OVERRIDE_VTKIMPL "Override vtkDelaunay2D with vtkTriangleDelaunay2D (through factory)" FALSE)
if(DELAUNAYTRIANGLE2D_OVERRIDE_VTKIMPL)
  include(vtkObjectFactory)
  vtk_add_override(vtkDelaunay2D vtkTriangleDelaunay2D)
  vtk_object_factory_configure("${vtk_module_overrides}")
  set_source_files_properties(${vtk-module}ObjectFactory.cxx
    PROPERTIES
      WRAP_EXCLUDE 1
      WRAP_EXCLUDE_PYTHON 1)
  list(APPEND Module_SRCS
    ${CMAKE_CURRENT_BINARY_DIR}/${vtk-module}ObjectFactory.cxx)
endif()

vtk_module_library(vtkTriangleDelaunay2D ${Module_SRCS})

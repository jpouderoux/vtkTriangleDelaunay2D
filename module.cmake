set(DOCUMENTATION "This modules introduces a VTK class to compute Delaunay triangulation in 2D using Shewchuck's Triangle.")

vtk_module(vtkTriangleDelaunay2D
  DESCRIPTION
    "${DOCUMENTATION}"
  DEPENDS
    vtkCommonDataModel
    vtkCommonExecutionModel
    vtkFiltersCore
  TEST_DEPENDS
    vtkTestingCore
  KIT
    vtkRemote
  TCL_NAME
    vtkTriangleDelaunay
)
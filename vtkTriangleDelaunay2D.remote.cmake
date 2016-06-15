#
# Delaunay2D with Shewchuk's Triangle
#

vtk_fetch_module(vtkTriangleDelaunay2D
  "2D Delaunay triangulation using Shewchuk's Triangle"
  GIT_REPOSITORY https://github.com/jpouderoux/vtkTriangleDelaunay2D
  # June 15, 2016 - first working as a remote module
  GIT_TAG 0960de5c96f1953603dd297f15c741dfd72953ba
  )

add_executable(matrixvector matrixvector.cpp)
target_link_libraries(matrixvector PRIVATE MPI::MPI_CXX)
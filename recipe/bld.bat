mkdir build
cd build
if errorlevel 1 exit 1

cmake ^
    -G "NMake Makefiles" ^
    -D CMAKE_BUILD_TYPE="Release" ^
    -D CMAKE_INSTALL_PREFIX:PATH="%LIBRARY_PREFIX%" ^
    -D CMAKE_INSTALL_LIBDIR=lib ^
    -D HPX_WITH_EXAMPLES=FALSE ^
    -D HPX_WITH_MALLOC="mimalloc" ^
    -D HPX_WITH_NETWORKING=FALSE ^
    -D HPX_WITH_TESTS=FALSE ^
    ..
if errorlevel 1 exit 1

cmake --build . --config Release --parallel %CPU_COUNT%
if errorlevel 1 exit 1

cmake --install .
if errorlevel 1 exit 1

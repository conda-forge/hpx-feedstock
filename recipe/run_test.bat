pushd test

cmake . \
    ${CMAKE_ARGS}
if errorlevel 1 exit 1

cmake --build . --config Release
if errorlevel 1 exit 1

Release\hello_hpx.exe
if errorlevel 1 exit 1

popd

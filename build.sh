#!/bin/sh

cmake -G "CodeLite - Unix Makefiles" -DCMAKE_BUILD_TYPE=$1 -S . -B "${1:-Build}"

cmake --build "${1:-Build}"


#!/bin/sh

cmake -G $1 -DCMAKE_BUILD_TYPE=$2 -S . -B "build/${2:-}"

cmake --build "${2:-}"


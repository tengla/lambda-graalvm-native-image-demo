#!/bin/bash
docker build -t lambda .
mkdir -p build
docker run --rm --entrypoint cat lambda  /usr/src/app/function.zip > build/function.zip

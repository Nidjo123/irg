#!/bin/bash

g++ -std=c++11 $(pkg-config --cflags glfw3) -o vertexColorTriangle vertexColorTriangle.cpp glad.c $(pkg-config --libs --static glfw3)

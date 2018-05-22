#!/bin/bash

g++ -g -std=c++11 $(pkg-config --cflags glfw3) -o polygons polygons.cpp glad.c OpenGLApp.cpp $(pkg-config --libs --static glfw3)

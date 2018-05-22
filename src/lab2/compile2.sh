#!/bin/bash

g++ -g -std=c++11 $(pkg-config --cflags glfw3) -o obj ObjectModel.cpp Vertex3D.cpp Face3D.cpp obj.cpp $(pkg-config --libs --static glfw3)

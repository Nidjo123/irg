#!/bin/bash

g++ -g -std=c++11 -O3 -msse2 -Iinclude -o surfaceHiding2 surfaceHiding.cpp Face3D.cpp Vertex3D.cpp ObjectModel.cpp IRG/*.cpp -lGL -lGLU -lglut

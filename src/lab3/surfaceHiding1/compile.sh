#!/bin/bash

g++ -g -std=c++11 -Iinclude -o surfaceHiding1 surfaceHiding.cpp Face3D.cpp Vertex3D.cpp ObjectModel.cpp IRG/*.cpp -lGL -lGLU -lglut

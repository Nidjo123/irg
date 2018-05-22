#!/bin/bash

g++ -g -std=c++11 -o persp2 persp2.cpp Face3D.cpp Vertex3D.cpp ObjectModel.cpp -lGL -lGLU -lglut

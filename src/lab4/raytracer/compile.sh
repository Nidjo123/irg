#!/bin/bash

g++ -g -O3 -std=c++11 -Iinclude -o raytracer raytracer.cpp RTScene.cpp Sphere.cpp Patch.cpp IRG/*.cpp -lGL -lGLU -lglut

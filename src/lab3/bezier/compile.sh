#!/bin/bash

g++ -g -std=c++11 -Iinclude -o bezier bezier.cpp IRG/*.cpp -lGL -lGLU -lglut

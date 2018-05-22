#include "ObjectModel.h"
#include <iostream>
#include <cmath>
#include <utility>
#include <fstream>
#include <sstream>
#include <stdexcept>
#include <boost/algorithm/string.hpp>

ObjectModel::ObjectModel(std::string file) {
  char type;
  float x, y, z;
  int i, j, k;
  std::ifstream ifs(file);

  if (!ifs) {
    throw std::runtime_error("Can't open " + file);
  }

  while (ifs) {
    std::string line;
    std::getline(ifs, line);

    boost::trim(line);

    if (line.empty()) continue;
    
    std::istringstream iss(line);

    iss >> type;

    std::cout << "Read type: " << type << std::endl;

    if (type == 'v') {
      iss >> x >> y >> z;
      std::cout << "Reading vertex " << x << ", " << y << ", " << z << std::endl;
      vertices.push_back(Vertex3D(x, y, z));
    } else if (type == 'f') {
      iss >> i >> j >> k;
      std::cout << "Reading face " << i << ", " << j << ", " << k << std::endl;
      faces.push_back(Face3D(i - 1, j - 1, k - 1));
    }
  }

  calculateSurfaces();
}

void ObjectModel::calculateSurfaces() {
  for (auto& f : faces) {
    // calculate surface coefficients
    const Vertex3D& p1 = vertices[f[0]];
    const Vertex3D& p2 = vertices[f[1]];
    const Vertex3D& p3 = vertices[f[2]];

    glm::vec3 v1(p1.getX(), p1.getY(), p1.getZ());
    glm::vec3 v2(p2.getX(), p2.getY(), p2.getZ());
    glm::vec3 v3(p3.getX(), p3.getY(), p3.getZ());

    glm::vec3 normal = glm::cross(v2 - v1, v3 - v1);

    // ax + by + cz + d = 0; dot(normal, v1) = -d
    glm::vec4 surface = glm::vec4(normal, -glm::dot(normal, v1));

    f.setSurface(surface);
  }
}

const std::vector<Vertex3D>& ObjectModel::getVertices() const {
  return vertices;
}

const std::vector<Face3D>& ObjectModel::getFaces() const {
  return faces;
}

void ObjectModel::normalize() {
  float xmin, ymin, zmin, xmax, ymax, zmax;

  xmin = ymin = zmin = std::numeric_limits<float>::infinity();
  xmax = ymax = zmax = -std::numeric_limits<float>::infinity();

  for (const auto &f : faces) {
    for (int i = 0; i < 3; i++) {
      const Vertex3D& v = vertices[f[i]];
      const float vx = v.getX();
      const float vy = v.getY();
      const float vz = v.getZ();
      
      xmin = std::min(xmin, vx);
      ymin = std::min(ymin, vy);
      zmin = std::min(zmin, vz);

      xmax = std::max(xmax, vx);
      ymax = std::max(ymax, vy);
      zmax = std::max(zmax, vz);
    }
  }

  const float x = (xmin + xmax) / 2;
  const float y = (ymin + ymax) / 2;
  const float z = (zmin + zmax) / 2;

  const float M = std::max(xmax - xmin, std::max(ymax - ymin, zmax - zmin));
  const float scaleFactor = 2.0f / M;
  
  for (auto &v : vertices) {
    v.translate(-x, -y, -z);
    v.scale(scaleFactor);
  }

  // important!
  calculateSurfaces();
}

int ObjectModel::testPoint(float x, float y, float z) const {
  return testPoint(Vertex3D(x, y, z));
}

int ObjectModel::testPoint(const Vertex3D& vertex) const {
  // check if point is behind all faces

  glm::vec4 p(vertex.getX(), vertex.getY(), vertex.getZ(), 1.0f);

  bool isOnEdge = false;
  
  for (const auto& f : faces) {
    glm::vec4 surface = f.getSurface();
    float res = glm::dot(p, surface);

    if (res > 0) return 1;
    if (std::abs(res) < 1e-7) isOnEdge = true;
  }

  return isOnEdge ? 0 : -1;
}

std::string ObjectModel::dumpToOBJ() const {
  std::string obj;

  for (const auto &v : vertices) {
    obj += v.toString() + "\n";
  }

  for (const auto &f : faces) {
    obj += f.toString() + "\n";
  }

  return obj;
}

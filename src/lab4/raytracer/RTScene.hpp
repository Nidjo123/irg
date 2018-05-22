#ifndef RTSCENE_HPP
#define RTSCENE_HPP

#include <string>
#include <vector>
#include <IVector.hpp>
#include "Light.hpp"
#include "Sphere.hpp"
#include "Patch.hpp"
#include "Color.hpp"

class RTScene {
public:
  // parametri iz datoteke
  IVectorPtr eye;
  IVectorPtr G;
  IVectorPtr view;
  IVectorPtr viewUp;
  double h;
  double xAngle;
  double yAngle;
  RGBColor gaIntensity;

  std::vector<Light*> lights;
  std::vector<SceneObject*> objects;

  // izračunati parametri
  IVectorPtr xAxis;
  IVectorPtr yAxis;
  double l; // left
  double r; // right
  double b; // bottom
  double t; // top

  RTScene() = default;
  virtual ~RTScene();

  void printInfo() const;
  
  IVectorPtr startPoint(int x, int y, int w, int h_) const;
  
  static RTScene* readScene(std::string path);

private:
  // računa xAxis, yAxis, l, r, b i t
  void computeKS();
};

#endif

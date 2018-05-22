#ifndef COLOR_HPP
#define COLOR_HPP

struct RGBColor {
  double r;
  double g;
  double b;

  RGBColor() = default;
  RGBColor(double r, double g, double b) : r(r), g(g), b(b) {}
  
  // copy constructor
  RGBColor(const RGBColor&) = default;

  RGBColor operator*(double k) {
    return RGBColor(r*k, g*k, b*k);
  }

  RGBColor& operator*=(double k) {
    r *= k;
    g *= k;
    b *= k;

    return *this;
  }

  RGBColor operator*(const RGBColor &col) {
    return RGBColor(r*col.r, g*col.g, b*col.b);
  }

  RGBColor& operator*=(const RGBColor &col) {
    r *= col.r;
    g *= col.g;
    b *= col.b;

    return *this;
  }

  RGBColor operator+(const RGBColor &col) {
    return RGBColor(r+col.r, g+col.g, b+col.b);
  }

  RGBColor& operator+=(const RGBColor &col) {
    r += col.r;
    g += col.g;
    b += col.b;

    return *this;
  }
};

#endif

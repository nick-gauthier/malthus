#include <cmath>

// [[odin.dust::register]]
double pgamma_cpp(double x, double shape, double scale) {
  if (x <= 0) return 0.0;

  // Normalize x by scale
  x = x / scale;
  double p = shape;
  double z = x;

  // Handle small z case
  if (z <= 0) return 0;

  // Use series expansion
  double sum = 1.0 / p;
  double term = sum;
  for (int i = 1; i < 1000; i++) {
    term *= z / (p + i);
    sum += term;
    if (fabs(term) < fabs(sum) * 1e-14) break;
  }

  // Calculate log of gamma function
  double loggamma = lgamma(p);  // Using standard C++ lgamma function
  double result = sum * exp(-z + p * log(z) - loggamma);
  if (result > 1) result = 1;
  if (result < 0) result = 0;
  return result;
}

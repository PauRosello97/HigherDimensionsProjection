final float angleXY = PI*0.0003;
final float angleYZ = PI*0.0005;
final float angleZW = PI*0.0007;

final float[][] ROATION_MATRIX_XY = {
  {cos(angleXY), -sin(angleXY), 0, 0},
  {sin(angleXY), cos(angleXY), 0, 0},
  {0, 0, 1, 0},
  {0, 0, 0, 1}
};

final float[][] ROATION_MATRIX_YZ = {
  {1, 0, 0, 0},
  {0, cos(angleYZ), -sin(angleYZ), 0},
  {0, sin(angleYZ), cos(angleYZ), 0},
  {0, 0, 0, 1}
};

final float[][] ROATION_MATRIX_ZW = {
  {1, 0, 0, 0},
  {0, 1, 0, 0},
  {0, 0, cos(angleZW), -sin(angleZW)},
  {0, 0, sin(angleZW), cos(angleZW)}
};


final float projConst = -1.;
final float[][] PROJECTION_MATRIX = {
  {1, 0, 0, projConst},
  {0, 1, projConst, 0}
};

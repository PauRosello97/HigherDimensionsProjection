final float angleXY = PI*0.005;
final float angleYZ = PI*0.005;

final float[][] ROTATION_MATRIX_XY = {
  {cos(angleXY), -sin(angleXY), 0},
  {sin(angleXY), cos(angleXY), 0},
  {0, 0, 1},
};

final float[][] ROTATION_MATRIX_YZ = {
  {1, 0, 0},
  {0, cos(angleYZ), -sin(angleYZ)},
  {0, sin(angleYZ), cos(angleYZ)},
};

final float projConst = -1.;

final float[][] PROJECTION_MATRIX = {
  {1, 0, 0},
  {0, 1, projConst}
};

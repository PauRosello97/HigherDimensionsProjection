ArrayList<float[]> points;

void setup() {
  size(900, 900);
  points = new ArrayList<float[]>();
  for (int x = 0; x < 2; x++) {
    for (int y = 0; y < 2; y++) {
      for (int z = 0; z < 2; z++) {
        for (int w = 0; w < 2; w++) {
          float[] p = {2*x-1,2*y-1,2*z-1,2*w-1};
          points.add(p);
        }
      }
    }
  }
}

void draw() {
  background(100);
  translate(width/2, height/2);
  
  connectPoints(points.get(0), points.get(1));
  connectPoints(points.get(0), points.get(2));
  connectPoints(points.get(0), points.get(4));
  connectPoints(points.get(0), points.get(8));
  connectPoints(points.get(1), points.get(3));
  connectPoints(points.get(1), points.get(5));
  connectPoints(points.get(1), points.get(9));
  connectPoints(points.get(2), points.get(3));
  connectPoints(points.get(2), points.get(6));
  connectPoints(points.get(2), points.get(10));
  connectPoints(points.get(3), points.get(7));
  connectPoints(points.get(3), points.get(11));
  connectPoints(points.get(4), points.get(5));
  connectPoints(points.get(4), points.get(6));
  connectPoints(points.get(4), points.get(12));
  connectPoints(points.get(5), points.get(7));
  connectPoints(points.get(5), points.get(13));
  connectPoints(points.get(6), points.get(7));
  connectPoints(points.get(6), points.get(14));
  connectPoints(points.get(7), points.get(15));
  connectPoints(points.get(8), points.get(9));
  connectPoints(points.get(8), points.get(10));
  connectPoints(points.get(8), points.get(12));
  connectPoints(points.get(9), points.get(11));
  connectPoints(points.get(9), points.get(13));
  connectPoints(points.get(10), points.get(11));
  connectPoints(points.get(10), points.get(14));
  connectPoints(points.get(11), points.get(15));
  connectPoints(points.get(12), points.get(13));
  connectPoints(points.get(12), points.get(14));
  connectPoints(points.get(13), points.get(15));
  connectPoints(points.get(14), points.get(15));
  
  for (int i = 0; i < points.size(); i++) {
    drawPoint(points.get(i));
    points.set(i, appMatrix(ROATION_MATRIX_XY, points.get(i)));
    points.set(i, appMatrix(ROATION_MATRIX_YZ, points.get(i)));
    points.set(i, appMatrix(ROATION_MATRIX_ZW, points.get(i)));
  }
}

void drawPoint(float[] p) { 
  stroke(255);
  strokeWeight(5);
  noFill();
  float[] q = appMatrix(PROJECTION_MATRIX, p);
  point(q[0]*100, q[1]*100);
}

void connectPoints(float[] p1, float[] p2) {
  float[] q1 = appMatrix(PROJECTION_MATRIX, p1);
  float[] q2 = appMatrix(PROJECTION_MATRIX, p2);
  stroke(255,0,0);
  strokeWeight(3);
  noFill();
  line(q1[0]*100, q1[1]*100, q2[0]*100, q2[1]*100);
}

float[] appMatrix(float[][] M, float[] p) {
  float[] q = new float[M.length];
  for (int i = 0; i < M.length; i++) {
    float Q = 0;
    for (int j = 0; j < M[i].length; j++) {
      Q += M[i][j] * p[j];
    }
    q[i] = Q;
  }
  return q;
}

void mouseMoved() {
  /*
  angleYZ = (mouseX - width/2) / width * 0.05 * PI;
  angleZW = (mouseY - height/2) / height * 0.05 * PI;
  turn4Dyz = {
    [1, 0, 0, 0],
    [0, Math.cos(angleYZ), -Math.sin(angleYZ), 0],
    [0, Math.sin(angleYZ), Math.cos(angleYZ), 0],
    [0, 0, 0, 1]
  };
  turn4Dzw = [
    [1, 0, 0, 0],
    [0, 1, 0, 0],
    [0, 0, Math.cos(angleZW), -Math.sin(angleZW)],
    [0, 0, Math.sin(angleZW), Math.cos(angleZW)]
  ];
  */
}

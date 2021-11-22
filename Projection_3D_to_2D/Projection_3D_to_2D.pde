ArrayList<float[]> points;

void setup() {
  size(600, 600);
  points = new ArrayList<float[]>();
  for (int x = 0; x < 2; x++) {
    for (int y = 0; y < 2; y++) {
      for (int z = 0; z < 2; z++) {
        float[] p = {2*x-1,2*y-1,2*z-1};
        points.add(p);
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
  connectPoints(points.get(1), points.get(3));
  connectPoints(points.get(1), points.get(5));
  connectPoints(points.get(2), points.get(3));
  connectPoints(points.get(2), points.get(6));
  connectPoints(points.get(3), points.get(7));
  connectPoints(points.get(4), points.get(5));
  connectPoints(points.get(4), points.get(6));
  connectPoints(points.get(5), points.get(7));
  connectPoints(points.get(6), points.get(7));

  for (int i = 0; i < points.size(); i++) {
    drawPoint(points.get(i));
    points.set(i, appMatrix(ROTATION_MATRIX_XY, points.get(i)));
    points.set(i, appMatrix(ROTATION_MATRIX_YZ, points.get(i)));
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

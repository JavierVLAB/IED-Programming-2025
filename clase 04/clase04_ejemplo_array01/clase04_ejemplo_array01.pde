float[] x;
float[] y;
int N = 200;
float[] tamanno; 

void setup() {
  size(600, 600);
  x = new float[N];
  y = new float[N];
  tamanno = new float[N];

  for (int i = 0; i < N; i++) {
    x[i] = random(width);
    y[i] = random(height);
    tamanno[i] = random(10,40);
  }
}

void draw() {
  background(0);
  for (int i = 0; i < N; i++) {
    circle(x[i], y[i], tamanno[i]);
    x[i] += 0.1*random(4);
  }
  //circle(random(width),random(height),30);
}

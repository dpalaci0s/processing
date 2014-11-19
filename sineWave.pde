int xspacing = 12;  
int w;              
int area;
float theta = 0.0;
float amplitude = 75.0;  
float period = 500.0;  
float dx; 
float[] yvalues; 

void setup() {
  size(1200, 740);
  w = width+16;
  dx = (TWO_PI / period) * xspacing;
  yvalues = new float[w/xspacing];
}

void draw() {
  background(0);
  calcWave();
  renderWave();
  stroke(255);
  line(0,height/2,width,height/2);
  text(area+"",600,200);
}

void calcWave() {
  theta += 0.02;
  float x = theta;
  for (int i = 0; i < yvalues.length; i++) {
    yvalues[i] = sin(x)*amplitude;
    x+=dx;
  }
}

void renderWave() {
  noStroke();
  fill(255);
  for (int x = 0; x < yvalues.length; x++) {
    ellipse(x*xspacing, height/2+yvalues[x], 10, 10);
    rect(x*xspacing,height/2+yvalues[x],1,-yvalues[x]);
    calcArea(1,(int)-yvalues[x]);
  }

}
void calcArea(int x, int y)
{
  area+=x*y;
}

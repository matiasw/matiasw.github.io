void setup()
{
 size(800, 800);
 ellipseMode(RADIUS);
 strokeWeight(5);
}

void draw()
{
  background(128);
  float R0 = 250;
  float t = (float)millis()/1000;
  float r = sin(t/1.618);
  float R1 = R0/2*r;
  float R2 = R0/2*r;
  
  float k = 4 * (sqrt(2) - 1) / 3;
  translate(width/2, height/2);

  fill(0,80,180);
  circle(0, 0, R0);
  
  //rotate(r*PI);
  //larger drop: 
   fill(200,100,80);
  beginShape();
  vertex(-R0, 0); // Starting point
  float x1 = -R0;
  float y1 = -k*R2;
  float x2 = -R0 + k*R0/2;
  float y2 = -R2;
  float x3 = -R0/2;
  float y3 = -R2;
  //square(x1, y1, 10);
  //square(x2, y2, 10);
  //square(x3, y3, 10);
  bezierVertex(x1, y1, x2, y2, x3, y3); // First half of the first semicircle
  x1 = x3;//k*R2 + R0-R2;
  y1 = y3;//R2;
  x2 = 0;
  y2 = -R2;
  x3 = 0;
  y3 = 0;
  //square(x1, y1, 10);
  //square(x2, y2, 10);
  //square(x3, y3, 10);
  bezierVertex(x1, y1, x2, y2, x3, y3); // Second half of the first semicircle
  x1 = 0;
  y1 = k*R2;
  x2 = k*R0/2;
  y2 = R2;
  x3 = R0/2;
  y3 = R2;
  bezierVertex(x1, y1, x2, y2, x3, y3); // First half of the second semicircle
  //square(x1, y1, 10);
  //square(x2, y2, 10);
  //square(x3, y3, 10);
  x1 = x3;//k*R2 + R0-R2;
  y1 = y3;//R2;
  x2 = R0;
  y2 = R2;
  x3 = R0;
  y3 = 0;
  //square(x1, y1, 10);
  //square(x2, y2, 10);
  //square(x3, y3, 10);
  bezierVertex(x1, y1, x2, y2, x3, y3); // Second half of the second semicircle
  x1 = x3;
  y1 = k*R0;
  x2 = 0 + k*R0;
  y2 = R0;
  x3 = 0;
  y3 = R0;
  //square(x1, y1, 10);
  //square(x2, y2, 10);
  //square(x3, y3, 10);
  bezierVertex(x1, y1, x2, y2, x3, y3); // First half of the outer arc
  x1 = - k*R0;
  y1 = R0;
  x2 = -R0;
  y2 = k*R0;
  x3 = -R0;
  y3 = 0;
  //square(x1, y1, 10);
  //square(x2, y2, 10);
  //square(x3, y3, 10);
  bezierVertex(x1, y1, x2, y2, x3, y3); // Second half of the outer arc
  endShape();
   
}

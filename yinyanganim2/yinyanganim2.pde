
/**
 * waveform by GiL_TheB at yoyobafactory.net
 */


Waveform squa,tri,saw,ramp,hsb;


class Waveform {
  static final int SINE =0;
  static final int SQUARE =1;
  static final int TRIANGLE =2;
  static final int SAWTOOTH =3;
  static final int RAMP =4;

  int period;
  int offset;
  int wave_type;

  Waveform (int wave_type0, int period0, int offset0) {
    wave_type=wave_type0;
    period=period0;
    offset=offset0;
  }

  float next(){
    float phase;

    switch(wave_type)
    {
    case 0: // sine
      phase=(frameCount+offset+0.5)%period;
      break;

    case 3: // sawtooth
      phase=(frameCount+offset)%(period+1);
      break;
    case 4: // ramp
      phase=(frameCount+offset)%(period+1);
      break;
    default : 
      phase=(frameCount+offset)%period;
      break;

    }

    float fp=phase/period;
    float sample=0.0f;
    
    switch(wave_type)
    {
    case 0: // sine
      sample=(sin(fp*TWO_PI)+1)/2.0f;
      break;
    case 1: // square
      if(fp<0.5f)
        sample=0.0f;
      else
        sample=1.0f;
      break;
    case 2: // triangle
      if(fp<0.5f)
        sample=fp*2;
      else
        sample=1.0f-(fp-0.5f)*2.0f;
      break;
    case 3: // sawtooth
      sample=1.0f-fp;
      break;
    case 4: // ramp
      sample=fp;
      break;
    }
    return sample;
  }
}
 
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
  float t = (float)millis()/1000/3;
  float R1 = R0*(t - floor(t));
  float R2 = R0-R0*(t - floor(t));
  
  color c1 = color(0,80,180);
  color c2 = color(200,100,80);
 
  if (int(floor(t)) % 2 == 0) {
    c2 = color(0,80,180);
    c1 = color(200,100,80);
  }
  else {
    c1 = color(0,80,180);
    c2 = color(200,100,80);
  }
  float k = 4 * (sqrt(2) - 1) / 3;
  translate(width/2, height/2);

  fill(c1);
  circle(0, 0, R0);
  
  //rotate(t*0.72);
  //larger drop: 
   fill(c2);
  beginShape();
  vertex(-R1 - (R0-R1), 0); // Starting point
  float x1 = -R1 - (R0-R1);
  float y1 = -k*R1;
  float x2 = -k*R1 - (R0-R1);
  float y2 = -R1;
  float x3 = 0 - (R0-R1);
  float y3 = -R1;
  //square(x1, y1, 10);
  //square(x2, y2, 10);
  //square(x3, y3, 10);
  bezierVertex(x1, y1, x2, y2, x3, y3); // First half of the first semicircle
  x1 = k*R1 - (R0-R1);
  y1 = -R1;
  x2 = R1 - (R0-R1);
  y2 = -k*R1;
  x3 = R1 - (R0-R1);
  y3 = 0;
  //square(x1, y1, 10);
  //square(x2, y2, 10);
  //square(x3, y3, 10);
  bezierVertex(x1, y1, x2, y2, x3, y3); // Second half of the first semicircle
  x1 = x3;
  y1 = k*R2;
  x2 = k*R2 + (R0-2*R2);
  y2 = R2;
  x3 = R0-R2;
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

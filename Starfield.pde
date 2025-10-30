class Particle {
  private float x,y;
  protected float a, s, size,vx,vy;
  color c;
  Particle() {
    x = 400;
    y = 400;
    a = (float)(Math.random()*2*Math.PI);
    s = (float)(Math.random()*10);
    c = color((int)(Math.random()*256), (int)(Math.random()*256), (int)(Math.random()*256));
    size = 5;
    vx = 0;
    vy = 0;
  }
  void setXY(float x, float y){
    if(x > -10 && x < 810){
      this.x = x;
    }
    if(y > -10 && y < 810){
      this.y = y;
    }
  }
  float getX(){
    return x;
  }
  float getY(){
    return y;
  }
  void show() {
    fill(c);
    ellipse(x, y, size, size);
  }
  void move() {
    x += Math.cos(a)*s;
    y += Math.sin(a)*s;
  }
  void back() {
    x = mouseX;
    y = mouseY;
    a = (float)(Math.random()*2*Math.PI);
    s = (float)(Math.random()*10);
    vx = (float)(Math.random()*0.1);
    vy = (float)(Math.random()*0.1);
  }
}
class OddBallParticle extends Particle {
  OddBallParticle() {
    this.setXY(400,400);
    a = (float)(Math.random()*2*Math.PI);
    s = (float)(Math.random()*10);
    c = color((int)(Math.random()*256), (int)(Math.random()*256), (int)(Math.random()*256));
    size = 20;
    vx = (float)(Math.random()*0.1);
    vy = (float)(Math.random()*0.1);
  }
  void move() {
    this.setXY( this.getX() + vx, this.getY() + vy);
    if (this.getX() >= 800 || this.getX() <= 0) {
      vx = - vx;
    }
    if (this.getY() >= 800 || this.getY() <= 0) {
      vy = - vy;
    }
  }
}


Particle[] s = new Particle[100];
void setup() {
  size(800, 800);
  for (int i = 0; i < s.length-1; i++) {
    s[i] = new Particle();
  }
  s[99] = new OddBallParticle();
}
void draw() {
  background(0);
  for (int i = 0; i < s.length; i++) {
    s[i].show();
    s[i].move();
    s[99].move();
  }
}
void mousePressed() {
  for (int i = 0; i < s.length; i++) {
    s[i].back();
  }
}


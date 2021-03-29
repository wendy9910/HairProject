float x,k,len;
float mass = 24;//質量
float damping = 0.98;//減震盪
void Spring(){ 
  // Rest length and spring constant
  PVector gravity = new PVector(0,9.8);
  len=100;
  k=0.2;
  springFroce(30,200);
  applyForce(gravity);
}

void springFroce(float min,float max){
 
  PVector force = PVector.sub(position,p0);
  float d = force.mag();//彈簧長度
  x = d - len;//between current distance and rest length
  force.normalize();
  force.mult(-1 * k * x);
  
  applyForce(force);
  //伸長度控制範圍
  PVector dir = PVector.sub(p0,position);
  float d1 = dir.mag();
  if(d1 < min){
    dir.normalize();
    dir.mult(min);   
    position = PVector.add(p0,position);
    velocity.mult(0);
  }
  else if(d1 > max){
    dir.normalize();
    dir.mult(max);
    p[1] = PVector.add(p0,position);
    velocity.mult(0);
  }
}

void applyForce(PVector force) {
    PVector f = force.get();
    f.div(mass);
    acceleration.add(f);
}

void update() { 
  velocity.add(acceleration);
  velocity.mult(damping);
  position.add(velocity);
  acceleration.mult(0);
}

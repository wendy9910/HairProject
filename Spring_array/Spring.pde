float x,k,len;
float mass = 24;//質量
float damping = 0.98;//減震盪
void Spring(){
  PVector gravity = new PVector(0,9.8);
  len=50;
  k=0.2;
  springFroce(30,100,gravity);
  applyForce(gravity);
}

void springFroce(float min,float max,PVector force2){

  for(int i=0;i<9;i++){
    
    velocity[i].add(acceleration[i]);
    velocity[i].mult(damping);
    position[i+1].add(velocity[i]);
    acceleration[i].mult(0);
    
    PVector force = PVector.sub(position[i+1],position[i]);
    float d = force.mag();
    x = d - len;
    force.normalize();
    force.mult(-1 * k * x);
    //applyForce(force);
    
    PVector f = force2.get();
    f.div(mass);
    acceleration[i].add(f);
    
    PVector dir = PVector.sub(position[i],position[i+1]);
    float d1 = dir.mag();
    if(d1 < min){
      dir.normalize();
      dir.mult(min);   
      position[i+1] = PVector.add(position[i],position[i+1]);
      velocity[i].mult(0);
    }
    else if(d1 > max){
      dir.normalize();
      dir.mult(max);
      position[i+1] = PVector.add(position[i],position[i+1]);
      velocity[i].mult(0);
    }
    
  }
}

void applyForce(PVector force){
  for(int i=1;i<10;i++){
    
  }
}

void update() { 
  for(int i=1;i<10;i++){
    
  }
}

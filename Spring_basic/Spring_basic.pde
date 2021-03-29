PVector [] p=new PVector[3];
PVector p0,position,velocity,acceleration;//位置、速度、加速度、重力

void setup(){
  size(800,800);
  p0 = new PVector(width/2,0);
  position = new PVector(width/2,100);
  velocity = new PVector();
  acceleration = new PVector();
  
  p[0] = new PVector(p0.x,p0.y);
  p[1] = new PVector(position.x,position.y);
 
}
void draw(){
  background(255); 
  
  strokeWeight(2);
  line(p0.x,p0.y,position.x,position.y);
  fill(255,0,0);
  ellipse(p0.x,p0.y,30,30);
  fill(0,255,0);
  ellipse(position.x,position.y,30,30);
  
  Spring();
  update();//速度、位置變化
}
void mousePressed(){
  p0 = new PVector(mouseX,mouseY);
}

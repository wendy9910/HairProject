PVector [] p=new PVector[10];
PVector [] velocity=new PVector[10];
PVector [] position=new PVector[10];
PVector [] acceleration=new PVector[10];
//位置、速度、加速度、重力

void setup(){
  size(800,800);
  
  float n=0;
  for(int i=0;i<10;i++){
    position[i] =new PVector(width/3+n,100);
    velocity[i] =new PVector();
    acceleration[i] =new PVector();
    n+=50;
  }
}
void draw(){
  background(255); 
  for(int i=0;i<10;i++){
    if(i==0)fill(255,0,0);
    else fill(0,0,0);
    ellipse(position[i].x,position[i].y,20,20);
    if(i<9){
      strokeWeight(2);
      line(position[i].x,position[i].y,position[i+1].x,position[i+1].y);
    }
    
  }
  Spring();
  //update();//速度、位置變化
  
}

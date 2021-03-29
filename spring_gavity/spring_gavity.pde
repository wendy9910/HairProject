PVector []point=new PVector[10];
PVector []v=new PVector[10];
int value=0;
void setup(){
  size(500,500);
  for(int i=0;i<10;i++){
    point[i]=new PVector(100+i*40, 100);
    v[i]=new PVector();
  }
}
void update(){
  for(int i=0;i<10-1;i++){///i:0 (red) will not move
    v[i].y +=g;//gravity
    point[i].add(v[i]);
    
    if(i!=0){
      float d = PVector.dist(point[i], point[i-1]);
      //if( d>40) point[i].add( PVector.sub(point[i-1], point[i]).normalize().mult(d-40) );
      if(d>40) point[i].add( PVector.sub(point[i-1], point[i]).mult(d-40) );
    }
    float d2= PVector.dist(point[i], point[i+1]);
    if( d2>40) point[i].add( PVector.sub(point[i+1], point[i]).normalize().mult(d2-40) );
  }
}
float g=0.098;
void draw(){
  background(255);
  for(int i=0;i<10;i++){
    noFill();  ellipse(point[i].x, point[i].y, 10,10);
    if(i>0) line(point[i].x, point[i].y, point[i-1].x, point[i-1].y);
  }
  fill(255,0,0); ellipse(point[0].x, point[0].y, 10,10);
  
  if(value!=0)update();
}
void keyPressed(){
  //update();
}
void mouseReleased() {
  value++;
}

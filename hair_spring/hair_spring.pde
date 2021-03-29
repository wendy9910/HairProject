ArrayList<PVector>p;
ArrayList<PVector>v;
PVector last=null,n=null,n1=null;
int value=0;
void setup(){
  size(600,600);
  p = new ArrayList<PVector>();
  v = new ArrayList<PVector>();
  g = new PVector(0,0.098);
  n = new PVector();
  n1 = new PVector();
} 
void draw(){
  background(255);
  beginShape();
  noFill();
  for(int i=0;i<p.size();i++){
    PVector pt = p.get(i);
    //curveVertex(pt.x,pt.y);
    vertex(pt.x,pt.y);
  }
  endShape();
  noFill();
  for(int i=0;i<p.size();i++){
    PVector pt = p.get(i);
    if(i==0)fill(#FF0000);
    else fill(#1A1818);
    ellipse(pt.x,pt.y,15,15);
  }
  if(value!=0)update();
}
void mousePressed(){
  PVector pt = new PVector(mouseX,mouseY);
  p.add(pt);
  v.add(new PVector());
  last=pt;
}

void mouseDragged(){
  while(dist(mouseX,mouseY,last.x,last.y)>=50){
    PVector pt = new PVector(mouseX,mouseY);
    p.add(pt);
    v.add(new PVector());
    last=pt;
  }
}
PVector g; 
void update(){//以後可能會有問題
  for(int i=1;i<p.size();i++){///i:0 (red) will not move //<>//
    PVector v1 = v.get(i);
    PVector pt1 = p.get(i);  
    v1.add(g);
    pt1.add(v1);   
    float s=1;
    if(i!=p.size()-1){
      PVector pt0 = p.get(i+1);
      float d2= PVector.dist(pt1, pt0);
      if(d2>40){
          n1 = PVector.sub(pt0, pt1).normalize();
          n1.y *= (d2-50)*s;
          n1.x *= (d2-50)*s;
          pt1.y+=n1.y;
          pt1.x+=n1.x;
      } 
    }
    PVector pt2 = p.get(i-1);
    float d = PVector.dist(pt1, pt2);
    if(d>40){ 
      n = PVector.sub(pt2, pt1).normalize();
      n.y *= (d-50)*s;
      n.x *= (d-50)*s;
      pt1.y+=n.y;
      pt1.x+=n.x;
    }
  }
}

void mouseReleased() {
  value++;
}
void keyPressed(){
  if(key==' ')saveFrame("####.png");
}

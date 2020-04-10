void setup(){
  size(800,600);
  background(255);
  for(int i = 100 ; i < 800 ; i += 200){
    for(int j = 100 ; j < 600 ; j += 200){
      fill(255,0,0);
      ellipse(i,j,200,200);
      fill(0,255,0);      
      ellipse(i,j,100,100);
      fill(0,0,255);      
      ellipse(i,j,50,50);
    }
  }
  smooth();
}
void draw(){
  for(int i = 100 ; i < 800 ; i += 200){
    for(int j = 100 ; j < 600 ; j += 200){
      fill(255,0,0);
      ellipse(i,j,200,200);
      fill(0,255,0);      
      ellipse(i+(mouseX-400)/13,j+(mouseY-400)/13,100,100);
      fill(0,0,255);      
      ellipse(i+(mouseX-400)/8,j+(mouseY-400)/8,50,50);
    }
  }
}

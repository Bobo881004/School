PImage imgR;
PImage imgH;
int i,j,score;
int setX=10,setY=10;
int count = 50; 
int[]hulkx = new int[count];
int[]hulky = new int[count];
int[]hulklife = new int[count];
void setup()
{
size(1200, 900);

imgR = loadImage("Robot.jpg");
imgH = loadImage("Hulk.jpg");
for(int m = 0 ; m < count ; m++){
  hulkx[m] = (int)random(1200);
  hulky[m] = (int)random(700);
  hulklife[m] = 1;
}
frameRate(20);
}

void draw()
{  
  background(255);
  image(imgR, i, j);
  fill(0);
  textSize(30);
  text("score = " + score ,50,50);
  for(int m = 0 ; m < count ; m++){
    if(hulklife[m] == 1){
      image(imgH, hulkx[m], hulky[m],80,80);
    }
  }//print Hulk
  
  if(keyPressed == true){
    if(key == 'd' || key == 'D'){
      i = i + setX;
      if(i > 1200){
        i = 0;
      }
    }
    if(key == 'a' || key == 'A'){
      i = i - setX;
      if(i < 0){
        i = 1200;
      }
    }
    if(key == 'w' || key == 'w'){
      j = j - setY;
      if(j < 0){
        j = 900;
      }
    }
    if(key == 's' || key == 'S'){
      j = j + setY;
      if(j > 900){
         j = 0;
      }
    }    
  }//move
  for(int m = 0 ; m < count ; m++){
    if((i < hulkx[m]+80 && i > hulkx[m]-80) && (j < hulky[m]+80 && j>hulky[m]-80) && hulklife[m] == 1){
      hulklife[m] = 0 ;
      score++;
    }
  }//check whether eat or not
  if(score == 50){
    background(255);
    fill(0);
    textSize(50);
    text("win!!",600,350);
  }
}

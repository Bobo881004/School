int num = 20;
int top=1;
int back=1;
void setup(){
  size(600, 800);
  strokeWeight(3);
  frameRate(15);
  fill(42,82,190);
  rect(510,0,90,800);
  fill(255);
  rect(520,30,70,30);
  rect(520,150,70,30);
  rect(520,330,70,30);
  rect(520,480,70,30);
  rect(520,600,70,30);
  rect(520,660,70,30);
  fill(0);
  textSize(15);
  text("next",540,50);
  text("pre",540,170);
  text("random",530,350);
  text("next",540,500);
  text("pre",540,620);
  text("save",540,680);
  PImage imgBack = loadImage("21b.jpg");
  image(imgBack, 0, 400);
  smooth();
}
void draw(){
    if(mousePressed == true && mouseButton == LEFT){
      if(mouseX > 520 && mouseX < 590 && mouseY > 30 && mouseY < 60){
         top++;
         if(top > 20){
           top = 1;
         }
        PImage imgFront = loadImage(top + "t.jpg");
        image(imgFront, 0, 0);         
      }
      if(mouseX >520 && mouseX < 590 && mouseY > 150 && mouseY < 180){
         top--;
         if(top == 0){
           top++;
         }
        PImage imgFront = loadImage(top + "t.jpg");
        image(imgFront, 0, 0);            
      }
      if(mouseX >520 && mouseX < 590 && mouseY > 330 && mouseY < 360){
        top = int(random(1,num)); // Select the top card
        back = int(random(1,num)); // Select the back card
        PImage imgFront = loadImage(top + "t.jpg");
        image(imgFront, 0, 0);
        PImage imgBack = loadImage(back + "b.jpg");
        image(imgBack, 0, 400);        
      }
      if(mouseX >520 && mouseX < 590 && mouseY > 480 && mouseY < 510){
         back++;
         if(back > 21){
           back = 1;
         }
         PImage imgBack = loadImage(back + "b.jpg");
         image(imgBack, 0, 400);
      }
      if(mouseX >520 && mouseX < 590 && mouseY > 600 && mouseY < 630){
         back--;
         if(back == 0){
           back++;
         }
         PImage imgBack = loadImage(back + "b.jpg");
         image(imgBack, 0, 400);         
      }
      if(mouseX >520 && mouseX < 590 && mouseY > 660 && mouseY < 690){
         save("picture.jpg");
      }
    }

}

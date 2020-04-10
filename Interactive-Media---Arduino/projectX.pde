PImage img_background;
PImage img_background2;
PImage img_role1;
PImage img_role2;
PImage img_role3;
PImage img_role4;
PImage img_123;
PImage img_A;
PImage img_B;
PImage add;
int[] chinese = new int[11];
int[] math = new int[11];
int[] news = new int[11];
int Aplayer,Bplayer,Bechose;
int x = 5;
int screen = 0;
int delay = 0;//chack answer

int count = 0;// question number
int point_1 = 0 ,point_2 = 0;
boolean addtest = true;
char answer_1P ,answer_2P ;

import processing.serial.*;

Serial port;
int val=0;

void setup()
{
  println(Serial.list());
  String postName = Serial.list()[1];
  frameRate(10);
  port = new Serial(this, postName, 9600);
  //arduino
  add = loadImage("add.jpg");
  img_background=loadImage("background.png");
  size(1200,800);
  background(255);
  image(img_background, 0, 0, 1200, 800);
  fill(255);
  textSize(50);
  text("Push any button!",400,750);
  screen = 1; 
}



void draw(){

  if(mousePressed == true && mouseButton == LEFT && screen == 1)
  {
    background(255);
    img_background2=loadImage("5.jpg");
    image(img_background2, 0, 0, 1200, 800);
    fill(0);
    textSize(50);
    text("Choose your character:",100,200);
    img_role1=loadImage("1.jpg");
    img_role2=loadImage("2.jpg");
    img_role3=loadImage("3.jpg");
    img_role4=loadImage("4.jpg");
    image(img_role1, 100, 300, 175, 175);
    image(img_role2, 375, 300, 175, 175);
    image(img_role3, 650, 300, 175, 175);
    image(img_role4, 925, 300, 175, 175);

    for (int i = 0; i < 11; i++) {
        chinese[i] = 0; // Create each object
        math[i] = 0; // Create each object
        news[i] = 0; // Create each object
      }//Question Reset
    screen = 0;
    delay = 0;
    count = 0;
    // Reset
    screen = 2 ;
  }



  if(mousePressed == true && mouseButton == LEFT && screen == 2)
  {
    if(mouseX>100 && mouseX<275 && mouseY>300 && mouseY<475)
    {
      fill(255,0,0);
          textSize(50);
          text("1P", 100,450);
          Aplayer = 1;
          save("123.jpg");
            img_123=loadImage("123.jpg");
          image(img_123, 0, 0, 1200, 800);
          screen = 3;
    }
      else if(mouseX>375 && mouseX<550 && mouseY>300 && mouseY<475)
      {
          fill(255,0,0);
          textSize(50);
          text("1P", 375,450);
          Aplayer = 2;
          save("123.jpg");
          img_123=loadImage("123.jpg");
          image(img_123, 0, 0, 1200, 800);
           screen = 3;
      }
      else if(mouseX>650 && mouseX<825 && mouseY>300 && mouseY<475)
      {
          fill(255,0,0);
          textSize(50);
          text("1P", 650,450);
          Aplayer = 3;
          save("123.jpg");
          img_123=loadImage("123.jpg");
          image(img_123, 0, 0, 1200, 800);
          screen = 3;
      }
      else if(mouseX>925 && mouseX<1100 && mouseY>300 && mouseY<475)
      {
          fill(255,0,0);
          textSize(50);
          text("1P", 925,450);
          Aplayer = 4;
          save("123.jpg");
          img_123=loadImage("123.jpg");
          image(img_123, 0, 0, 1200, 800);
          screen = 3;
      }
   }//chose 1 character
 
 
 

    if(mousePressed == true && mouseButton == RIGHT && screen == 3)
    {
      if(mouseX>100 && mouseX<275 && mouseY>300 && mouseY<475)
      {
          fill(255,0,0);
          textSize(50);
          text("2P", 220,450);
          Bplayer = 1;
          fill(189,252,201);
          rect(900, 650, 200, 100);
          fill(255,0,0);
          textSize(50);
          text("Start", 945, 720);
         screen = 4;
      }
      else if(mouseX>375 && mouseX<550 && mouseY>300 && mouseY<475)
      {
          fill(255,0,0);
          textSize(50);
          text("2P", 495,450);
          Bplayer = 2;
          fill(189,252,201);
          rect(900, 650, 200, 100);
          fill(255,0,0);
          textSize(50);
          text("Start", 945, 720); 
          screen = 4;
      }
      else if(mouseX>650 && mouseX<825 && mouseY>300 && mouseY<475)
      {
          fill(255,0,0);
          textSize(50);
          text("2P", 770,450);
          Bplayer = 3;
          fill(189,252,201);
          rect(900, 650, 200, 100);
          fill(255,0,0);
          textSize(50);
          text("Start", 945, 720);
         screen = 4;
      }
      else if(mouseX>925 && mouseX<1100 && mouseY>300 && mouseY<475)
      {
          fill(255,0,0);
          textSize(50);
          text("2P", 1045,450);
          Bplayer = 4;
          fill(189,252,201);
          rect(900, 650, 200, 100);
          fill(255,0,0);
          textSize(50);
          text("Start", 945, 720);
          screen = 4;
      }
    }//chose 2 character

    if(screen==4 && mousePressed == true && mouseButton == LEFT){ 
      if(mouseX>900 && mouseX<1100 && mouseY>650 && mouseY <750){
          background(135,206,235);
          img_A=loadImage(Aplayer+"sc.png");
          image(img_A, 100, 80, 250, 250);
          img_B=loadImage(Bplayer+"sc.png");
          image(img_B, 800, 80, 250, 250);
          screen = 5;
       }

    }//screen 4
  
    if(screen == 5){
      if(count == 10){
        screen = 6;
      }
      if(delay == 0){
        Question();
        delay = 1;
      }// show Question
      if(delay == 1){
          if (0 < port.available())
          { // If data is available,
            val = port.read(); // read it and store it in val
            println(val);
          }
          if(val == 0){
            delay = 1; 
            answer_1P = '0';
            answer_2P = '0';
          }
          else if(val == 2){
            answer_1P = 'A';
            answer_2P = '0';
            delay = 2;
          }

          else if(val == 3){
            answer_1P = 'B';
            answer_2P = '0';
            delay = 2;
          }
          
          else if(val == 4){
            answer_1P = 'C';
            answer_2P = '0';
            delay = 2;
          }
          
          else if(val == 5){
            answer_1P = 'D';
            answer_2P = '0';
            delay = 2;
          }//1player
          else if(val == 6){
            answer_2P = 'A';
            answer_1P = '0';
            delay = 2;
          }
          else if(val == 7){
            answer_2P = 'B';
            answer_1P = '0';
            delay = 2;
          }
          
          else if(val == 8){
            answer_2P = 'C';
            answer_1P = '0';
            delay = 2;
          }
          
          else if(val == 9){
            answer_2P = 'D';
            answer_1P = '0';
            delay = 2;        
          }//2player

       }//chose answer
      if(delay == 2){
          if(answer_1P != '0' && answer_2P =='0'){
            if(Check(answer_1P) != 10){
              point_2 += 10;
            }
            point_1 = point_1 + Check(answer_1P);
            delay = 3;
          }//check answer
          if(answer_1P == '0' && answer_2P != '0'){
            if(Check(answer_2P) != 10){
              point_1 += 10;
            }
            point_2 = point_2 + Check(answer_2P);
            delay = 3;
          }//check answer
      }
       if(delay == 3){
          Answer();
          noStroke();
          fill(135,206,235);
          rect(350,80,450,250);
          fill(255,0,0);
          textSize(80);
          text(point_1, 400, 300);
          text(point_2, 650, 300);     //score

          fill(189,252,201);
          strokeWeight(5);
          rect(1110,350,100, 270);
          fill(255,0,0);
          textSize(50);
          val = 0;
          text("C", 1140, 400);
          text("L", 1140, 450);
          text("I", 1140, 500);
          text("C", 1140, 550);
          text("K", 1140, 600);
          if(mousePressed == true && mouseButton == LEFT){
            if(mouseX>1110 && mouseX<1200 && mouseY>350 && mouseY <550){
              count++;
              delay = 0;
            }
          }
       }//show answer
    }//screen 5

    if(screen == 6){
      background(135,206,235);
      textSize(50);
      if(point_1 > point_2){
        text("1Pwin", 500, 400);
        img_A=loadImage(Aplayer+"sc.png");
        image(img_A, 100, 80, 250, 250);
      }
      if(point_1 < point_2){
        text("2Pwin", 500, 400);
        img_B=loadImage(Bplayer+"sc.png");
        image(img_B, 100, 80, 250, 250);
      }
      if(point_1 == point_2){
        text("equal", 500, 400);
      }

      image(add, 600 - 10*x, 600, 200, 100);
      x++;
      if(x == 60 || x == -60){
        x *= -1;
      }
    }//pk score   
 











}

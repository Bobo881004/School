void setup(){
  size(800,600);
  background(42,82,190);
  strokeWeight(7);
  smooth();
  
  fill(255);
  rect(0,0,50,50);  //white
  
  fill(255,255,77);
  rect(0,50,50,50);  //yellow
  
  fill(0);
  rect(0,100,50,50);  //black
  
  fill(139,69,19);
  rect(0,150,50,50);  //brown
  
  fill(255,192,203);
  rect(0,200,50,50);  //pink
  
  fill(255);//right column
  rect(750,0,50,50);
  rect(750,50,50,50);
  rect(750,100,50,50);
  rect(750,150,50,50);
  rect(750,200,50,50);
  
  fill(0);
  textSize(15);
  text("Erase", 760, 30);
  text("Save", 760, 80);
  ellipse(775, 125, 5, 5);
  ellipse(775, 175, 15, 15);
  text("Clear", 760, 230);
}
void draw(){
  if ((mousePressed == true) && (mouseButton == LEFT)) {
    if(mouseX>60 && mouseX<740 && pmouseX>60 && pmouseX<740){
      line(mouseX, mouseY, pmouseX, pmouseY);
    }
    if(mouseX < 50 && mouseY < 50){
      stroke(255);
    }//white
    if(mouseX < 50 && mouseY > 50 && mouseY < 100){
      stroke(255,255,77);
    }//yellow
    if(mouseX < 50 && mouseY > 100 && mouseY < 150){
      stroke(0);
    }//black
    if(mouseX < 50 && mouseY > 150 && mouseY < 200){
      stroke(139,69,19);
    }//brown
    if(mouseX < 50 && mouseY > 200 && mouseY < 250){
      stroke(255,192,203);
    }//pink
    //end color
    
    if(mouseX > 750 && mouseY < 50){
      stroke(42,82,190);
    }//erase
    if(mouseX > 750 && mouseY > 50 && mouseY < 100){
      save("draw.jpg");
    }//save
    if(mouseX > 750 && mouseY > 100 && mouseY < 150){
      strokeWeight(5);
    }//small size
    if(mouseX > 750 && mouseY > 150 && mouseY < 200){
      strokeWeight(10);
    }//big size
    if(mouseX > 750 && mouseY > 200 && mouseY < 250){
      noStroke();
      fill(42,82,190);
      rect(60,0,680,740);
    }//clear
  }
}

PImage imgBasic,imgBG,imgBGl,imgBGr,imgCard,imgAccept,imgTitle;
  int Gamestate = 0,j;
void setup(){
  size(500,800);
  smooth();
  imgBasic = loadImage("C:\\Users\\NT2018\\Desktop\\project\\Photo\\basic.jpg");
  imgBG = loadImage("C:\\Users\\NT2018\\Desktop\\project\\Photo\\background.jpg");
  imgBGl = loadImage("C:\\Users\\NT2018\\Desktop\\project\\Photo\\backgroundleft.jpg");
  imgBGr = loadImage("C:\\Users\\NT2018\\Desktop\\project\\Photo\\backgroundright.jpg");
  imgCard = loadImage("C:\\Users\\NT2018\\Desktop\\project\\Photo\\card.jpg");
  imgAccept = loadImage("C:\\Users\\NT2018\\Desktop\\project\\Photo\\accept.jpg");
  imgTitle = loadImage("C:\\Users\\NT2018\\Desktop\\project\\Photo\\title.jpg");
}
void draw(){
	if(Gamestate == 0){
		image(imgBasic,0,0,500,800);
		if ((mousePressed == true) && (mouseButton == LEFT)) {
			if(mouseX >= 25 && mouseX <= 475 && mouseY >= 525 && mouseY <= 625){
				image(imgBG,0,0,500,800);
				image(imgCard,100,37,295,400);
				image(imgBGr,0,33,200,300);
				image(imgBGl,300,33,200,300);
				Gamestate = 1;
			}
		}
		j = 0;
	}
	if(Gamestate == 1){
		if (keyPressed == true){
			image(imgBG,0,0,500,800);
			if(key == 's'){				
				j +=  1;
				image(imgCard,100,37+10*j,295,400);
			}
				image(imgBGr,0,33,200,300);
				image(imgBGl,300,33,200,300);			
		}
		if(j > 36){
			Gamestate = 2;
		}
	}//control
	if(Gamestate == 2){
		
		background(255);
	}//card
}
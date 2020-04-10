int number;
int lessonrandom;
int point = 0;
PImage questionPicture;
PImage questionAnspicture;

char[] ChineseOfAnswer={'0','A','A','C','D','C','A','D','B','A','D'};
char[] MathOfAnswer ={'0','A','A','C','B','C','D','D','B','C','A'};
char[] NewsOfAnswer ={'0','B','B','C','D','D','D','C','A','B','B'};

void Question(){
  number = (int)random(1,11);
  lessonrandom = (int)random(1,4);
  // get Question
  /////////////////////////////
  if(lessonrandom == 1){
  	if(chinese[number] == 0){
  		questionPicture  =  loadImage("ch" + number + ".png");
    	image(questionPicture, 150, 350, 930, 450);//range need to erase
    	chinese[number] = 1;
  	}
  	else {
  		Question();
  	}
  }
  else if (lessonrandom == 2){
  	if(math[number] == 0){
  		questionPicture  =  loadImage("math" + number + ".png");
    	image(questionPicture, 150, 350, 930, 450);//range need to erase
  		math[number] = 1;
  	}
  	else {
  		Question();
  	}
  }
  else if(lessonrandom == 3){
  	if(news[number] == 0){
  		questionPicture  =  loadImage("news" + number + ".png");
    	image(questionPicture, 150, 350, 930, 450);//range need to erase
    	news[number] = 1;
  	}
  	else {
  		Question();
  	}
  }
  /////////////////////////////

}
int Check(char ans){
    point = 0;
    if(lessonrandom == 1){
      if(ans == ChineseOfAnswer[number]){
        point = 10;
      }
    }
    if(lessonrandom == 2){
      if(ans == MathOfAnswer[number]){
        point = 10;
      }
    }
    if(lessonrandom == 3){
      if(ans == NewsOfAnswer[number]){
        point = 10;
      }
    }       
    return point;   
}
void Answer(){
  if(lessonrandom == 1){
    questionPicture  =  loadImage("ch" + number + "ans.png");
    image(questionPicture, 150, 350, 930, 450);//range need to erase
  }

  else if (lessonrandom == 2){
    questionPicture  =  loadImage("math" + number + "ans.png");
    image(questionPicture, 150, 350, 930, 450);//range need to erase
  }

  else if(lessonrandom == 3){
    questionPicture  =  loadImage("news" + number + "ans.png");
    image(questionPicture, 150, 350, 930, 450);//range need to erase
  }
}

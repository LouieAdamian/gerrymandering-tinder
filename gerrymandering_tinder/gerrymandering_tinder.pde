
Boolean chatInactive = true;
void setup(){
  size(1080,1920);
  background(255,255,255);
}

void draw(){
mainUI();
topUI();
}

void topUI(){
  PImage chatButton;
  String activeInactive;
  if (chatInactive == true){
    activeInactive = "chat icon (inactive).png";
  }else{
    activeInactive = "chat icon (active).png";
  }
  chatButton = loadImage(activeInactive);
  int textSize =  48;
  int m = millis();
  m = m/1000;
  int timer = 30-m;


  stroke(255);
  fill(0,0,0,65);
  rect(-1,6,1082,115);
  stroke(255);
  fill(255,255,255,255);
  rect(0,0,1080,115);
  imageMode(CENTER);
  image(chatButton,1080-(1080/15),115/2);
  textSize(textSize);
  fill(0,0,0);
  if(timer <= 10){
    fill(235,87,87);
  }
  /*
  if(timer <= 0){
    timer = 0;
    chatInactive = false;
  }
  text(timer, 1080/15,(115/2)+(textSize/3));
  */
}

void mainUI(){
  background(246,247,251);
  PImage profile;
  profile = loadImage("profile.png");
  PImage like;
  like = loadImage("like icon.png");
  PImage dislike;
  dislike = loadImage("dislike icon.png");

  imageMode(CENTER);
  image(profile,1080/2,920);
  likeDislike(like,1080-(1080/4),1920-(1920/15));
  likeDislike(dislike,1080/4,1920-(1920/15));


}


void likeDislike(PImage imageName,float x,float y){
  ellipseMode(CENTER);
  fill(0,0,0,65);
  ellipse(x+5, y+10,160,160);
  fill(255,255,255);
  ellipse(x,y,160,160);
  image(imageName,x,y);
}


void allChats(){

}


void chatConcacts(String contanctName, String contactPhoto){

}


void chat(){

}
void chatConcacts(){

}
void keyPressed(){
  int keyIndex = -1;
  if( key == 'c'){
    chatInactive = false;
    allChats();
  }
}

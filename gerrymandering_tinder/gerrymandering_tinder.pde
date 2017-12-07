
Boolean chatInactive = true;
boolean boolLike = false;
boolean boolDislike = false;
int likeTimer = millis();
int oldLikeTimer = 0;
void setup(){
  Data.addDisctict("NC 12", "nc12.png");
  Data.addDisctict("FL 20", "");
  size(1080,1920);
  background(255,255,255);
}

void draw(){
mainUI();
topUI();
if(likeTimer-oldLikeTimer >= 500){
    boolLike = false;
    boolDislike = false;
    oldLikeTimer = likeTimer;
    
  }
}
void keyPressed(){
  int keyIndex = -1;
  if( key == 'w'){
    chatInactive = false;
    allChats();
  }
  if(key == 'a'){
    boolDislike = true;
    oldLikeTimer = likeTimer;
  }else{
   boolDislike = false; 
  }
  if(key == 'd'){
    boolLike = true;
    oldLikeTimer = likeTimer;
  }else{
    boolLike = false;
  } 
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
  
  if(timer <= 0){
    timer = 0;
  }
  text(timer, 1080/15,(115/2)+(textSize/3));
  
}

void mainUI(){
  background(246,247,251);
  PImage profile;
  profile = loadImage("profile.png");
  PImage like;
  like = loadImage("like icon.png");
  PImage dislike;
  dislike = loadImage("dislike icon.png");
<<<<<<< HEAD
  int profileX = 1080/2;
  int profileY = 920;
  
  if(boolLike == true){
    for(int i = 0; i<1080/2; i = i+1){
      profileX = profileX+1;
    }
  }
  if(boolDislike == true){
    for(int i = 0; i<1080/2; i = i+1){
      profileX = profileX-1;
    }
  }
  
  
  imageMode(CENTER);
  image(profile,profileX,profileY);
  likeDislike(like,1080-(1080/4),1920-(1920/15), boolLike);
  likeDislike(dislike,1080/4,1920-(1920/15), boolDislike);
  
}


void likeDislike(PImage imageName,float x,float y){

  ellipseMode(CENTER);
  fill(0,0,0,65);
  ellipse(x+5, y+10,across,up);
  fill(255,255,255);
  ellipse(x,y,across,up);
  image(imageName,x,y,across2,up2);
}


void allChats(){

}


void chatConcacts(String contanctName, String contactPhoto){

}


void chat(){
  
}

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
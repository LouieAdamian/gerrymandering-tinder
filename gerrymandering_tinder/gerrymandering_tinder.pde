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
  chatButton = loadImage("chat icon (inactive).png");
  int timer = 0;

  stroke(255);
  fill(0,0,0,65);
  rect(-1,4,1082,115);
  stroke(255);
  fill(255,255,255,255);
  rect(0,0,1080,115);
  imageMode(CENTER);
  image(chatButton,1080-(1080/15),115/2);
  textSize(32);
  text( timer, 100,100);
  
}

void mainUI(){
  background(246,247,251);
  

}

void allChats(){

}

void chatConcacts(String contanctName, String contactPhoto){
  
}
void chat(){
  
}
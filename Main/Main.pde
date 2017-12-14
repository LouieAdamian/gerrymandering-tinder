boolean chatInactive = true; // activates swtich to chat page
boolean boolLike = false; // makes like button smaller
boolean boolDislike = false; // makes dislike button smaller
int  likeTimer, likeCounter, dislikeCounter, switchPageCounter, lastMatch;
int oldLikeTimer = 0, timerReset = 0, timerTime = 12;
int profileX;
public static int dialogue1Counter, dialogue2Counter, dialogue3Counter;
int profileY;
boolean isOnMainPage = true;
int timer = timerTime;
int i;
void setup() {
  size(1080, 1920);
  background(255, 255, 255);
  //Chat chat =  new Chat();
}

void draw() {
  if (isOnMainPage == true) {
    pullupMainUI();
  } else {
    chat();
  }
  keyPressed();
  HandleTimer();

  likeTimer = millis();
  if (likeTimer-oldLikeTimer >= 50) {
    boolLike = false;
    boolDislike = false;
    oldLikeTimer = likeTimer;
  }
}

void pullupMainUI() {
  mainUI();
  topUI();
}

void resetTimer() {
  timerReset = millis();
  timerReset = timerReset/1000;
}

void keyPressed() {
  int keyIndex = -1;
  if (!keyPressed) {
    return;
  }
  if ( key == 'w') {
    if (isOnMainPage) {
      if(likeCounter < 99){
      likeCounter++;
    }
    } else {
      if(switchPageCounter < 99){
      switchPageCounter++;
    }
    }
  }
  if (key == 'a') {
    if (isOnMainPage) {
      if(dislikeCounter < 99){
      dislikeCounter++;
    }
    } else {
      if(dialogue1Counter < 99){
      dialogue1Counter++;
    }
    }
  }
  if (key == 'd')
  {
    if (isOnMainPage) {
if(likeCounter < 99){
      likeCounter++;
    }
    } else {
      if(dialogue1Counter < 99){
      dialogue3Counter++;
    }
    }
  }
  if (key == 's') {
    if (isOnMainPage) {
      if(dislikeCounter < 99){
      dislikeCounter++;
    }
    } else {
      if(dialogue2Counter < 99){
      dialogue2Counter++;
    }
    }
  }
}
void topUI() {
  PImage chatButton;
  chatButton = loadImage("chat icon (inactive).png");
  int textSize =  48;
  stroke(255);
  fill(0, 0, 0, 65);
  rect(-1, 6, 1082, 115);
  stroke(255);
  fill(255, 255, 255, 255);
  rect(0, 0, 1080, 115);
  imageMode(CENTER);
  image(chatButton, 1080-(1080/9), 115/2);
  textSize(textSize);
  fill(0, 0, 0);
  if (timer <= 10)
  {
    fill(235, 87, 87);
  }
  text(timer, 1080/15, (115/2)+(textSize/3));
  fill(196, 196, 196);
  //text(switchPageCounter, (1080-1080/15), (115/2)+(50));
  int keyIndex = -1;
}
void mainUI() {
  background(246, 247, 251);
  PImage profile;
  profile = loadImage("profile.png");
  PImage like;
  like = loadImage("like icon.png");
  PImage dislike;
  dislike = loadImage("dislike icon.png");




  imageMode(CENTER);
  image(profile, profileX, profileY);
  likeDislike(like, 1080-(1080/4), 1920-(1920/15), boolLike);
  likeDislike(dislike, 1080/4, 1920-(1920/15), boolDislike);
  textSize(48);
  fill(39, 174, 96);
  text(likeCounter, (1080-1080/4)+80, (1920-1920/15)+(100));
  fill(255, 0, 0);
  text(dislikeCounter, (1080/4)+80, (1920-1920/15)+(100));

  HandleTimer();
  //      voting(likeCounter, dislikeCounter, switchPageCounter, likeFunction, dislikeFunction, chatInactive);
}
void DoLike() {
  isOnMainPage = false;
  // Go to the chat page! TODO

  boolLike = true;
  oldLikeTimer = likeTimer;
}
void DoDislike() {
  isOnMainPage = true;
  boolDislike = true;
  oldLikeTimer = likeTimer;
for(int i = 0; i < 1080/4; i++){
profileX--;

}
}
void likeDislike(PImage imageName, float x, float y, boolean pressed) {
  int across = 160;
  int up = 160;
  int across2 = 100;
  int up2 = 100;
  if (pressed == true) {
    across = across-across/4;
    up = up-up/4;
    across2 = across2-across2/4;
    up2 = up2-up2/4;
  } else {
    across = 160;
    up = 160;
    across2 = 100;
    up2 = 100;
  }

  ellipseMode(CENTER);
  fill(0, 0, 0, 65);
  ellipse(x+5, y+10, across, up);
  fill(255, 255, 255);
  ellipse(x, y, across, up);
  image(imageName, x, y, across2, up2);
}

void chat() {
  background(246, 247, 251);
  chatTopUI();
 // chat.questionUI();
}


void HandleTimer()
{
  int totalVotes = likeCounter + dislikeCounter + switchPageCounter + dialogue1Counter + dialogue2Counter + dialogue3Counter;

  if (totalVotes <= 3)
  {
    resetTimer();
    return;
  }

  int m = millis();
  m = m/1000;
  m = m-timerReset;
  timer = timerTime-m;
  // Ten seconds or under, color it red.


  if (timer <= 0)
  {
    ResolveVote();
  }
}

void ResolveVote()
{
  int totalVotes = likeCounter + dislikeCounter + switchPageCounter + dialogue1Counter + dialogue2Counter + dialogue3Counter;

  if (totalVotes <= 3)
  {
    return;
  }
  int[] votes = new int[] {switchPageCounter, dialogue1Counter, dialogue2Counter, dialogue3Counter, likeCounter, dislikeCounter};
  // Get the maximum vote.
  int max = votes[0];
  for (int i = 1; i < votes.length; i++) {
    if (votes[i] > max) {
      max = votes[i];
    }

    if (max == likeCounter) {
      DoLike();
      println("liked");
    } else if (max == dislikeCounter) {
      DoDislike();
      println("disliked");
    }
    if (max == switchPageCounter) {
      isOnMainPage = true;
    }
  }
  likeCounter = 0;
  dislikeCounter = 0;
  switchPageCounter = 0;
  dialogue1Counter = 0;
  dialogue2Counter = 0;
  dialogue3Counter = 0;
  timer = timerTime;
}
void chatTopUI() {
  PImage chatButton;
  chatButton = loadImage("chat icon (active).png");
int textSize =  48;
stroke(255);
fill(0, 0, 0, 65);
rect(-1, 6, 1082, 115);
stroke(255);
fill(255, 255, 255, 255);
rect(0, 0, 1080, 115);
imageMode(CENTER);
image(chatButton, 1080-(1080/9), 115/2);
textSize(textSize);
fill(0, 0, 0);
if (timer <= 10)
{
  fill(235, 87, 87);
}
text(timer, 1080/15, (115/2)+(textSize/3));
fill(196, 196, 196);
text(switchPageCounter, (1080-1080/15), (115/2)+(50));
int keyIndex = -1;

}

void populate() {
  Data.addDisctict("NC 13", "profile.png", "hey lil mamma lemme wisper in your ear","you're thiccc","How U dooin?");
  //Data.addDisctict("FL 22", "",);
  //Data.addDisctict("PA ??", );


}
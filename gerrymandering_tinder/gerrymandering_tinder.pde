boolean chatInactive = true; // activates swtich to chat page
boolean boolLike = false; // makes like button smaller
boolean boolDislike = false; // makes dislike button smaller
int  likeTimer, likeCounter, dislikeCounter, switchPageCounter, dialogue1Counter, dialogue2Counter, dialogue3Counter, lastMatch;
int oldLikeTimer = 0;
int timerReset = 0;
int timerTime = 12;
int profileX;
int profileY;
boolean isOnMainPage = true;
int timer = timerTime;
void setup() {
  
  size(1080, 1920);
  background(255, 255, 255);
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
  text(switchPageCounter, (1080-1080/15), (115/2)+(50));
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

  profileX = 1080/2;
  profileY = 920;


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
  for (int i = 0; i<1080/2; i = i+1) {
    profileX = profileX+1;
  }
}
void DoDislike() {
  isOnMainPage = true;
  boolDislike = true;
  oldLikeTimer = likeTimer;

  // Go to the next profile. TODO

  for (int i = 0; i<1080/2; i = i+1) {
    profileX = profileX-1;
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
  // TODO

  // Reset the votes.
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

/*void voting(int voteCase1, int voteCase2, int voteCase3, void voteCase1Function, void voteCase2Function, boolean voteCase3Bool) {
 // Set the max to 99, purely for formatting reasons.
 if (voteCase1 >= 99) {
 voteCase1 = 99;
 }
 if (voteCase2 >= 99) {
 voteCase2 = 99;
 }
 if (voteCase3 >= 99) {
 voteCase3 = 99;
 }

 // On the main page, this equals likes + dislikes.
 int voteCount = voteCase1+voteCase2+voteCase3;

 // Make sure the timer doesn't start counting down until there are at least 3 votes.
 if (voteCount <= 3 || timer <= 0) {
 // Pause the timer.
 timerReset = millis();
 timerReset = timerReset/1000;
 }
 else if (voteCount > 3) {
 // Count down.
 int m = millis();
 m = m/1000;
 m = m-timerReset;
 timer = timerTime-m;
 }
 else {
 // Reset the timer.
 timer = timerTime;
 }

 // When countdown is 10 or under, turn the timer red.
 if (timer <= 10) {
 fill(235, 87, 87);
 }
 // At 0, execute the function with the most votes.
 if (timer <= 0) {
 timer = millis();
 // Handle tie-breaking.a
 if (voteCase3 == voteCase1 || voteCase3 == voteCase2 || voteCase2 == voteCase1) {
 float random = random(1, 3);
 if (random <= 1) {
 voteCase1++;
 }
 if (random <= 2 && random > 1) {
 voteCase2++;
 }
 if (random <= 3 && random > 2) {
 voteCase3++;
 }
 }
 // First vote wins.
 if (voteCase1 > voteCase2 && voteCase1 > voteCase3) {

 resetTimer();
 }
 // Second vote wins.
 if (voteCase2 > voteCase1 && voteCase2 > voteCase3) {
 voteCase2Bool = !voteCase2Bool;
 resetTimer();
 }
 // Third vote wins.
 if (switchPageCounter > likeCounter && switchPageCounter > dislikeCounter) {
 voteCase3Bool = !voteCase3Bool;
 resetTimer();
 }
 }
 }*/

void populate() {
  // addDisctict("NC 13", "profile.png", )
}
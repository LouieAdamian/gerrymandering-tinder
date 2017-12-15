boolean chatInactive = true; // activates swtich to chat page
boolean boolLike = false; // makes like button smaller
boolean boolDislike = false; // makes dislike button smaller
int  likeTimer, likeCounter, dislikeCounter, switchPageCounter, lastMatch;
public static int  dialogue1Counter, dialogue2Counter;
int oldLikeTimer = 0;
int timerReset = 0;
int timerTime = 2;
int profileX = 1080/2;
int profileY = 920;
boolean isOnMainPage = true;
int timer = timerTime;
int i, currDistrict;
Chat chat =  new Chat(this);

static int DIALOG_VOTE_MSG0 = 0;
static int DIALOG_VOTE_MSG1 = 1;
static int DIALOG_VOTE_NONE = 2;
int dialogVoteResult = DIALOG_VOTE_NONE;

void setup() {
  size(1080, 1920);
  background(255, 255, 255);
  // populate districts
  populate();
  // choose a district
  currDistrict = round(random(0, 2));
}

void draw() {
  if (isOnMainPage == true) {
    pullupMainUI();
    dialogVoteResult  = DIALOG_VOTE_NONE;
  } else {
    chat();
  }

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
  if ( key == 'w' || key == 'W') {
    if (isOnMainPage) {
      if (likeCounter < 99) {
        likeCounter++;
      }
    } else {
      if (switchPageCounter < 99) {
        switchPageCounter++;
      }
    }
  }
  if (key == 'a' || key == 'A') {
    if (isOnMainPage) {
      if (dislikeCounter < 99) {
        dislikeCounter++;
      }
    } else {
      if (dialogue1Counter < 99) {
        dialogue1Counter++;
      }
    }
  }
  if (key == 'd' || key == 'D')
  {
    if (isOnMainPage) {
      if (likeCounter < 99) {
        likeCounter++;
      }
    } else {
      if (dialogue1Counter < 99) {
        // dialogue3Counter++;
      }
    }
  }
  if (key == 's') {
    if (isOnMainPage) {
      if (dislikeCounter < 99) {
        dislikeCounter++;
      }
    } else {
      if (dialogue2Counter < 99) {
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
  String path = Data.districts.get(currDistrict).photo;
  //String path = Data.districs[0].photo;
  profile = loadImage(path);
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

 // HandleTimer();
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
  // change district
  int tempDistrict;
  do{
    tempDistrict = round(random(0, 2));
  }while(tempDistrict == currDistrict);
  currDistrict = tempDistrict;
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
  chat.questionUI();
  println(dialogVoteResult);
  if(dialogVoteResult == DIALOG_VOTE_MSG0){
    message(0);
    //fill(255,0,0); // DWDEBUG
    //rect(200,200,400,400); // DWDEBUG
  }else if(dialogVoteResult == DIALOG_VOTE_MSG1){
    message(1);
    //fill(0,255,0);// DWDEBUG
    //rect(200,200,400,400);// DWDEBUG
  }
}


void HandleTimer()
{
  int totalVotes = likeCounter + dislikeCounter + switchPageCounter + dialogue1Counter + dialogue2Counter;

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
  int totalVotes = likeCounter + dislikeCounter + switchPageCounter + dialogue1Counter + dialogue2Counter;

  if (totalVotes <= 3)
  {
    return;
  }
  int[] votes = new int[] {switchPageCounter, dialogue1Counter, dialogue2Counter, likeCounter, dislikeCounter};
  // Get the maximum vote.
  int max = votes[0];
  for (int i = 1; i < votes.length; i++) {
    if (votes[i] > max) {
      max = votes[i];
    }
  }
  if (max == likeCounter) {
    DoLike();
    println("liked");
  } else if (max == dislikeCounter) {
    DoDislike();
    println("disliked");
  }
  if (max == switchPageCounter) {
    println("switchPageCounter");
    isOnMainPage = true;
  }
  if (max == dialogue1Counter) {
    println("dialogue1Counter");
    dialogVoteResult = DIALOG_VOTE_MSG0;
  }
  if (max == dialogue2Counter) {
    println("dialogue2Counter");
    dialogVoteResult = DIALOG_VOTE_MSG1;
  }

  likeCounter = 0;
  dislikeCounter = 0;
  switchPageCounter = 0;
  dialogue1Counter = 0;
  dialogue2Counter = 0;
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
  text(Data.districts.get(currDistrict).name, 150, 75);
  fill(196, 196, 196);
  text(switchPageCounter, (1080-1080/15), (115/2)+(50));
  int keyIndex = -1;
}

void populate() {
  //Data.addDisctict("NC 13", "profile.png", "Democrats, people living in major cities","I am a democratic majority distict");
  //Data.addDisctict("MD 3", "profile.png", "Democrats, and people living in major cities","I am a democratic majority district");
  //Data.addDisctict("PA 7", "profile.png", "Republicans, and people living in major cities","I am a republican majority district");
  Data.addDistrict("NC 12", "NC 12.png", "Democrats, people living in major cities", "I am a democratic majority distict");
  Data.addDistrict("MD 3", "MD 3.png", "Democrats, and people living in major cities", "I am a democratic majority district");
  Data.addDistrict("PA 7", "PA 7.png", "Republicans, and people living in major cities", "I am a republican majority district");
}

void message(int message) {
  chat.chatBubble(Data.questions[message], false);
  chat.chatBubble(Data.districts.get(currDistrict).conversation.get(Data.questions[message]), true);
}
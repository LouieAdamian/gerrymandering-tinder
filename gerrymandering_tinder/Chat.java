
public class Chat{
 private int messageCount;
  public void chatUI(){
    questionUI();

  }
  public void chatBubble(String chatMessage, boolean received){
    int xVal, bottomRightFillet, bottomLeftFillet;
    if (received){
      xVal = 26;
      bottomRightFillet = 20;
      bottomLeftFillet = 80;
    } else {
      //xVal = 1054 -//width of box
      bottomLeftFillet = 20;
      bottomRightFillet = 80;
    }
    //rect(410, 292 * messageCount + 242, );
    messageCount++;
  }
  void questionUI(){

  }


}
import java.awt.Font;
import java.awt.FontMetrics;

public class Chat {
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

  public void questionUI(){
    // PImage sendIcon;
    // sendIcon = loadImage("/icons/sendArrow.png");
    // rect(26,1437,1020,460,80);
    // line(26, 1741, 1046, 1741);
    // line(26, 1600, 1046, 1600);
    // // text(, 800, 1477);
    // // text(, 800, 1616);
    // // text(, 800, 1770);
    // text(Data.questions[0], 78, 1477);
    // text(Data.questions[1], 78, 1616);
    // text(Data.questions[2], 78, 1770);
    // image(sendIcon, 906, 1787);
  }


}
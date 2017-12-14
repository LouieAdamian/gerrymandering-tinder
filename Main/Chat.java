import java.awt.Font;
import java.awt.FontMetrics;
import processing.core.*;
import java.lang.Math;
public class Chat {
  PApplet p;
  private int messageCount;
  public void chatUI(){
    questionUI();

  }
  Chat(PApplet p){
    this.p = p;
  }
  public void chatBubble(String chatMessage, boolean received){
    int bottomRightFillet, bottomLeftFillet;
    float chatWidth, xVal;

    chatWidth = p.textWidth(chatMessage);
    if (received){
      xVal = 26;
      bottomRightFillet = 20;
      bottomLeftFillet = 80;
    } else {
      xVal = 1054 -chatWidth;
      bottomLeftFillet = 20;
      bottomRightFillet = 80;
    }
    p.rect(410f, 292f * messageCount + 242f, chatWidth +100, 100f);
    messageCount++;
  }

  public void questionUI(){
    PImage sendIcon;
    sendIcon = p.loadImage("/icons/sendArrow.png");
    p.rect(26,1437,1020,460,80);
    p.line(26, 1741, 1046, 1741);
    p.line(26, 1600, 1046, 1600);
    p.text(main.dialog1Counter, 800, 1477);
    p.text(dialog2Counter, 800, 1616);
    p.text(dialog3Counter, 800, 1770);
    p.text(Data.questions[0], 78, 1477);
    p.text(Data.questions[1], 78, 1616);
    p.text(Data.questions[2], 78, 1770);
    p.image(sendIcon, 906, 1787);
  }
}

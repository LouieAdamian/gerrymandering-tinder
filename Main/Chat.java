import java.awt.Font;
import java.awt.FontMetrics;
import processing.core.*;
import java.lang.Math;
public class Chat {
  PApplet p;
  private int messageCount = 0;
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
    float leftx = 410f;
    float lefty = 292f*messageCount+ 242f;
    System.out.println(leftx + " " + lefty);
    
    p.fill(217,217,217);
    p.rect(leftx, lefty , chatWidth+100, 100f,80,80, bottomRightFillet, bottomLeftFillet);
    p.fill(255,255,255);
    p.text(chatMessage, leftx, lefty+55);
//    messageCount++;
  }

  public void questionUI(){
    PImage sendIcon;
    sendIcon = p.loadImage("sendArrow.png");
    p.fill(217,217,217);
    p.rect(26,1547,1020,350,80);
    p.fill(255,255,255);
    p.line(26, 1722, 1046, 1722);
    p.text(Main.dialogue1Counter, 800, 1677);
    p.text(Main.dialogue2Counter, 800, 1836);
    p.text(Data.questions[0], 78, 1677);
    p.text(Data.questions[1], 78, 1836);
    p.image(sendIcon, 906, 1787);
  }
}
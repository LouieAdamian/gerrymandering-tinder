import java.util.ArrayList;
import java.util.HashMap;

class District{
  public String[] dialogueInput;
  public HashMap conversation;
  public String name, photo;
  public boolean matched;
<<<<<<< HEAD
  public District(String name, boolean matched, String photo, HashMap conversation){
=======
  District(String name, boolean matched, String photo){
>>>>>>> 57a3ff017e441f4719c3fa59b5dfe2e97a303f87
    this.name = name;
    this.matched = matched;
    this.photo = photo;
    this.conversation = conversation;
  }
}
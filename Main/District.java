import java.util.ArrayList;
import java.util.HashMap;

class District{
  public String[] dialogueInput;
  public HashMap conversation;
  public String name, photo;
  public boolean matched;
  public District(String name, boolean matched, String photo, HashMap conversation){
    this.name = name;
    this.matched = matched;
    this.photo = photo;
    this.conversation = conversation;
  }
}

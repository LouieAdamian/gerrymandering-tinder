import java.util.ArrayList;
import java.util.HashMap;

class District{
  public String[] dialogueInput;
  public HashMap<String,String> conversation;
  public String name, photo;
  public boolean matched;
  public District(String name, boolean matched, String photo, HashMap<String,String> conversation){
    this.name = name;
    this.matched = matched;
    this.photo = photo;
    this.conversation = conversation;
  }
}
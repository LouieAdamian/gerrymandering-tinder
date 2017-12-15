import java.util.ArrayList;
import java.util.HashMap;
public class Data {
  public static ArrayList<District> districts = new ArrayList<District>();
  public static String[] questions = {"Who do you misrepresent?", "what majority party are you?"};

    public static void addDisctict(String name,String photo, final String answer0, final String answer1){
      Data.districts.add(new District(name, false, photo, new HashMap<String,String>(){
      {
        put(questions[0], answer0);
        put(questions[1], answer1);
        };
      }));
    }
}

import java.util.ArrayList;
import java.util.HashMap;
public class Data {
public static ArrayList<Object> districts = new ArrayList<Object>();
public static String[] questions = {"That's the longest district I've ever seen.", "I like that disenfranchisement on you.", "TODO"};




  public static void addDisctict(String name,String photo, final String answer0, final String answer1, final String answer2){
    Data.districts.add(new District(name, false, photo, new HashMap<String,String>(){
                        {/*
                                put(questions[0], answer0);
                                put(questions[1], answer1);
                                put(questions[2], answer2);
                        */};
                      }
                      )
                      );
  }
}
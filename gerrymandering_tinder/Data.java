import java.util.ArrayList;
import java.util.HashMap;
public class Data{
  public static ArrayList<Object> districts = new ArrayList<Object>();



  //void addDisctict(String name,String photo){
      //Data.districts.add(new District(name, false, photo));
  void addDisctict(String name,String photo, HashMap conversation){
      Data.districts.add(new District(name, false, photo, conversation));
  }
}
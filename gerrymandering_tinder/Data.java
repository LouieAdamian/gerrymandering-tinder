import java.util.ArrayList;
import java.java.util.HashMap;
public class Data{
  public static ArrayList<Object> districts = new ArrayList<Object>();



<<<<<<< HEAD
  void addDisctict(String name,String photo){
      //Data.districts.add(new District(name, false, photo));
=======
  void addDisctict(String name,String photo, HashMap conversation){
      Data.districts.add(new District(name, false, photo, conversation));
>>>>>>> d6bc200b63e600109be0638723af4b48f4040118
  }
}
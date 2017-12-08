import java.util.ArrayList;
import java.util.HashMap;
public class Data{
  public static ArrayList<Object> districts = new ArrayList<Object>();



<<<<<<< HEAD
  //void addDisctict(String name,String photo){
      //Data.districts.add(new District(name, false, photo));
=======

>>>>>>> e36ca9659c2c3e71ff73e2fcddd22e71e478754d
  void addDisctict(String name,String photo, HashMap conversation){
      Data.districts.add(new District(name, false, photo, conversation));
  }
}

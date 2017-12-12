import java.lang.*;
import java.net.URL;

public class ClassLoaderDemo {

   public static void main(String[] args) throws Exception {
     
      Class cls = Class.forName("ClassLoaderDemo");

      // returns the ClassLoader object associated with this Class
      ClassLoader cLoader = cls.getClassLoader();
    
      System.out.println(cLoader.getClass());
    
      // finds resource
      URL url = cLoader.getSystemResource("file.txt");
      System.out.println("Value = " + url);

      // finds resource
      url = cLoader.getSystemResource("newfolder/a.txt");
      System.out.println("Value = " + url);  
   }
} 

import toxi.geom.*;
import toxi.physics2d.*;
import toxi.physics2d.behaviors.*;
import java.util.ArrayList;

Scene office;

void setup () {
  size (640, 360);
  office = new OfficeScene();
}

void draw () {
  background (255);  
  office.update ();
  office.display();

}






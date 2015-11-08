import toxi.geom.*;
import toxi.physics2d.*;
import toxi.physics2d.behaviors.*;
import java.util.ArrayList;

OfficeScene office;
OfficeNode offnode;
void setup () 
{
  size (540, 460, P2D);
  // OfficeScene is the first level
  office = new OfficeScene();
}

void draw () 
{
  background (255);  
  office.update ();
  print("height : "+height +", x : "+mouseX+", y : "+mouseY+"\n");

  // method comes from OfficeScene parent class Scene
  office.display();
}



import toxi.geom.*;
import toxi.processing.*;
import toxi.physics2d.*;
import toxi.physics2d.behaviors.*;
import java.util.ArrayList;

ToxiclibsSupport gfx;
OfficeScene office;
ArrayList<ParticleSystem> systems;

void setup () 
{
  size (540, 460, P2D);
  // OfficeScene is the first level
  office = new OfficeScene();
  gfx = new ToxiclibsSupport(this);
  systems = new ArrayList<ParticleSystem>();
}

void draw () 
{
  print("height : "+height +", x : "+mouseX+", y : "+mouseY+"\n");
  office.update ();
  // method comes from OfficeScene parent class Scene
  office.display();
  
  for (ParticleSystem ps: systems) {
    ps.run();
    ps.addParticle(); 
  }
  
}



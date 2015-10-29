import toxi.geom.*;
import toxi.physics2d.*;
import toxi.physics2d.behaviors.*;

ArrayList<Player> players;
Attractor attractor;

VerletPhysics2D physics;

void setup () {
  size (640, 360);
  physics = new VerletPhysics2D ();
  physics.setDrag (0.01);
  
  players = new ArrayList<Player>();
  for (int i = 0; i < 50; i++) {
    players.add(new Player(new Vec2D(random(width),random(height))));
  }
  
  attractor = new Attractor(new Vec2D(width/2,height/2));
}


void draw () {
  background (255);  
  physics.update ();

  attractor.display();
  for (Player p: players) {
    p.display();
  }
  
  if (mousePressed) {
    attractor.lock();
    attractor.set(mouseX,mouseY);
  } else {
    attractor.unlock();
  }
}


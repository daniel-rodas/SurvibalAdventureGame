import shiffman.box2d.*;
import org.jbox2d.common.*;
import org.jbox2d.dynamics.joints.*;
import org.jbox2d.collision.shapes.*;
import org.jbox2d.collision.shapes.Shape;
import org.jbox2d.common.*;
import org.jbox2d.dynamics.*;
import org.jbox2d.dynamics.contacts.*;
import org.jbox2d.dynamics.contacts.Contact;
import org.jbox2d.dynamics.BodyType;


import java.util.Iterator;
import java.util.List;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;
import java.util.Set;


OfficeScene office;
//HallwayScene hallway;
Scene activeScene;
// Verlet physics world
//Vec2 physics;
Vec2 origin, mouse;
Debug de;
// A reference to our box2d world
Box2DProcessing box2d;

void setup() 
{
  // for debugger make screen twice as wide
  size (1024, 768);
  //  size (540, 460, P2D);
  //  de = new Debug(true);
  // Initialize box2d physics and create the world
  box2d = new Box2DProcessing(this);
  box2d.createWorld();
  // Turn on collision listening!
  box2d.listenForCollisions();
  /* OfficeScene is the first level */
  office = new OfficeScene();
  activeScene = office;

  de = new Debug();
}

void draw() 
{
  mouse = new Vec2(mouseX, mouseY);
  //  de.add("mouse", mouse);
  //  de.add("activeScene", activeScene);
  activeScene.update();
  // method comes from OfficeScene parent class Scene
  activeScene.display();
  activeScene.shakeButton();
  de.display();
}


// Collision event functions!
public void beginContact(Contact cp)
{
  // Get both fixtures
  Fixture f1 = cp.getFixtureA();
  Fixture f2 = cp.getFixtureB();
  // Get both bodies
  Body b1 = f1.getBody();
  Body b2 = f2.getBody();

  // Get our objects that reference these bodies
  Object o1 = b1.getUserData();
  Object o2 = b2.getUserData();

  if (o1.getClass() == Node.class && o2.getClass() == Node.class) {
    Node p1 = (Node) o1;
    p1.change();
    Node p2 = (Node) o2;
    p2.change();
  }
}

// Objects stop touching each other
void endContact(Contact cp) 
{
}


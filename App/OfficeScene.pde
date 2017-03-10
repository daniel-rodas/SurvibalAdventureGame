public class OfficeScene extends GamePlayScene 
{
  // office nodes will have shake behavior
  ArrayList<OfficeNode> officeNodes;
  Desk deskOne;
  Desk deskTwo;
  Door doorOne;
  Door doorTwo;
  // office nodes will have shake behavior
  ArrayList<Platform> platforms;
  Staircase stairsOne;
  Staircase stairsTwo;
  Platform platformOne;
  Platform platformTwo;
  Platform platformThree;
  Platform platformFour;
  Platform platformFive;
  HallwayScene hallway;

  OfficeScene()
  {
    super();
  }

  public void display()
  {
    super.display();
  }
  
  void setupBoundaries()
  {
    super.setupBoundaries();
    /* Add a bunch of fixed boundaries */
    boundaries.add(new Platform(width, height-115, width/2-50, 20));
    boundaries.add(new Platform(100, height-35, 150, 30));
  }
}


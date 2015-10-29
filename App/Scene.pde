public abstract class Scene 
{

  private ArrayList nodes;

  private ViewBox viewbox;

//  public Color setBackgroundColor(Color c) {
//    throw new UnsupportedOperationException("Not supported yet.");
//  }

  public SceneLayer addSceneLayer(SceneLayer l) {
    throw new UnsupportedOperationException("Not supported yet.");
  }

  public Player addPlayer(Player p) {
    throw new UnsupportedOperationException("Not supported yet.");
  }

  public Boundry addBoundry(Boundry b) {
    throw new UnsupportedOperationException("Not supported yet.");
  }

  public Node addInteractor(Node n) {
    throw new UnsupportedOperationException("Not supported yet.");
  }

  public void setViewBox(float _x, float _y, float _w, float _h) {
  }

//  public void addLevelLayer(String name, ScenelLayer layer) {
//  }

  public void cleanUp() {
  }
}


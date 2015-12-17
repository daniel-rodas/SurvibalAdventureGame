class Platform extends Boundary
{
  Platform (float x_,float y_, float w_, float h_)
  {
    super(x_,y_,w_,h_);
  }
  void display()
  {
    pushStyle();
    fill(255, 180, 20);
    rect(x, y, w, h);
    popStyle();
  }

}


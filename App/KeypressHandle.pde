public class KeypressHandle
{
  Node node;
  State active;

  KeypressHandle( Node n )
  {
    node = n;
    active = n.state;
  }

  // ====== KEY HANDLING ======

  // check whether a key is pressed or not
  public boolean isKeyDown(char k) 
  {
    if (keyPressed)
    {
      if ( (key == Character.toUpperCase(k)) || (key == Character.toLowerCase(k)) )
      {
        return true;
      }
    }
    return false;
  }
}


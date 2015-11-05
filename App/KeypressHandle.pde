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

  public final boolean[] locked = new boolean[256];
  public final boolean[] keyDown = new boolean[256];
  public int[] keyCodes = {
  };

  // if pressed, and part of our known keyset, mark key as "down"
  public void setIfTrue(int mark, int target) {
    if (!locked[target]) {
      if (mark==target) {
        keyDown[target] = true;
      }
    }
  }

  // if released, and part of our known keyset, mark key as "released"
  public void unsetIfTrue(int mark, int target) {
    if (mark==target) {
      locked[target] = false;
      keyDown[target] = false;
    }
  }

  // lock a key so that it cannot be triggered repeatedly
  public void ignore(char key) {
    int keyCode = int(key);
    locked[keyCode] = true;
    keyDown[keyCode] = false;
  }

  // add a key listener
  public void handleKey(char key) 
  {
    
    int keyCode = int(key), 
    len = keyCodes.length;
    print("handleKey : " + key + ", KeyCode : " + keyCode + " \n");
    int[] _tmp = new int[len+1];
    arrayCopy(keyCodes, 0, _tmp, 0, len);
    _tmp[len] = keyCode;
    keyCodes = _tmp;
  }

  // check whether a key is pressed or not
  public boolean isKeyDown(char key) 
  {
    print("Testing Key " + key + " \n" );
    int keyCode = int(key);
    return keyDown[keyCode];
  }

  public boolean noKeysDown() {
    for (boolean b : keyDown) { 
      if (b) return false;
    }
    for (boolean b : locked) { 
      if (b) return false;
    }
    return true;
  }
  
  
  /**
   * Does the indicated x/y coordinate fall inside this drawable thing's region?
   */
  boolean over(float _x, float _y) {
    if (active == null) return false;
    return active.over(_x - getX(), _y - getY());
  }
}


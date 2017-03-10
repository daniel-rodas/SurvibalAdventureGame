public class KeypressHandle
{
  // ====== KEY HANDLING ======

  protected boolean[] locked = new boolean[256];
  protected boolean[] keyDown = new boolean[256];
  protected int[] keyCodes = {
  };

  Node node;
  State active;

  KeypressHandle( Node n )
  {
    node = n;
    active = n.getState();
  }

  // if pressed, and part of our known keyset, mark key as "down"
  private void setIfTrue(int mark, int target) 
  {
    if (!locked[target]) {
      if (mark==target) {
        keyDown[target] = true;
      }
    }
  }

  // if released, and part of our known keyset, mark key as "released"
  private void unsetIfTrue(int mark, int target) {
    if (mark==target) {
      locked[target] = false;
      keyDown[target] = false;
    }
  }

  // lock a key so that it cannot be triggered repeatedly
  protected void ignore(char key) {
    int keyCode = int(key);
    locked[keyCode] = true;
    keyDown[keyCode] = false;
  }

  // add a key listener
  void handleKey(char key) {
    int keyCode = int(key), 
    len = keyCodes.length;
    int[] _tmp = new int[len+1];
    arrayCopy(keyCodes, 0, _tmp, 0, len);
    _tmp[len] = keyCode;
    keyCodes = _tmp;
  }

  boolean isKeyDown(char k) 
  {
    /*
    int keyCode = int(key);
    println("key", key);
    return keyDown[keyCode];
    */
    if (keyPressed)
    {
      if ( (key == Character.toUpperCase(k)) || (key == Character.toLowerCase(k)) )
      {
        int keyCode = int(key);
        setIfTrue(keyCode, keyCode);
        return true;
      }
    }
    return false;
  }
  
  protected boolean noKeysDown() {
    for (boolean b : keyDown) { 
      if (b) return false;
    }
    for (boolean b : locked) { 
      if (b) return false;
    }
    return true;
  }

}


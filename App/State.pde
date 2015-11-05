public abstract class State 
{
  /**
   * A sprite state is mostly a thin wrapper
   */

  String name;
  // TODO implement Sprite
  //  Sprite sprite;
  Player player;
  int duration = -1, 
  served = 0;

  // this point is considered the "center point" when
  // swapping between states. If a state has an anchor
  // at (3,3), mapping to world coordinate (240,388)
  // and it swaps for a state that has (10,10) as anchor,
  // the associated player is moved (-7,-7) to effect
  // the anchor being in the same place before and after.
  float ax, ay;

  // shortcut constructor
  State(String name, String spritesheet) {
    this(name, spritesheet, 1, 1);
  }

  // bigger shortcut constructor
  State(String _name, String spritesheet, int rows, int cols) {
    name = _name;
    // TODO implement Sprite
    //    sprite = new Sprite(spritesheet, rows, cols);
    //    sprite.setState(this);
  }

  /**
   * add path points to a state
   */
  void addPathPoint(float x, float y, int duration)
  {
    // TODO implement Sprite 
    //    sprite.addPathPoint(x, y, 1, 1, 0, duration);
  }

  /**
   * add path points to a state (explicit scale and rotations)
   */
  void addPathPoint(float x, float y, float sx, float sy, float r, int duration)
  {
    // TODO implement Sprite 
    //    sprite.addPathPoint(x, y, sx, sy, r, duration);
  }

  /**
   * add a linear path to the state
   */
  // TODO implement addPathLine method
  void addPathLine(float x1, float y1, float x2, float y2, float duration) {
    //    sprite.addPathLine(x1, y1, 1, 1, 0, x2, y2, 1, 1, 0, duration);
  }

  /**
   * add a linear path to the state (explicit scale and rotations)
   */
  void addPathLine(float x1, float y1, float sx1, float sy1, float r1, 
  float x2, float y2, float sx2, float sy2, float r2, 
  float duration) 
  {
    // TODO implement addPathLine
    //    sprite.addPathLine(x1, y1, sx1, sy1, r1, x2, y2, sx2, sy2, r2, duration);
  }

  /**
   * add a curved path to the state
   */
  void addPathCurve(float x1, float y1, float cx1, float cy1, float cx2, float cy2, float x2, float y2, float duration, float slowdown_ratio) 
  {
    // TODO implement Sprite
    //    sprite.addPathCurve(x1, y1, 1, 1, 0, cx1, cy1, cx2, cy2, x2, y2, 1, 1, 0, duration, slowdown_ratio);
  }

  /**
   * add a curved path to the state (explicit scale and rotations)
   */
  void addPathCurve(float x1, float y1, float sx1, float sy1, float r1, 
  float cx1, float cy1, 
  float cx2, float cy2, 
  float x2, float y2, float sx2, float sy2, float r2, 
  float duration, 
  float slowdown_ratio) 
  {
    // TODO implement Sprite
    //    sprite.addPathCurve(x1, y1, sx1, sy1, r1, cx1, cy1, cx2, cy2, x2, y2, sx2, sy2, r2, duration, slowdown_ratio);
  }

  /**
   * incidate whether or not this is a looping path
   */
  void setLooping(boolean l) 
  {
    // TODO implement Sprite
    //    sprite.setLooping(l);
  }

  /**
   * Make this state last X frames.
   */
  void setDuration(float _duration) {
    setLooping(false);
    duration = (int) _duration;
  }

  /**
   * bind this state to an player
   */
  void setPlayer(Player _player) {
    player = _player;
    // TODO implement Sprite
    //    player.width = sprite.width;
    //    player.height = sprite.height;
  }

  /**
   * when the sprite is moved by its path,
   * let the player know of its updated position.
   */
  void setPlayerOffsets(float x, float y) 
  {
    // Use physics library
    //    payer.setTranslation(x, y);
  }

  //
  //  void setPlayerDimensions(float w, float h, float xa, float ya) {
  //    player.width = w;
  //    player.height = h;
  //    player.halign = xa;
  //    player.valign = ya;
  //  }

  // reset a sprite (used when swapping states)
  void reset() 
  { 
    // TODO implement Sprite
    //    sprite.reset();
    served = 0;
  }

  // signal to the player that the sprite is done running its path
  void finished() {
    if (player!=null) 
    {
      // TODO implement State and Sprite
      //      player.handleStateFinished(this);
    }
  }

  // if the sprite has a non-looping path: is it done running that path?
  boolean mayChange() 
  {
    // TODO Temporary FIX!
    return false;
    //    if (duration != -1) {
    //      return false;
    //    }
    // TODO implement Sprite
    //    return sprite.mayChange();
  }

  // drawing the state means draw the sprite
  void draw(boolean disabled) {
    // if disabled, only draw every other frame
    if (disabled && frameCount%2==0) {
    }
    //otherwise, draw all frames
    else { 
      // TODO implement Sprite
      //      sprite.draw(0, 0);
    }
    served++; 
    if (served == duration) {
      finished();
    }
  }

  // check if coordinate is in sprite
  boolean over(float _x, float _y) 
  {
    // TODO temperary FIX!
    return false;
    // TODO implement Sprite
    //    return sprite.over(_x, _y);
  }

  // set sprite's animation
  void setAnimationSpeed(float factor) 
  {
    // TODO implement Sprite
    //    sprite.setAnimationSpeed(factor);
  }
}


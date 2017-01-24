public abstract class State 
{
  /**
   * A sprite state is mostly a thin wrapper
   */

  String name;
  ContextInterface context;
  int duration = -1, 
  served = 0;
  boolean loop = false;
  float ax, ay;
  int timer;

  State(String _name) 
  {
    name = _name;
    timer = frameCount;
  }

  /**
   * incidate whether or not this is a looping path
   */
  void setLooping(boolean l) 
  {
    loop = l;
  }

  /**
   * Make this state last X frames.
   */
  void setDuration(float _duration) 
  {
    setLooping(false);
    duration = (int) _duration;
  }

  /**
   * bind this state to an node
   */
  void setContext(ContextInterface _context) 
  {
    context = _context;
  }

  ContextInterface getContext() 
  {
    return context;
  }

  // signal to the node that the sprite is done running its path
  void finished() 
  {
    if (context!=null) 
    {
      handleStateFinished(this);
    }
  }

  // check if coordinate is in sprite
  boolean over(float _x, float _y) 
  {
    // TODO temperary FIX!
    return false;
  }

    // reset state to default in concreate state
  abstract void reset();
  abstract void run();
  abstract void handleStateFinished( State which );
}


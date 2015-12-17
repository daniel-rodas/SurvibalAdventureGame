class SceneState extends State {
  SceneState(String _name) 
  {
    super(_name);
  }

  void handleStateFinished( State which )
  {
  }

  void reset()
  {
    if (name == "shaking")
    {
      IStateContext c = getContext();
      c.setCurrentState("idle");   
    }
    duration = 0;
  }

  void run()
  {
    if (duration < 1)
    {
      reset();
    }
    duration--;
  }
}


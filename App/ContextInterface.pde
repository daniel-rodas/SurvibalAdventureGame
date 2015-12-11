interface ContextInterface
{

  
  void setStates();

  /**
   * Add a state to this actor's repetoire.
   */
  void addState(State _state);

  /**
   * Swap the current state for a different one.
   */
  void swapStates(State tmp);

  /**
   * Set the actor's current state by name.
   */
  void setCurrentState(String name);
  
  /* get current state */
  State getState();
  
  /* get state by name */
  State getState(String _name);
}


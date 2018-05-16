class Bot {
  PVector acceleration, position, velocity;
  Brain brain;
  boolean dead = false;
  float fitness;
  PVector goal;
  
  public Bot(int complexity, PVector goal) {
    brain = new Brain(complexity);
    
    position = new PVector(width/2, height-10);
    velocity = new PVector(0, 0);
    this.goal = goal;
    acceleration = velocity;
  }
  
  void show() {
    fill(0);
    ellipse(position.x, position.y, 4, 4);
  }
  
  void move() {
    if (brain.directions.length > brain.step) {
      acceleration = brain.directions[brain.step];
      brain.step++;
    } else dead = true;
    velocity.add(acceleration);
    velocity.limit(5);
    position.add(velocity);
  }
  
  void update() {
    if (!dead) {
      
      move();
      if (position.x < 2 || position.y < 2 || position.x > width-2 || position.y > height-2) {
        dead = true;
      }
    }
  }
  
  void calculateFitness() {
    float distanceToGoal = dist(position.x, position.y, goal.x, goal.y);
    
  }
}

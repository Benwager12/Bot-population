class Bot {
  PVector acceleration, position, velocity, goal;;
  Brain brain;
  boolean dead = false, reachedGoal = false, isBest = false;
  float fitness;
  public Bot(int complexity, PVector goal) {
    brain = new Brain(complexity);
    
    position = new PVector(width/2, height-10);
    velocity = new PVector(0, 0);
    this.goal = goal;
    acceleration = velocity;
  }
  
  void show() {
    if (isBest) {
      fill(0, 255, 0);
    } else {
      fill(0);
    }
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
    if (!dead && !reachedGoal) {
      move();
      if (position.x < 2 || position.y < 2 || position.x > width-2 || position.y > height-2) {
        dead = true;
      } else if (dist(position.x, position.y, goal.x, goal.y) < 5) {
        reachedGoal = !reachedGoal;
      }
    }
  }
  
  void calculateFitness() {
    if (reachedGoal) {
      fitness = 1.0/16.0 + 1000.0/(float)(brain.step * brain.step);
    } else {
      float distanceToGoal = dist(position.x, position.y, goal.x, goal.y);
      fitness = 1.0/(distanceToGoal * distanceToGoal);
    }
  }
  
  Bot baby() {
    Bot baby = new Bot(400, goal);
    baby.brain = brain.clone();
    return baby;
  }
}

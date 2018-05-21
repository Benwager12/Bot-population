class Bot {
  PVector acceleration, position, velocity, goal;;
  Brain brain;
  boolean dead = false, reachedGoal = false, isBest = false;
  float fitness;
  
  public Bot(int complexity, PVector goal) {
    brain = new Brain(complexity);
    init(goal);
  }
  
  public Bot(Brain brain, PVector goal) {
    this.brain = brain;
    init(goal);
  }
  
  void init(PVector goal) {
    this.goal = goal;
    position = new PVector(width/2, height-10);
    velocity = new PVector(0,0);
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
    float distanceToGoal = dist(position.x, position.y, goal.x, goal.y);
    
    fitness = ceil((width/2) / distanceToGoal);
    //for (int i = 0; i < ceil((width / 2) / distanceToGoal); i++) {
    //  genepool.add(brain);
    //}
  }
  
  Bot baby() {
    Bot baby = new Bot(400, goal);
    baby.brain = brain.clone();
    return baby;
  }
}

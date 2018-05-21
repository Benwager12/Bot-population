Population bots;
PVector goal;

void setup() {
  size(500, 500);
  goal = new PVector(width / 2, 10);
  bots = new Population(100, goal);
}

void draw() {
  background(255);
  fill(0, 255, 0);
  ellipse(goal.x, goal.y, 4, 4);
  
  if (bots.allBotsDead()) {
    bots.calculateFitness();
    bots.selectParent();
    bots.mutateGeneration();
  } else {
    bots.update();
    bots.show();
  }
}

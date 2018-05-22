Population bots;
PVector goal;
Obstacle obs;

void setup() {
  size(500, 500);
  goal = new PVector(width / 2, 10);
  bots = new Population(200, goal);
  
}

void draw() {
  background(255);
  fill(0, 255, 0);
  ellipse(goal.x, goal.y, 4, 4);
  
  if (bots.allBotsDead()) {
    nextGen();
  } else {
    bots.update();
    bots.show();
  }
  
  fill(0);
  text("Generation: " + bots.generation, 10, 25);
}

void mouseClicked() {
  for (int i = 0; i < 500; i++) {
    if (bots.allBotsDead()) {
      nextGen();
    } else bots.update();
    
  }
}

void nextGen() {
  bots.genepool = new ArrayList<Brain>();
  bots.calculateFitness();
  bots.naturalSelection();
  bots.mutateGeneration();
}

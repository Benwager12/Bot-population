Population bots;
PVector goal = new PVector(400, 10);

void setup() {
  size(800, 800);
  bots = new Population(2000);
}

void draw() {
  background(255);
  fill(0, 255, 0);
  ellipse(goal.x, goal.y, 4, 4);
  
  bots.update();
  bots.show();
}

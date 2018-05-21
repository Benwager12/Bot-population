class Population {
  Bot[] bots;
  int generation = 0, bestBot = 0;
  
  public Population(int size, PVector goal) {
    bots = new Bot[size];
    for (int i = 0; i < size; i++) {
      bots[i] = new Bot(400, goal);
    }
  }
  
  void show() {
    for (Bot bot : bots) {
      bot.show();
    }
  }
  
  void update() {
    for (Bot bot : bots) {
      bot.update();
    }
  }
  
  boolean allBotsDead() {
    for (Bot bot : bots) {
      if (!bot.dead && !bot.reachedGoal) return false;
    }
    return true;
  }
  
  void calculateFitness() {
    for (Bot bot : bots) {
      bot.calculateFitness();
    }
  }
  
  void naturalSelection() {
    Bot[] newBots = new Bot[bots.length];
    setBestBot();
    newBots[0] = bots[bestBot].baby();
    newBots[0].isBest = true;
    
    for (int i = 1; i < newBots.length; i++) {
      Bot parent = selectParent();
      newBots[i] = parent.baby();
    }
    bots = newBots.clone();
    generation++;
  }
  
  int calculateFitnessSum() {
    int fitnessSum = 0;
    for (Bot bot : bots) {
      fitnessSum += bot.fitness;
    }
    return fitnessSum;
  }
  
  Bot selectParent() {
    // TODO: Finish later
  }
  
  void mutateGeneration() {
    for (int i = 0; i < bots.length; i++) bots[i].brain.mutate(); 
  }
  
  void setBestBot() {
    float max = 0;
    int maxIndex = 0;
    for (int i = 1; i < bots.length; i++) {
      if (bots[i].fitness < max) {
        max = bots[i].fitness;
        maxIndex = i;
      }
    }
    bestBot = maxIndex;
  }
}

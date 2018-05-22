class Population {
  Bot[] bots;
  int generation = 0, bestBot = 0;
  ArrayList<Brain> genepool;
  PVector goal;
  
  public Population(int size, PVector goal) {
    bots = new Bot[size];
    this.goal = goal;
    for (int i = 0; i < size; i++) {
      bots[i] = new Bot(400, goal);
    }
    genepool = new ArrayList<Brain>();
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
      for (int i = 0; i < bot.fitness; i++) {
       genepool.add(bot.brain);
      }
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
  
  Bot selectParent() {
    int randomBrain = floor(random(genepool.size()));
    return new Bot(genepool.get(randomBrain),goal);
  }
  
  void mutateGeneration() {
    for (int i = 0; i < bots.length; i++) bots[i].brain.mutate(); 
  }
  
  void setBestBot() {
    Bot bestBot;
    for (Bot bot : bots) {
      // TODO: Finish function, has to do because in the previous update it was incorrect.
    }
  }
}

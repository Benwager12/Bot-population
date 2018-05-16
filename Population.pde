class Population {
  Bot[] bots;
  
  public Population(int size) {
    bots = new Bot[size];
    for (int i = 0; i < size; i++) {
      bots[i] = new Bot(400);
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
}

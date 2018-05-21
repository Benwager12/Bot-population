class Obstacle {
  int x1, y1, x2, y2;
  
  public Obstacle(int x1, int y1, int x2, int y2) {
    this.x1 = x1;
    this.y1 = y1;
    this.x2 = x2;
    this.y2 = y2;
  }
  
  boolean collided(PVector pos) {
    return (pos.x > x1 && pos.x < x2 && pos.y < y1 && pos.y > y2);
  }
  
  void show() {
    fill(100,50);
    rect(x1, y1, x2-x1, y2-y1);
  }
}

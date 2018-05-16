class Brain {
  PVector[] directions;
  int step = 0;
  
  public Brain(int size) {
    directions = new PVector[size];
    randomize();
  }
  
  void randomize() {
    for (int i = 0; i < directions.length; i++) {
      float angle = random(2*PI);
      directions[i] = PVector.fromAngle(angle);
    }
  }
}

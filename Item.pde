class Item {
  boolean isAlive;
  float x, y;
  float w = 110;
  float h = 150;

  void display(){}
  void checkCollision(Player player){}

  Item(float x, float y){
    isAlive = true;
    this.x = x;
    this.y = y;
  }
}

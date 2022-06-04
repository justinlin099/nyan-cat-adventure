class Rainbow{
  int x, y;
  float floatTimer;
  Rainbow(int x, int y) {
    this.x=x;
    this.y=y;
    
    floatTimer=0;
  }

  void display() {
    
      image(rainbow, x, y+5+sin(floatTimer)*5);
      floatTimer+=TWO_PI/25;
    
  }

  
}

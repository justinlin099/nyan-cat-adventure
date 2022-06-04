class FlatCoin{
  int x, y;
  int itemX, itemY;
  float floatTimer;
  boolean isAlive;

  FlatCoin(int x, int y) {
    itemX=x;
    itemY=y;
    isAlive=true;
    floatTimer=0;
  }

  void display() {
    if (isAlive) {
      image(flatCoinImg, itemX, itemY+5+sin(floatTimer)*10);
      floatTimer+=TWO_PI/25;
    }
  }

  void checkCollision() {
    if (isHit(nyan.nyanX, nyan.nyanY, 100, 100, itemX, itemY, 100, 100)&& isAlive) {
      coinCount++;
      eatMoney.trigger();
      isAlive=false;
    }
  }
}

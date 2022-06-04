class Coin {
  int x, y;
  int itemX, itemY;
  float floatTimer;
  boolean isAlive;

  Coin(int x, int y) {
    this.x=x;
    this.y=y;
    itemX=(x+6)*80+y*(-30);
    itemY=(x+6)*20+y*60;
    isAlive=true;
    floatTimer=0;
  }

  void display() {
    if (isAlive) {
      drawImage(coinImg, itemX, itemY+5+sin(floatTimer)*10);
      floatTimer+=TWO_PI/25;
    }
  }

  void checkCollision(Player player) {
    if (isHit(player.offsetX, player.offsetY, 1, 1, x, y, 1, 1)&& isAlive) {
      coinCount++;
      eatMoney.trigger();
      isAlive=false;
    }
  }
}

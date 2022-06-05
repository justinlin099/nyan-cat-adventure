class Lightning {
  int x, y;
  int itemX, itemY;
  float floatTimer;
  boolean isAlive;

  Lightning(int x, int y) {
    this.x=x;
    this.y=y;
    itemX=(x+6)*80+y*(-30);
    itemY=(x+6)*20+y*60;
    isAlive=true;
    floatTimer=0;
  }

  void display() {
    if (isAlive) {
      drawImage(lightningImg, itemX, itemY+5+sin(floatTimer)*10);
      floatTimer+=TWO_PI/25;
    }
  }

  void checkCollision(Player player) {
    if (isHit(player.offsetX, player.offsetY, 1, 1, x, y, 1, 1)&& isAlive) {
      lightningMode=true;
      lightningTimer=300;
      bomb.trigger();
      isAlive=false;
    }
  }
}

class Coin {
  int x, y;
  int coinX, coinY;
  float floatTimer;
  boolean isAlive;

  Coin(int x, int y) {
    this.x=x;
    this.y=y;
    coinX=(x+6)*80+y*(-30);
    coinY=(x+6)*20+y*60;
    isAlive=true;
    floatTimer=0;
  }

  void display() {
    if (isAlive) {
      drawImage(coinImg, coinX, coinY+5+sin(floatTimer)*10);
      floatTimer+=TWO_PI/25;
    }
  }

  boolean checkCollision(Player player, int playerState) {
    if (playerState==PLAYER_UP||playerState==PLAYER_DOWN||playerState==PLAYER_IDLE) {
      if (isHit(player.offsetX, player.offsetY, 1, 1, x, y, 1, 1)) {
        return true;
      }
    }
    return false;
  }
}

class Item {
  int x, y;
  int coinX, coinY;
  PImage logImg; //for permenent
  Item(int x, int y) {
    this.x=x;
    this.y=y;
    coinX=(x+6)*80+y*(-30);
    coinY=(x+6)*20+y*60;
  }

  void display() {
    if ( maps[11].checkObjects(player.offsetX)!=TREE && maps[11].checkObjects(player.offsetX)!=CAR) {
      drawImage(logImg, coinX, coinY); //change the log here
    }
  }
}

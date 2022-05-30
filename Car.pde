class Car {
  float x, y;
  float carX, carY;
  float speed;
  PImage carImg;
  Car(int x, int y, float speed) {
    this.x=x;
    this.y=y;
    this.speed=speed;
    carX=(x+6)*80+y*(-30);
    carY=(x+6)*20+y*60;
    carImg=car[floor(random(4))];
  }

  void display() {
    drawImage(carImg, carX, carY);
    if (debugMode) {
      fill(0);
      textSize(30);
      text(x+","+y, carX, carY);
    }
  }

  void update() {
    carX += speed*4;
    carY += speed*1;
    x+=speed/20;
    if (speed>0 && x>14) {
      x=-7;
      carX=(x+6)*80+y*(-30);
      carY=(x+6)*20+y*60;
    } else if (x<-7) {
      x=15;
      carX=(x+6)*80+y*(-30);
      carY=(x+6)*20+y*60;
    }
  }

  boolean checkCollision(Player player, int playerState) {
    if(playerState==PLAYER_UP||playerState==PLAYER_DOWN||playerState==PLAYER_IDLE){
      if(isHit(player.offsetX , player.offsetY,1,1,x,y,1,1)){
        return true;
      }
    }
    return false;
  }
}

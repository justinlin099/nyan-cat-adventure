class Player {
  float x, y;
  int offsetX, offsetY;
  int movingTimer;

  Player() {
    x=560;
    y=680;
    offsetX=4;
    offsetY=8;
    movingTimer=0;
  }

  void update() {

    switch(playerState) {
    case PLAYER_IDLE:
      if (maps[12].type==GRASS) {
        drawImage(playerImg, x, y-5);
      } else {
        drawImage(playerImg, x, y);
      }
      break;
    case PLAYER_UP:
      movingTimer+=1;
      x+=3;
      y-=6;
      drawImage(playerImg, x, y-10);
      playerImg=nyanUP[skin];
      break;
    case PLAYER_DOWN:
      movingTimer+=1;
      x-=3;
      y+=6;
      drawImage(playerImg, x, y-10);
      break;
    case PLAYER_LEFT:
      movingTimer+=1;
      x-=8;
      y-=2;
      drawImage(playerImg, x, y-10);
      playerImg=nyanL[skin];
      break;
    case PLAYER_RIGHT:
      movingTimer+=1;
      x+=8;
      y+=2;
      drawImage(playerImg, x, y-10);
      playerImg=nyanR[skin];
      break;
    }

    if (debugMode) {
      fill(0);
      textSize(30);
      text(offsetX+","+offsetY, x+55, y);
    }

    if (movingTimer==10) {
      playerState=PLAYER_IDLE;
      movingTimer=0;
    }
  }
}

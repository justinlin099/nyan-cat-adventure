class NyanCatRun {
  int nyanX, nyanY;
  FlatCoin[] coins=new FlatCoin[11];
  int timer;
  int time;
  int nyanIndex;

  NyanCatRun(int time) {
    this.time=time;
    timer=0;
    nyanX=100;
    nyanY=height/2;
    nyanIndex=0;
    for (int i=0; i<11; i++) {
      coins[i]=new FlatCoin(width-120*i,60+120*int(random(5)));
    }
  }

  void display() {
    background(#0d4278);
    nyanY=mouseY-50;
    if (nyanY<10) {
      nyanY=10;
    } else if (nyanY+110>height) {
      nyanY=height-110;
    }
    //draw coin
    for (int i=0; i<11; i++) {
      coins[i].display();
      coins[i].itemX-=10;
      if(coins[i].itemX+100<0){
        coins[i]=new FlatCoin(width,60+120*int(random(5)));
      }
      coins[i].checkCollision();
    }
    
    image(nyanRun[nyanIndex], nyanX, nyanY);
    if (timer%3==0) {
      nyanIndex++;
    }
    if (nyanIndex>4) {
      nyanIndex=0;
    }

    timer++;

    if (timer>time) {
      gameState=GAME_RUN;
    }
  }
}

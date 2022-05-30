/*class Coin {
  int x, y;
  int coinX, coinY;
  PImage coinImg; //for permenent
  Coin(int x, int y) {
    this.x=x;
    this.y=y;
    coinX=(x+6)*80+y*(-30);
    coinY=(x+6)*20+y*60;
  }

  void display() {
      drawImage(coinImg, coinX, coinY); //change the log here
  }
}*///original one

class Coin extends Item{
  int x, y;
  int coinX, coinY;
  PImage coinImg; //for permenent
  Coin(int x, int y) {
    super(x,y);
  }

  void display(){
    if(isAlive) image(coinImg,coinX,coinY);  
  }
  
  isHit();

    }
  }
}

class NyanCatRun{
  int nyanX,nyanY;
  Coin[] coins;
  int timer;
  int time;
  int nyanIndex;
  
  NyanCatRun(int time){
    this.time=time;
    timer=0;
    nyanX=30;
    nyanY=height/2;
    nyanIndex=0;
  }
  
  void display(){
    background(#0d4278);
    image(nyanRun[nyanIndex], nyanX ,nyanY);
    if(timer%3==0){
      nyanIndex++;
    }
    if(nyanIndex>4){
      nyanIndex=0;
    }
    
    timer++;
    
    if(timer>time){
      gameState=GAME_RUN;
    }
  }

}

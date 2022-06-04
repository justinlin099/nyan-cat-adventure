PImage playerImg,nyan0,coinImg,nyandead,gameOver,restart;
PImage[] tree=new PImage[4];
PImage[] car=new PImage[4];
PImage[] carR=new PImage[4];
PImage[] truck=new PImage[2];
PImage logImg; //replace this with coin image
int landX, landY;
float tranX=0, tranY=0;
Player player;
int playerState;
final int PLAYER_IDLE=0, PLAYER_UP=1, PLAYER_DOWN=2, PLAYER_RIGHT=3, PLAYER_LEFT=4;
final int CAT_PADX=30;
final int GAME_START = 0, GAME_RUN = 1, GAME_OVER = 2;
int gameState = 0;
int coinCount=0;
int hiScore=0;
int hintTimer;
float hintX,hintY;

boolean debugMode=false;
Map[] maps=new Map[40];
final int ROAD=1, GRASS=0;
final int TREE=1;
final int CAR=1;

void initGame() {
  for (int i=0; i<maps.length; i++) {
    if (i<16) {
      maps[i]=new Grass(20-i);
    } else {
      switch(floor(random(2))) {
      case 0:
        maps[i]=new Grass(20-i);
        break;
      case 1:
        maps[i]=new Road(20-i);
        break;
      }
    }
  }
}

void setup() {
  size(1280, 720, P2D);
  noStroke();
  nyan0 = loadImage("img/nyan0.png");
  nyandead = loadImage("img/dead-nyan.png");
  playerImg=nyan0;
  logImg=loadImage("img/gutter-cover.png");
  coinImg=loadImage("img/coin.png");
  gameOver=loadImage("img/gameOver.png");
  restart=loadImage("img/restart.png");
  

  //loading Tree & Car Image
  for (int i=0; i<4; i++) {
    tree[i] = loadImage("img/tree" + i + ".png") ;
    car[i] = loadImage("img/car" + i + ".png") ;
    carR[i] = loadImage("img/car" + i + "_R.png");
  }

  for (int i=0; i<2; i++) {
    truck[i] = loadImage("img/truck" + i + ".png") ;
  }



  initGame();

  player = new Player();
}


void draw() {

  pushMatrix();
  //Adjust Rolling Speed
  switch (gameState) {
    
    case GAME_START:
      if (tranX<-400) {
        tranX=-400;
        tranY=800;
      }
      if (tranX<0) {
        for (int i=-400; i<=0; i=i+20) {
          if (tranX<=i) {
            tranX+=1;
            tranY-=2;
          }
        }
      }
      break;
    case GAME_RUN:
      for (int i=550; i>=0; i=i-25) {
        if (tranY+player.y<=i) {
          tranX-=0.125;
          tranY+=0.25;
        }
      }
      tranX-=0.125;
      tranY+=0.25;
      break;
    case GAME_OVER:
      playerImg = nyandead;
      break;
  }


  //Rolling the screen
  translate(tranX, tranY);


  //draw map

  for (int j=39; j>=0; j--) {
    maps[j].display();
  }
  for (int j=39; j>0; j--) {
    roadMarkingLine(j);
  }

  //draw objects
  for (int j=39; j>=13; j--) {
    maps[j].displayObjects();
  }

  //drawPlayer
  player.update();

  //draw objects
  for (int j=12; j>=0; j--) {
    maps[j].displayObjects();
  }

  popMatrix();

  switch (gameState) {
    
    
    case GAME_OVER:
      if(hintTimer>0){
        hintTimer--;
        //hintX+=4;
        //hintY+=1;
        for(int i=0;i<hintTimer;i++){
          hintX+=(0.4*hintTimer/32);
          hintY+=(0.1*hintTimer/32);
        }
      }
      
      drawImage(gameOver,hintX,hintY);
      drawImage(restart,hintX,hintY+60);
      break;
  }

  //draw score


  drawScore();

  //detect if cat is out of the screen
  
  if(tranY+ player.y-720-60>0 && gameState==GAME_RUN){
    gameState=GAME_OVER;
    hintTimer=60;
    hintX=-400;
    hintY=150;
  }
}

void keyPressed() {
  // Add your moving input code here
  if (key ==CODED) {
    switch(keyCode) {
    case UP:
      if (gameState==GAME_START && tranX>=0) {
        gameState=GAME_RUN;
      }
      if (gameState==GAME_RUN && playerState==PLAYER_IDLE && maps[13].checkObjects(player.offsetX)!=TREE) {
        playerState=PLAYER_UP;
        player.movingTimer=0;
        player.offsetY--;
        //offset map forward and create new map
        for (int i=0; i<39; i++) {
          maps[i]=maps[i+1];
        }
        switch(floor(random(3))) {
        case 0:
          maps[39]=new Grass(player.offsetY-27);
          break;
        case 1:
          maps[39]=new Road(player.offsetY-27);
          break;
        case 2:
          maps[39]=new Road(player.offsetY-27);
          break;
        }
      }

      
      break;
    case RIGHT:
      if (gameState==GAME_RUN && playerState==PLAYER_IDLE && player.offsetX<8 && maps[12].checkObjects(player.offsetX+1)!=TREE) {
        playerState=PLAYER_RIGHT;
        player.movingTimer=0;
        player.offsetX++;
      }
      break;
    case LEFT:
      if (gameState==GAME_RUN && playerState==PLAYER_IDLE && player.offsetX>0 && maps[12].checkObjects(player.offsetX-1)!=TREE) {
        playerState=PLAYER_LEFT;
        player.movingTimer=0;
        player.offsetX--;
      }
      break;
    case DOWN:
      if (gameState==GAME_RUN && playerState==PLAYER_IDLE && maps[11].checkObjects(player.offsetX)!=TREE) {
        playerState=PLAYER_DOWN;
        player.movingTimer=0;
        player.offsetY++;

        //offset map backward and create new map
        for (int i=39; i>0; i--) {
          maps[i]=maps[i-1];
        }
      }
      break;
    }
  } else {
    if (key=='b') {
      // Press B to toggle demo mode
      debugMode = !debugMode;
    }
    if (key==ENTER){
      if (gameState==GAME_OVER) {
        gameState=GAME_START;
        player.x=560;
        player.y=680;
        player.offsetX=4;
        player.offsetY=8;
        player.movingTimer=0;
        playerImg = loadImage("img/nyan0.png");
        initGame();
      }
    }
  }
}
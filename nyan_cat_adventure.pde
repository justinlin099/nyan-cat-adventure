PImage playerImg;
PImage[] tree=new PImage[4];
PImage[] car=new PImage[4];
PImage logImg; //replace this with coin image
int landX, landY;
float tranX=0, tranY=0;
Player player;
int playerState;
final int PLAYER_IDLE=0, PLAYER_UP=1, PLAYER_DOWN=2, PLAYER_RIGHT=3, PLAYER_LEFT=4;
final int CAT_PADX=30;

boolean debugMode=false;
Map[] maps=new Map[40];
final int ROAD=1, GRASS=0;
final int TREE=1;
final int CAR=1;

void setup() {
  size(1280, 720, P2D);
  noStroke();
  playerImg = loadImage("img/nyan0.png");


  //loading Tree Image
  for (int i=0; i<4; i++) {
    tree[i] = loadImage("img/tree" + i + ".png") ;
    car[i] = loadImage("img/car" + i + ".png") ;
  }

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

  player = new Player();
}


void draw() {
  pushMatrix();
  //Adjust Rolling Speed
  for (int i=550; i>=0; i=i-25) {
    if (tranY+player.y<=i) {
      tranX-=0.125;
      tranY+=0.25;
    }
  }
  tranX-=0.125;
  tranY+=0.25;

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
}

void keyPressed() {
  // Add your moving input code here
  if (key ==CODED) {
    switch(keyCode) {
    case UP:
      if (playerState==PLAYER_IDLE && maps[13].checkObjects(player.offsetX)!=TREE) {
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
      if (playerState==PLAYER_IDLE && player.offsetX<8 && maps[12].checkObjects(player.offsetX+1)!=TREE) {
        playerState=PLAYER_RIGHT;
        player.movingTimer=0;
        player.offsetX++;
      }
      break;
    case LEFT:
      if (playerState==PLAYER_IDLE && player.offsetX>0 && maps[12].checkObjects(player.offsetX-1)!=TREE) {
        playerState=PLAYER_LEFT;
        player.movingTimer=0;
        player.offsetX--;
      }
      break;
    case DOWN:
      if (playerState==PLAYER_IDLE && maps[11].checkObjects(player.offsetX)!=TREE) {
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
  }
}

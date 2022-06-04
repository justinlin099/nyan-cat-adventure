//code for draw road marking line
void roadMarkingLine(int y) {
  if (maps[y].type==ROAD && maps[y-1].type==ROAD) {
    for (int i=0; i<19; i++) {
      landX=i*80+maps[y].y*(-30);
      landY=i*20+maps[y].y*60;

      fill(100);
      //draw line
      if (i%2==0) {
        quad(landX+1, landY-2, landX+81, landY+18, landX+79, landY+22, landX-1, landY+2);
      }
    }
  }
}

//code for draw image form the position point
void drawImage(PImage img, float x, float y) {
  if ((img.width-30)%80==0) {
    int n=int((img.width-30)/80);
    image(img, x, y-(img.height-20*n));
  }
}


//check collision
boolean isHit(float ax, float ay, float aw, float ah, float bx, float by, float bw, float bh) {
  return  ax + aw > bx &&    // a right edge past b left
    ax < bx + bw &&    // a left edge past b right
    ay + ah > by &&    // a top edge past b bottom
    ay < by + bh;
}

int score() {
  return 8-player.offsetY;
}

void drawScore() {
  if(hiScore<score()){
    hiScore=score();
  }
  textSize(100);
  fill(255);
  text(score(), 30, 100);
  textSize(30);
  text("HI: "+ hiScore, 30, 150);
  if (debugMode) {
      text(tranY, 30, 230);
      text(player.y+ hiScore, 30, 260);
  }
  
  textSize(30);
  fill(255,255,0);
  text("Coin: "+coinCount, 30, 200);

}

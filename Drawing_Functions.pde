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
void drawImage(PImage img,float x,float y){
  if((img.width-30)%110==0){
    int n=int((img.width-30)/110);
    image(img,x,y-(img.height-20*n));
  }
}

class Car{
  int x,y;
  int carX,carY;
  float speed = floor(random(1,2));
  PImage carImg;
  Car(int x,int y){
    this.x=x;
    this.y=y;
    carX=(x+6)*80+y*(-30);
    carY=(x+6)*20+y*60;
    carImg=car[floor(random(4))];
    
  }
  
  void display(){
    drawImage(carImg,carX,carY);
    if (debugMode) {
        fill(0);
        textSize(30);
        text(x+","+y,carX,carY);
      }
  }
  
  void update(){
    carX += speed*4;
    carY += speed*1;
  }
  
}

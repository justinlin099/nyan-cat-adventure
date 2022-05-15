class Car{
  int x,y;
  int carX,carY;
  float speed = random(-1,1);
  PImage carImg;
  Car(int x,int y){
    this.x=x;
    this.y=y;
    carX=(x+6)*80+y*(-30);
    carY=(x+6)*20+y*60;
    carImg=car[floor(random(4))];
  }
  
  void display(){
    carX += speed*4;
    carY += speed*1;
    drawImage(carImg,carX,carY);
  }
  
}

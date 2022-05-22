class Car{
  int x,y;
  int carX,carY;
  float speed = floor(random(1,2));
  PImage carImg;
  Car(int x,int y){
    this.x=x;
    this.y=y;
    carImg=car[floor(random(4))];
    carX += speed*4;
    carY += speed*1;
  }
  
  void display(){
    drawImage(carImg,carX,carY);
  }
  
}

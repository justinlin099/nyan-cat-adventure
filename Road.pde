class Road extends Map {
  Car[] cars;
  Road(int y) {
    super(y);
    type=ROAD;

    //generate car
    cars=new Car[4];
    int space=floor(random(4,8));
    float speed;
    if(floor(random(2))==0){
      speed=random(0.2,1);
    }else{
      speed=-random(0.2,1);
    }
    int newCarX=floor(random(-6,-3));
    cars[0]=new Car(newCarX,y,speed);
    cars[1]=new Car(newCarX+space,y,speed);
    cars[2]=new Car(newCarX+10,y,speed);
    cars[3]=new Car(newCarX+10+space,y,speed);
  }

  void display() {
    for (int i=0; i<20; i++) {
      fill(#404040);
      landX=i*80+y*(-30);
      landY=i*20+y*60;
      quad(landX, landY, landX+80, landY+20, landX+110, landY-40, landX+30, landY-60);

      //draw line
      if (i%2==0) {
        quad(landX-14, landY+28, landX+66, landY+48, landX+64, landY+52, landX-14, landY+32);
      }

      if (debugMode) {
        fill(255);
        textSize(30);
        text(y, landX, landY);
      }
    }
  }

  void displayObjects() {
    for (int i=cars.length-1; i>=0; i--) {
      cars[i].display();
      cars[i].update();
      if(cars[i].checkCollision(player,PLAYER_UP)){
        print("Hit");
      }
    }
  }

  int checkObjects(int x) {
    //check car
    for (int i=0; i<cars.length; i++) {
      if (cars[i].x==x) {
        return CAR;
      }
    }
    return -1;
  }

  
}

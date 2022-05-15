class Road extends Map {
  Car[] cars;
  Road(int y) {
    super(y);
    type=ROAD;
    //generate car
    cars=new Car[floor(random(5))];
    int newCarX;
    for (int i=0; i<cars.length; i++) {
      if (floor(random(2))==0) {
        newCarX=floor(random(3));
        while (checkCarXreuse(newCarX, i)) {
          newCarX=6+floor(random(3));
        }
      } else {
        newCarX=6+floor(random(3));
        while (checkCarXreuse(newCarX, i)) {
          newCarX=floor(random(3));
        }
      }
      cars[i]=new Car(newCarX, y);
    }
  }
  
  void display() {
    for (int i=0; i<19; i++) {
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
    for (int i=0; i<cars.length; i++) {
      cars[i].display();
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

  boolean checkCarXreuse(int newCarX, int n) {
    for (int i=0; i<n; i++) {
      if (cars[i].x==newCarX) {
        return true;
      }
    }
    return false;
  }
}

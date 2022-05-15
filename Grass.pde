class Grass extends Map {
  Tree[] trees;
  Grass(int y) {
    super(y);
    type=GRASS;
    //generate tree
    trees=new Tree[floor(random(5))];
    int newTreeX;
    for (int i=0; i<trees.length; i++) {
      if (floor(random(2))==0) {
        newTreeX=floor(random(3));
        while (checkTreeXreuse(newTreeX, i)) {
          newTreeX=6+floor(random(3));
        }
      } else {
        newTreeX=6+floor(random(3));
        while (checkTreeXreuse(newTreeX, i)) {
          newTreeX=floor(random(3));
        }
      }
      trees[i]=new Tree(newTreeX, y);
    }
  }
 
  void display() {
    for (int i=0; i<19; i++) {
      if (i<6 || i>14) {
        fill(#0cb43c);
      } else {
        fill(#0ed145);
      }
      landX=i*80+y*(-30);
      landY=i*20+y*60;
      text(y, landX, landY);
      quad(landX, landY-5, landX+80, landY+20-5, landX+110, landY-40-5, landX+30, landY-60-5);
      if (i<6 || i>14) {
        fill(#0a9030);
      } else {
        fill(#0cb43c);
      }
      quad(landX, landY, landX+80, landY+20, landX+80, landY+20-5, landX, landY-5);
      if (debugMode) {
        fill(255);
        textSize(30);
        text(y, landX, landY);
      }
    }
  }

  void displayObjects() {
    for (int i=0; i<trees.length; i++) {
      trees[i].display();
    }
  }

  int checkObjects(int x) {
    //check tree
    for (int i=0; i<trees.length; i++) {
      if (trees[i].x==x) {
        return TREE;
      }
    }
    return -1;
  }

  boolean checkTreeXreuse(int newTreeX, int n) {
    for (int i=0; i<n; i++) {
      if (trees[i].x==newTreeX) {
        return true;
      }
    }
    return false;
  }
}

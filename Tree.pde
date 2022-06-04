class Tree {
  int x, y;
  int treeX, treeY;
  PImage treeImg;
  Tree(int x, int y) {
    this.x=x;
    this.y=y;
    treeX=(x+6)*80+y*(-30);
    treeY=(x+6)*20+y*60;
    treeImg=tree[floor(random(4))];
  }



  void display() {
    drawImage(treeImg, treeX, treeY);
  }
}
/*
//generate coin
coins=new Coin[floor(random(5))];
int newCoinX;
for (int i=0; i<coins.length; i++) {
  if (floor(random(2))==0) {
    newCoinX=floor(random(3));
    while (checkCoinXreuse(newCoinX, i)) {
      newCoinX=6+floor(random(3));
    }
  } else {
    newCoinX=6+floor(random(3));
    while (checkCoinXreuse(newCoinX, i)) {
      newCoinX=floor(random(3));
    }
  }
  coins[i]=new Coin(newCoinX, y);
}
*/

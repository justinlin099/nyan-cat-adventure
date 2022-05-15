class Tree{
  int x,y;
  int treeX,treeY;
  PImage treeImg;
  Tree(int x,int y){
    this.x=x;
    this.y=y;
    treeX=(x+6)*80+y*(-30);
    treeY=(x+6)*20+y*60;
    treeImg=tree[floor(random(4))];
  }
  
  void display(){
    drawImage(treeImg,treeX,treeY);
  }

}

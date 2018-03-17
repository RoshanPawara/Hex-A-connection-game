class hex
{
  int x;
  int y;
  int r;
  void getData(int x, int y, int r)
  {
    this.x=x;
    this.y=y;
    this.r=r;
  }
  void show()
  {
    stroke(0);
    noFill();
    //ellipse(x,y,r,r);
    stroke(255, 255, 0);

    strokeWeight(2);

    //display center point of the hexagon
    //point(x,y);

    beginShape();
    vertex(x-r/2, y);
    vertex(x-r/4, y-r/2+r/10-1);
    vertex(x+r/4, y-r/2+r/10-1);
    vertex(x+r/2, y);
    vertex(x+r/4, y+r/2-r/10+1);
    vertex(x-r/4, y+r/2-r/10+1);
    vertex(x-r/2, y);
    endShape();
  }
}

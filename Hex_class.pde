class hex
{
  int x;
  int y;
  int r;
  int col=color(127);
  boolean available=true;
  
  void getData(int x, int y, int r)
  {
    this.x=x;
    this.y=y;
    this.r=r;
  }

  void show()
  {
    stroke(0);

    //ellipse(x,y,r,r);
    stroke(255, 255, 0);

    strokeWeight(2);

    //display center point of the hexagon
    //point(x,y);
    fill(col);
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

  void clicked(int px, int py)
  {
    float d=dist(this.x, this.y, px, py);

    if (d<r/2-1 && available)
    {
      col=color(255, 0, 0);
      available=false;
    } else
    {
      if (available)
        col=color(127);
    }
  }
}

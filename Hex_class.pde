class hex
{

  int x;  // x co-ordinate
  int y;  // y co-ordinate
  int r;  // radius of the circumcircle
  int col=color(127);
  boolean available=true;  //initial status of every cell

  void getData(int x, int y, int r)
  {
    this.x=x;
    this.y=y;
    this.r=r;
  }

  void show()
  {
    //stroke(0);
    //ellipse(x,y,r,r);

    stroke(255);  //white border color for the hexes
    strokeWeight(4);  // border weight
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

    if (d<r/2-1 && available) // if clicked inside the hexagon
    {
      if (!Ai)col=color(255, 0, 0);  // if not Ai then color is red
      if (Ai)col=color(0, 0, 255);  // if Ai then color is blue

      available=false;  // once clicked then change the status of the hex cell to notAvailable
      Ai=!Ai;  // swaps the control between Ai and the user
    } else
    {
      if (available)
        col=color(127);
    }
  }
}

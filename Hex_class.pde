class Hex
{
  int x;  // x co-ordinate
  int y;  // y co-ordinate
  int r;  // radius of the circumcircle
  int col=color(127);
  boolean available=true;  //initial status of every cell
  int cellNumber;

  void getData(int x, int y, int r, int ObjCount)
  {
    this.x=x;
    this.y=y;
    this.r=r;
    this.cellNumber=ObjCount;
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
    
    fill(255);
    text(cellNumber, x, y);
  }

  void clicked(int px, int py)
  {
    float d=dist(this.x, this.y, px, py);
    if (d<r/2-1 && available) // if clicked inside the hexagon
    {
      checkAdjacent();
      if (!Ai)  // if not Ai then color is red
      {
        col=color(255, 0, 0);
      }
      if (Ai)  // if Ai then color is blue
      {
        col=color(0, 0, 255);
      }
      available=false;  // once clicked then change the status of the hex cell to notAvailable
      Ai=!Ai;  // swaps the control between Ai and the user
      //println(i);
      create(cellNumber);
    } else
    {
      if (available)
        col=color(127);
    }
  }

  void checkAdjacent()
  {
    println("____________________");
    if(cellNumber%numOfCells != 1 && ((cellNumber + numOfCells) <= numOfCells*numOfCells)) // cells at top don't have any adjacent cell above them
      println("t: "+(cellNumber + (numOfCells-1)));//top

   //if(!(cellNumber <= numOfCells*numOfCells && cellNumber > ((numOfCells*numOfCells - numOfCells) + 1)))
   if((cellNumber + numOfCells) <= numOfCells*numOfCells)
      println("tr: "+(cellNumber + numOfCells));//top right
   
   if(!(cellNumber % numOfCells==0))   
      println("btr: "+(cellNumber + 1));//bottom right      
    
    if(this.cellNumber > numOfCells && !(cellNumber % numOfCells==0)) // first n cells don't have any adjacent cell below them
      println("b: "+(cellNumber-(numOfCells-1)));//bottom

    if(this.cellNumber > numOfCells)
      println("btl: "+(cellNumber - numOfCells));//bottom left
    
    if(cellNumber%11 != 1)// cells at top don't have any adjacent cell above(left) them
      println("tl: "+(cellNumber - 1));//top left
    
    println("____________________");
  }
}

class Hex
{
  int x;              /* x co-ordinate */
  int y;              /* y co-ordinate */
  int r;              /* radius of the circumcircle */
  int col;            /* color of the cell */
  boolean available;  /* initial status of every cell */
  int cellNumber;     /* Cell Number */

  /* Variables to calculate the index of adjacent cells */
  int top;
  int topRight;
  int topLeft;
  int bottom;
  int bottomRight;
  int bottomLeft;

  /* boolean variables for adjacent cells to determine whether the cell exists */
  boolean topExists;
  boolean topRightExists;
  boolean topLeftExists;  
  boolean bottomExists;
  boolean bottomRightExists;  
  boolean bottomLeftExists; 

  /* Constructor */
  Hex()
  {
    this.col = color(127);
    this.available = true;
  }

  void getData(int x, int y, int r, int ObjCount)
  {
    this.x = x;
    this.y = y;
    this.r = r;
    this.cellNumber = ObjCount;

    /* calculating the adjacent cells */
    top         = this.cellNumber + (numOfCells - 1);
    topRight    = this.cellNumber + numOfCells;
    topLeft     = this.cellNumber - 1;
    bottom      = cellNumber - (numOfCells - 1);
    bottomRight = this.cellNumber + 1;
    bottomLeft  = this.cellNumber - numOfCells;

    /* Determining if the adjacent cells exist for a particular cell */
    topExists         = this.cellNumber % numOfCells != 1 && (this.cellNumber + (numOfCells - 1)) < numOfCells * numOfCells;
    topRightExists    = this.cellNumber + numOfCells <= (numOfCells * numOfCells);
    topLeftExists     = this.cellNumber % numOfCells != 1;
    bottomExists      = this.cellNumber > numOfCells && !(this.cellNumber % numOfCells == 0);
    bottomRightExists = !(this.cellNumber % numOfCells == 0);
    bottomLeftExists  = this.cellNumber > numOfCells;
  }

  void show()
  {
    stroke(255);      /* white border color for the cells */
    strokeWeight(4);  /* border weight */
    fill(col);
    beginShape();
    vertex(x - r/2, y);
    vertex(x - r/4, y - r/2 + r/10 - 1);
    vertex(x + r/4, y - r/2 + r/10 - 1);
    vertex(x + r/2, y);
    vertex(x + r/4, y + r/2 - r/10 + 1);
    vertex(x - r/4, y + r/2 - r/10 + 1);
    vertex(x - r/2, y);
    endShape();
    fill(255);
    text(cellNumber, x, y);
  }

  void clicked(int px, int py)
  {
    float d = dist(this.x, this.y, px, py);
    if (d < r/2 - 1 && available) /* if clicked inside the hexagon */
    {
      if (!Ai)  /* if not Ai then color is red */
      {
        col = color(255, 0, 0);
      }
      if (Ai)  /* if Ai then color is blue */
      {
        col = color(0, 0, 255);
      }
      file.play();
      available = false;  /* once clicked then change the status of the hex cell to notAvailable */
      Ai = !Ai;           /* swaps the control between Ai and the user */
      /* println("node: " + node[this.cellNumber - 1].value); */
      checkAdjacent();
      gameOver();
    } else
    {
      if (this.available)
        this.col = color(127);
    }
  }

  void checkAdjacent()
  {
    /* println("____________________"); */
    /* println(this.cellNumber); */
    if (this.topExists && colorMatch(this.top - 1, this.cellNumber - 1)) 
    {
      /* println("Top: ", + this.top); */
      union(node[this.top - 1], node[this.cellNumber - 1]);
    }
    if (this.topRightExists && colorMatch(this.topRight - 1, this.cellNumber - 1))  
    {
      /* println("TopRight: ", this.topRight); */
      union(node[this.topRight - 1], node[this.cellNumber - 1]);
    }
    if (bottomRightExists && colorMatch(this.bottomRight - 1, this.cellNumber - 1)) 
    {
      /* println("BottomRight: ", this.bottomRight); */
      union(node[this.bottomRight - 1], node[this.cellNumber - 1]);
    } 
    if (this.bottomExists && colorMatch(this.bottom - 1, this.cellNumber - 1))
    {
      /* println("Bottom: ", this.bottom); */
      union(node[this.bottom - 1], node[this.cellNumber - 1]);
    }
    if (this.bottomLeftExists && colorMatch(this.bottomLeft - 1, this.cellNumber - 1))
    {  
      /* println("BottomLeft: ", this.bottomLeft); */
      union(node[this.bottomLeft - 1], node[this.cellNumber - 1]);
    }
    if (this.topLeftExists && colorMatch(this.topLeft - 1, this.cellNumber - 1))
    {
      /* println("TopLeft: ", this.topLeft); */
      union(node[this.topLeft - 1], node[this.cellNumber - 1]);
    }
    /* println("____________________"); */
    /* Find(node[this.cellNumber - 1]); */
  } /* Function checkAdjacent ends */

  boolean colorMatch(int adjacentCell, int curentCell)
  {
    /* println("Color match with", + adjacentCell + 1); */
    return (a[adjacentCell].col == a[curentCell].col);
  }
}/* Class hex ends */

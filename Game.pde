int r = 50;
int numOfCells = 11;
Hex[] a = new Hex[numOfCells*numOfCells];
boolean Ai = false;

void setup()
{
  size(1366, 768);
  background(127);
  for (int i=0; i<numOfCells*numOfCells; i++) 
  {
    a[i]=new Hex();
  }// this loop initializes all the hex objects

  int objectCount=0;
  for (int i=0; i<numOfCells; i++)  
  {
    for (int j=0; j<numOfCells; j++) 
    {
      
      a[objectCount].getData(width/2-430+i*r-i*7+j*43, height/2-i*r+i*r/2+j*25, r, objectCount+1);
      a[objectCount].show();
      objectCount++;
    }
  }
}

void draw()
{
  stroke(90);
  strokeWeight(0.5);
  line(0, height/2, width, height/2);// X axis
  line(width/2, 0, width/2, height);// Y axis
  //println(objectCount);
}

void mousePressed()
{
  background(127);
  for (int i=0; i<a.length; i++)
  {
    a[i].clicked(mouseX, mouseY);
    a[i].show();
  }
}


void create(int cellNumber)
{
  //println(a[cellNumber].available);
  Node n = new Node(cellNumber);
  //println(cellNumber);
}

void union()
{
  
}

void find()
{
  
} 

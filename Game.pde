import processing.sound.*;
SoundFile file;
String audioName = "Pop.mp3";
String path;

int r          = 50;
boolean Ai     = false;
int numOfCells = 11;
Hex[] a        = new Hex[numOfCells * numOfCells];
Node[] node    = new Node[numOfCells * numOfCells];

void setup()
{
  path = sketchPath(audioName);
  file = new SoundFile(this, path);
  size(1366, 768);
  background(127);
  board();
  for (int i = 0; i < numOfCells * numOfCells; i++) 
  {
    a[i]    = new Hex();
    node[i] = new Node(i + 1);
    create(i);
  }/* this loop initializes all the hex objects */

  int objectCount = 0;
  for (int i = 0; i < numOfCells; i++)  
  {
    for (int j = 0; j<numOfCells; j++) 
    {
      a[objectCount].getData(width/2-430+i*r-i*7+j*43, height/2-i*r+i*r/2+j*25, r, objectCount+1);
      a[objectCount].show();
      objectCount++;
    }
  }
}

void draw()
{ 
   /*stroke(90);
   strokeWeight(0.5);
   line(0, height/2, width, height/2); // X axis
   line(width/2, 0, width/2, height);  // Y axis
   println(objectCount); */
}

void mousePressed()
{
  background(127);
  board();
  for (int i = 0; i < a.length; i++)
  {
    a[i].clicked(mouseX, mouseY);
    a[i].show();
  }
}

void create(int cellNumber)
{
  node[cellNumber].parent = node[cellNumber];
  node[cellNumber].rank   = 0;
  node[cellNumber].size   = 1;
}

void union(Node x, Node y)
{
  Node xRoot = Find(x);
  Node yRoot = Find(y);

  /* x and y are already in the same set */
  if (xRoot == yRoot)            
    return;

  /* x and y are not in same set, so we merge them */
  if (xRoot.rank < yRoot.rank)
  {
    /* swap xRoot and yRoot */
    Node temp;
    temp  = xRoot;
    xRoot = yRoot;
    yRoot = temp;
  }

  /* merge yRoot into xRoot */
  yRoot.parent = xRoot;
  xRoot.size   = xRoot.size + yRoot.size;
  if (xRoot.rank == yRoot.rank)
  {
    xRoot.rank = xRoot.rank + 1;
  }
}

Node Find(Node x)
{
  if (x.parent != x)
  {
    x.parent = Find(x.parent);
  }
  /*println("root:" + (x.parent.value));*/
  return x.parent;
} 

void gameOver()
{
  for (int i = 0; i < numOfCells; i++) /* bottom edge for blue */
  {
    for (int j = numOfCells * numOfCells - numOfCells; j < numOfCells * numOfCells; j++) /* top edge for blue */
    {  
      if (Find(node[i]).parent.value == Find(node[j]).parent.value && (a[i].col == color(0, 0, 255) && a[j].col == color(0, 0, 255)))
      {
        println("Blue Wins");
        exit();
      }
    }
  }

  for (int i = 0; i <= numOfCells * numOfCells - numOfCells; i += numOfCells) /* top edge for red */
  {
    for (int j = numOfCells - 1; j < numOfCells * numOfCells; j += numOfCells) /* bottom edge for red */
    {
      if (Find(node[i]).parent.value == Find(node[j]).parent.value && (a[i].col == color(255, 0, 0) && a[j].col == color(255, 0, 0)))
      {
        println("Red wins");
        exit();
      }
    }
  }
}/* GameOver function ends here */


void board()
{
  strokeWeight(1);
  stroke(1);
  /*vertex(width/2 + 491,height/2);
   vertex(width/2 - 491, height/2);
   vertex(width/2, height/2 - 302);
   vertex(width/2, height/2 + 302);
   vertex(width/2 + 491,height/2);*/
  /* Red top */
  fill(255, 0, 0);
  beginShape();
  vertex(width/2, height/2 - 287);
  vertex(width/2, height/2 - 264);
  vertex(width/2 - 454, height/2);
  vertex(width/2 - 491, height/2);
  vertex(width/2, height/2 - 287);
  endShape();
  /* Red bottom */
  beginShape();
  vertex(width/2, height/2 + 287);
  vertex(width/2, height/2 + 264);
  vertex(width/2 + 454, height/2);
  vertex(width/2 + 491, height/2);
  vertex(width/2, height/2 + 287);
  endShape();

  /* blue top */
  fill(0, 0, 255);
  beginShape();
  vertex(width/2, height/2 - 287);
  vertex(width/2, height/2 - 264);
  vertex(width/2 + 454, height/2);
  vertex(width/2 + 491, height/2);
  vertex(width/2, height/2 - 287);
  endShape();
  /* blue bottom */

  beginShape();
  vertex(width/2, height/2 + 287);
  vertex(width/2, height/2 + 264);
  vertex(width/2 - 454, height/2);
  vertex(width/2 - 491, height/2);
  vertex(width/2, height/2 + 287);
  endShape();
}

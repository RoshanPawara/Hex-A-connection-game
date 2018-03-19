int r=50;
hex[] a=new hex[121];
boolean Ai = false;

void setup()
{
  size(1366, 768);
  background(127);
  for (int i=0; i<121; i++) 
  {
    a[i]=new hex();
  }// this loop initializes all the hex objects
  int objectCount=0;
  for (int i=0; i<11; i++)  
  {
    for (int j=0; j<11; j++) 
    {
      a[objectCount].getData(width/2-430+i*r-i*7+j*43, height/2-i*r+i*r/2+j*25, r);
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

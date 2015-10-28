//Drop Dodger: Lucas Kern
//creates the flicker effect around the match
class Flicker
{
  //used for mouse coords
  float xLoc;
  float yLoc;

  //how big the biggest circle will be
  float lightW;

  //constructor that brings in mouse coords and lightW size
  Flicker(float xCenter, float yCenter, float rayWidth)
  {
    xLoc = xCenter;
    yLoc = yCenter;

    lightW = rayWidth;
  }

  void display()
  {
    noStroke();

    //makes a gradient of circles that shimmer and flicker
    for (float i = lightW; i > 0; i--)
    {
      fill(40, lightW - i, lightW - i);
      ellipse(mouseX, mouseY, i + random(10), i + random(15));
    }
  }
}


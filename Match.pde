//Drop Dodger: Lucas Kern
//handles the match and the animation
class Match
{
  PImage[] images;

  int imageCount;
  int frame;

  //constructor that brings in the name of the file and the number of frames
  Match(int count, String imagePrefix)
  {
    imageCount = count;
    images = new PImage[imageCount];

    //load each frame with Frame"1,2,3...".png filename
    for (int i = 0; i < imageCount; i++)
    {
      String fileName = "Frames/" + imagePrefix + i + ".png";
      images[i] = loadImage(fileName);
    }
  }

  void display(float xLoc, float yLoc, int frameMove)
  {
    //only transition frame after an alotted time
    if (frameCount % 10 == 0)
    {
      frame = (frame+frameMove) % imageCount;
    }
    image(images[frame], xLoc, yLoc);
  }
}


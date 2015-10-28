//Drop Dodger: Lucas Kern
//individual drop
//has all programming for moving, displaying, collsion, etc

class Drop
{

  float xLoc;
  float yLoc;
  
  //inputs H value for each drop
  float dropColor;

  float fallSpeed;

  Drop(float xStart, float yStart, float speed, float waterColor)
  {
    xLoc = xStart;
    yLoc = yStart;

    dropColor = waterColor;
    
    fallSpeed = speed;
  }

  //drops go to random locations off screen
  void reStart()
  {
    xLoc = random(width);
    yLoc = random(-4000, -20);
  }

  //moves a drop random(fallspeed) every frame
  void move()
  {
    yLoc = yLoc + random(fallSpeed);

    //when a drop goes off screen it sends it back to top with a random location 
    if (yLoc > height + 20)
    {
      yLoc = random(-4000, -20);
      xLoc = random(width);
    }
  }

  //effectively creates a box around mouse's loc and if a drop goes inside it this is triggered
  void collision()
  {
    if (xLoc <= mouseX + 20 && xLoc >= mouseX - 20 && yLoc <= mouseY + 20 && yLoc >= mouseY  - 20)
    {
      gameState = 0;
    }
  }

  //displays a drop with specified color and location
  void display()
  {
    noStroke();
    fill(dropColor, 200, 200, 150);
    ellipse(xLoc, yLoc, 20, 30);
  }
}


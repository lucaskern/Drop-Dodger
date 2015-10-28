//Drop Dodger: Lucas Kern
//An array of drop objects that creates and updates a specified number of drops
class Water
{
  Drop[] waterDrops;

  float dropSpeed;
  int difficulty;
  int dropNum;

  //brings in number of drops to be made and the speed of the drops
  Water(int difficulty, float speed)
  {
    dropSpeed = speed;
    dropNum = difficulty;

    //makes array of drops with difficulty(dropNum) of drops
    waterDrops = new Drop[dropNum];

    //like in the CellBot, goes through each space of array and updates/creates it
    for (int i = 0; i < dropNum; i++)
    {
      waterDrops[i] = new Drop(random(width + 100), random(-4000, -20), random(3, dropSpeed), 155);
    }
  }

  //like in the CellBot, goes through each space of array and updates/creates it
  void move()
  {
    for (int i = 0; i < dropNum; i++)
    {
      waterDrops[i].move();
    }
  }

  //like in the CellBot, goes through each space of array and updates/creates it
  void collision()
  {
    for (int i = 0; i < dropNum; i++)
    {
      waterDrops[i].collision();
    }
  }

  //like in the CellBot, goes through each space of array and updates/creates it
  void display()
  {
    for (int i = 0; i < dropNum; i++)
      waterDrops[i].display();
  }

  //like in the CellBot, goes through each space of array and updates/creates it
  void reStart()
  {
    for (int i = 0; i < dropNum; i++)
    {
      waterDrops[i].reStart();
    }
  }
}


//Drop Dodger: Lucas Kern
//handles majority of text and UI elements
class Menu
{

  void display()
  {
    //Title and box
    stroke(255);
    fill(255);
    //noFill();
    //rect(width / 7.5, height / 20, width / 1.39, height / 8);
    rect(width / 7.5, height / 20, width / 1.39, height / 1.1);

    textAlign(CENTER);
    fill(0);
    textFont(d, 100);
    text("DROP DODGER", width / 2, height / 7);

    //Instructions
    textFont(d, 50);
    text("Difficulty  Levels", width / 2, height / 4);
    textFont(d, 40);
    text("1 - Beginner", width / 2, height / 3.3);
    text("2 - Normal", width / 2, height / 2.8);
    text("3 - Hard", width / 2, height / 2.43);
    text("4 - Impossible", width / 2, height / 2.16);

    text(" s  to  resume", width / 2, height / 1.5);
    text("space  to  pause", width / 2, height / 1.7);
    text("r  to  restart", width / 2, height / 1.35);

    //Credits
    textFont(d, 30);
    text("Game Designed By: Lucas Kern", width / 2, height / 1.07);
  }

  void loseScreen()
  {


    //Title and box
    stroke(255);
    fill(255);
    //noFill();
    //rect(width / 7.5, height / 20, width / 1.39, height / 8);
    rect(width / 7.5, height / 20, width / 1.39, height / 1.1);

    //black lines to seperate score from rest of menu
    fill(0);
    noStroke();
    rect(0, height / 2.4, width, 2);
    rect(0, height / 1.6, width, 2);

    //text
    textAlign(CENTER);
    fill(0);
    textFont(d, 100);
    text("DROP DODGER", width / 2, height / 7);

    //Instructions
    textFont(d, 50);
    text("Difficulty  Levels", width / 2, height / 5);
    textFont(d, 30);
    text("1 - Beginner", width / 2, height / 4.3);
    text("2 - Normal", width / 2, height / 3.7);
    text("3 - Hard", width / 2, height / 3.25);
    text("4 - Impossible", width / 2, height / 2.9);

    textFont(d, 40);
    text(" s  to  resume", width / 2, height / 1.4);
    text("space  to  pause", width / 2, height / 1.32);
    text("r  to  restart", width / 2, height / 1.25);

    //Credits
    textFont(d, 30);
    text("Game Designed By: Lucas Kern", width / 2, height / 1.07);
  }

  void topBar()
  {
    fill(255);
    rect(0, 0, width, height / 30);
  }
}


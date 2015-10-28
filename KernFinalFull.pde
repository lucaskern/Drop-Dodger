/*
Drop Dodger by Lucas Kern!
 --------------------------
 In this game the goal is to avoid the falling rain drops and keep your match alive! 
 Try to get the highest score possbible and master the hardest levels!
 
 instructions
 ------------
 1 - 4 on menu, start game
 space, pauses game
 s, resumes game
 r, restarts to main menu
 mouse, controls match movement
 
 My experience
 -------------
 Writing this program was a very fun and informative experience. Before making
 this I wasnt confident I would be able to complete a program with all the required
 features. Now I have a lot more confidence in my ability to program and make
 actual content. I put a lot of effort into fixing bugs, and making sure things
 only worked when they were supposed to, thus increasing efficiency and polish.
 I will likely continue to add to and improve this program over break and into the 
 future.
 */

//initialize the necessary classes
Match m1;
Flicker f1;
Water w1;
Score s1;
Menu menu1;

//Used to bring in text for timer, events, menu
PFont f; //Aller
PFont d; //trench

//bring in the sound library and song
import ddf.minim.*;
Minim minim;
AudioPlayer rainDrops;

//Switches between states 0 (lose), 1 (playing), 2 (paused), and 3 (start menu)
int gameState = 3;

//How many drops there are, changes for different levels
int difficulty = 0;

//simply makes a score variable
int score = 0;

void setup()
{
  size(900, 900);
  colorMode(HSB);
  smooth();
  noCursor();

  //start minim engine and create sound file
  minim = new Minim(this);
  rainDrops = minim.loadFile("rainDrops.mp3");

  //initialize fonts
  f = loadFont("Aller-48.vlw");
  d = loadFont("Trench-Thin-120.vlw");

  //create a new match object with 6 frames named Match"i"
  m1 = new Match (6, "Match");

  //create Flicker at the head of the match with size width / 6
  f1 = new Flicker(mouseX, mouseY, width / 8);

  //new timer with frameCount for the timer update
  s1 = new Score(score);

  //new menu for start of game
  menu1 = new Menu();
}

void keyPressed()
{
  //Resume key only works when paused
  if (key == 's' && (gameState == 0 || gameState == 3 || gameState == 1))
  {
    //do nothing, resume only works when in pause state
  } else if (key == 's')
  {
    gameState = 1;
  }

  //Restart game to title menu
  if (key == 'r')
  {
    gameState = 3;
  
  } else if (gameState == 3 && key == ' ')    
  {
    //do nothing, fixes bug where pause was hit when game wasnt in play mode
  } else if (gameState == 0 && key == ' ')
  {
    //do nothing, fixes bug where pause was hit when game wasnt in play mode
  } 
  //pause game
  else if (key == ' ')
  {
    gameState = 2;
    rainDrops.pause();
  }


  //Pressing 1,2,3,4 starts a game at that difficulty level
  //Line below makes sure you cant press any start buttons when you're not supposed to
  if ((gameState == 1 || gameState == 2) && (key == '1' || key == '2' || key == '3' || key == '4'))
  {
    // do nothing
  } else if (key == '1')
  {
    difficulty = 100;
    gameState = 1;
    w1 = new Water(difficulty, 10);
  } else if (key == '2')
  {
    difficulty = 500;
    gameState = 1;
    w1 = new Water(difficulty, 10);
  } else if (key == '3')
  {
    difficulty = 300;
    gameState = 1;
    w1 = new Water(difficulty, 20);
  } else if (key == '4')
  {
    difficulty = 10000;
    gameState = 1;
    w1 = new Water(difficulty, 10);
  }
}

void draw()
{
   background(0);

  //Lose menu
  if (gameState == 0)
  {
    //shows score and dynamic message
    menu1.loseScreen();

    //Set score to 0 for next game and show score of last game
    s1.scoreReset();
    s1.showScore();

    //resets drops randomly
    w1.reStart();

    //Sets song to beginning and pauses it
    rainDrops.cue(0);
    rainDrops.pause();
  }

  //Playing mode
  if (gameState == 1)
  {
    //Display light flicker and start match animation, makes them move with the mouse. 
    f1.display();
    m1.display(mouseX - 100, mouseY - 50, 1);

    //Move drops and detects collisions
    w1.move();
    w1.collision();
    w1.display();

    //Start timer
    s1.scoreGo();

    //Play song and make it loop
    rainDrops.play();

    //background visuals
    //e1.grid();
  }

  //Game paused
  if (gameState == 2)
  {
    //pauses score keeper, drops, and makes match disappear (to prevent cheating)
    s1.pause();
    w1.display();
  }

  //Game start menu
  if (gameState == 3)
  {
    //restart score count
    s1.scoreReset();

    //display titles
    menu1.display();

    //reset and stop song
    rainDrops.cue(0);
    rainDrops.pause();
  }

  //draw two white bars on the sides of the screens
  fill(255);
  rect(0, 0, width / 100, height);
  rect(width - width / 100, 0, width / 100, height);

  //shows the hitbox for the match (for testing purposes)
  /*
  rectMode(CENTER);
   rect(mouseX, mouseY, 20, 20);
   rectMode(CORNER);
   */
}


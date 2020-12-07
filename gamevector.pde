int mode;
int score;
int countdown;
int timer;


final int INTRO = 0;
final int GAME = 1;
final int PAUSE = 2;
final int GAMEOVER = 3;
final int GAMEWIN = 4;


Spaceship myShip;


ArrayList<GameObject> myObjects;

boolean wkey, akey, skey, dkey, spacekey, inv, offScreen;

void setup() {

  mode = INTRO;
  timer = 450;


  size(800, 800);
  myShip = new Spaceship();


  rectMode(CENTER);
  wkey = akey = skey = dkey = spacekey = false;


  myObjects = new ArrayList<GameObject>();
  myObjects.add(new Asteroid());
  myObjects.add(new Asteroid());
  myObjects.add(new Asteroid());
  myObjects.add(new Asteroid());
  myObjects.add(new Asteroid());
}

void draw() {

  if (mode == INTRO) {
    intro();
  } else if (mode == GAME) {
    game();
  } else if (mode == PAUSE) {
    pause();
  } else if (mode == GAMEOVER) {
    gameover();
  } else if (mode == GAMEWIN) {
    gamewin();
  } else {
    println("Error: Mode = " + mode);
  }
}

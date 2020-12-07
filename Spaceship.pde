class Spaceship extends GameObject {

  //1. instance vairables
  PVector direction;
  PVector loc;
  PVector velocity;
  float size;
  int lives;
  int shotTimer, threshhold, invTimer;

  //2. contructors

  Spaceship() {
    loc = new PVector(width/2, height/2);
    velocity = new PVector(0, 0);
    direction = new PVector(0.1, 0);
    size = 50;
    lives = 3;
    score = 0;
    shotTimer = 0;
    threshhold = 25;
    inv = true;
    invTimer = 100;
  }

  //3. behaviour functions
  void show() {
    pushMatrix();
    if (inv == true) {
      fill(255);
    } else {
      fill(0);
    }
    stroke(255);
    translate(loc.x, loc.y);
    rotate(direction.heading());
    triangle(-20, -20, -20, 20, 50, 0);
    triangle(-10, -10, -10, 10, 30, 0);
    ellipse(0, 0, 10, 10);
    popMatrix();
  }

  void act() {

    shotTimer++;

    if (dkey) direction.rotate(radians(5));
    if (akey) direction.rotate(-radians(5));
    if (wkey) {
      velocity.add(direction);
      for (int i = 0; i < 15; i++)myObjects.add(new Fire());
    }
    if (skey) velocity.sub(direction);
    if (spacekey && shotTimer > threshhold) {
      myObjects.add(new Bullet());
      shotTimer = 0;
    }
    if (inv == true) {
      invTimer--;
    }
    if (invTimer < 0) {
      invTimer = 60;
      inv = false;
    }

    //x = x + vx;
    //y = y + vy;
    loc.add(velocity);

    if (loc.x > 850) loc.x = -50;
    if (loc.x < -50) loc.x = 850;
    if (loc.y > 850) loc.y = -50;
    if (loc.y < -50) loc.y = 850;

    if (velocity.mag() >= 7) {
      velocity.setMag(5);
    }

    countdown++;
    if (countdown>60) {
      countdown=0;
    }


    int i = 0;
    println(myObjects.size());
    while (i < myObjects.size()) {
      GameObject obj = myObjects.get(i);
      if (obj instanceof Asteroid || obj instanceof UFO || obj instanceof Bullet && obj.ufobullet) {
        if (dist(loc.x, loc.y, obj.loc.x, obj.loc.y) <= size/2 + obj.size) {
          if (obj.Astinv == false) {
            obj.lives--;
          }
          if (inv == false) {
            lives--;
          }
          if (obj.ufobullet == false && obj.Astinv == false) {
            score++;
          }
          inv = true;

          if (obj.size > 30) {
            myObjects.add(new Asteroid((int)size/2, loc.x, loc.y));
            myObjects.add(new Asteroid((int)size/2, loc.x, loc.y));
          }
        }
      }

      i++;
    }
    if (myShip.lives <= 0) {
      mode = GAMEOVER;
    }
    if (score >= 15) {
      if (lives > 0) {
        mode = GAMEWIN;
      }
    }
  }
}

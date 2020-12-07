class UFO extends GameObject {
  //Instance Variables:
  int x;
  int shotTimer, threshhold;

  UFO() {

    lives = 3;
    shotTimer = 0;
    threshhold = 100;
    x = (int)random(4);

    if (x == 0) {
      loc = new PVector(random(width), 0);
      velocity = new PVector(0, 2);
    } else if (x == 1) {
      loc = new PVector(random(width), height);
      velocity = new PVector(0, -2);
    } else if (x == 2) {
      loc = new PVector(0, (random(height)));
      velocity = new PVector(2, 0);
    } else if (x == 3) {
      loc = new PVector(width, (random(height)));
      velocity = new PVector(-2, 0);
    }
  }

  void show() {
    fill(255, 0, 0);
    stroke(255);
    strokeWeight(3);
    ellipse(loc.x, loc.y, 50, 50);
  }

  void act() {
    super.act();
    shotTimer++;
    if (loc.x < 0 || loc.x > width || loc.y < 0 || loc.y > height) {
      lives = 0;
    }
    if (shotTimer > threshhold) {
      myObjects.add(new Bullet(loc.x, loc.y, myShip.loc.x-loc.x, myShip.loc.y-loc.y));
      shotTimer = 0;
    }
    int i = 0;
    println(myObjects.size());
    while (i < myObjects.size() ) {
      GameObject obj = myObjects.get(i);
      if (obj instanceof Bullet  && obj.ufobullet == false) {
        if (dist(loc.x, loc.y, obj.loc.x, obj.loc.y) <= 25 + obj.size) {
          obj.lives = 0;
          lives = 0;

          for (int j=0; j<random(10, 20); j++) myObjects.add(new Particles(loc.x, loc.y));
        }
      }
      i++;
    }
  }
}

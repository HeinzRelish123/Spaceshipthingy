class Asteroid extends GameObject {

  //1 Instance variables (in gameObject)
  int AstinvTimer;

  //2. Constructors

  Asteroid() {

    loc = new PVector(random(width), random(height));
    velocity = new PVector(1, 1);
    velocity.rotate(random(1, TWO_PI)); 
    size = 50;
    lives = 1;
    Astinv = false;
  }

  Asteroid(int s, float x, float y) {
    lives = 1;
    loc = new PVector (x, y);
    velocity = new PVector(1, 1);
    velocity.rotate(random(1, TWO_PI)); 
    size = s;
    Astinv = true;
    AstinvTimer = 45;
  }

  //3. Behaviour Functions

  void show() {
    super.show();
  }
  void act() {
    super.act();

    if (Astinv == true) {
      AstinvTimer--;
    }
    if (AstinvTimer < 0) {
      AstinvTimer = 60;
      Astinv = false;
    }

    int i = 0;
    println(myObjects.size());
    while (i < myObjects.size() ) {
      GameObject obj = myObjects.get(i);
      if (obj instanceof Bullet  && obj.ufobullet == false) {
        if (dist(loc.x, loc.y, obj.loc.x, obj.loc.y) <= size/2 + obj.size) {
          obj.lives = 0;
          if (Astinv == false) {
            lives = 0;
            score++;
          }


          if (size > 30) {
            myObjects.add(new Asteroid((int)size/2, loc.x, loc.y));
            myObjects.add(new Asteroid((int)size/2, loc.x, loc.y));
          }

          for (int j=0; j<random(10, 20); j++) myObjects.add(new Particles(loc.x, loc.y));
        }
      }
      i++;

      if (loc.x > 825) loc.x = -25;
      if (loc.x < -25) loc.x = 825;
      if (loc.y > 825) loc.y = -25;
      if (loc.y < -25) loc.y = 825;
    }
  }
}

class Bullet extends GameObject {

  //1 Instance variables (in gameobject)


  //2. Constructors

  Bullet() {

    loc = new PVector(myShip.loc.x, myShip.loc.y);
    velocity = new PVector(myShip.direction.x, myShip.direction.y);
    velocity.setMag(20);
    size = 10;
    lives = 1;
    ufobullet = false;
  }

  Bullet(float locationx, float locationy, float velocityx, float velocityy) {
    
    loc = new PVector(locationx, locationy);
    velocity = new PVector(velocityx, velocityy);
    velocity.setMag(15);
    size = 10;
    lives = 1;
    ufobullet = true;
  }

  //3. Behaviour Functions
  void show() {
    super.show();
  }

  void act() {
    super.act();
    if (loc.x < 0 || loc.x > width || loc.y < 0 || loc.y > height) {
      lives = 0;
    }
  }
}

class Fire extends GameObject {
  int t;
  Fire() {
    loc = myShip.loc.copy();
    velocity = myShip.direction.copy();
    velocity.rotate(radians(180) + random (-0.1, 0.1));
    velocity.setMag(5);
    size = 1;
    lives = 1;
    t=200;
  }

  void show() {
    noStroke();
    fill(255, t);
    rect(loc.x, loc.y, size, size);
  }

  void act() {
    super.act();
    offScreen();
  }
}

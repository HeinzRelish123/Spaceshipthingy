class GameObject {
  PVector loc;
  PVector velocity;
  float size;
  int lives;
  boolean ufobullet, Astinv;

  GameObject() {
  }

  void show() {
    strokeWeight(3);
    stroke(255);
    fill(0);
    ellipse(loc.x, loc.y, size, size);
  }
  void act() {
    loc.add(velocity);
  }
  void offScreen() {
    if (loc.x < 0 || loc.x > width || loc.y <0 || loc.y > height) lives = 0;
  }
}

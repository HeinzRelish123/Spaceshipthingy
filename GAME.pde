void game() {
  timer++;

  background(0);
  myShip.show();
  myShip.act();

  if (inv == true) {
    textSize(30);
    text("You Are Currently Invincible", 400, 395);
  }
  textSize(10);
  fill(255);
  text("Score: " + score, 25, 25);
  text("Lives: " + myShip.lives, 25, 35);
  textSize(20);
  text("Click Anywhere to Pause", 400, 745);
  fill(0);



  int i = 0;
  while (i<myObjects.size()) {
    GameObject obj = myObjects.get(i); //get obj
    if (obj.lives > 0) {
      obj.show();
      obj.act();

      i++;
    } else myObjects.remove(i);
  } 
  if (timer == 850) {
    myObjects.add(new UFO());
    timer = 0;
  }
}

void gameClicks() {
  if (mouseX > 0 && mouseY > 0) {
    mode = PAUSE;
  }
}

void gameover() {
  background(255, 0, 0);
  fill(0);
  textSize(30);
  text("CLICK ANYWHERE TO RESTART", 400, 390);
  textSize(20);
  text("YOUR SCORE: " + score, 400, 425);
}

void gameoverClicks() {
  if (mouseX > 0 && mouseY > 0) {
    mode = INTRO;
  }
}

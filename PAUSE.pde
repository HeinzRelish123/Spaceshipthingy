void pause() {
  background(100);
  fill(0);
  textSize(50);
  text("PAUSED", 400, 380);
  textSize(20);
  text("Click Anywhere To Resume", 400, 545);
}

void pauseClicks() {
  if (mouseX > 0 && mouseY > 0) {
    mode = GAME;
  }
}

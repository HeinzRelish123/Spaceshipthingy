int x, y;


void intro() {
  setup();

  background(0);
  fill(0);
  rect(400, 260, 550, 200);
  fill(255);
  textAlign(CENTER, CENTER);
  textSize(100);
  text("SPACESHIP", 400, 250);
  

  if (mouseX > 200 && mouseY > 475 && mouseX < 600 && mouseY < 575) {
    fill(100);
    strokeWeight(6);
    stroke(255);
    textSize(25);
    fill(255);
    text("By Jack :3", 740, 690);
    fill(100);
  } else {
    fill(255);
    strokeWeight(2);
    stroke(100);
  }
  textSize(50);
  rect(400, 525, 400, 100);
  fill(0);
  text("START", 400, 520);
}

void introClicks() {

  if (mouseX > 200 && mouseY > 475 && mouseX < 600 && mouseY < 575) {
    mode = GAME;
  }
}

void gamewin() {
  background(0, 255, 0);
  fill(0);
  textSize(40);
  text("You Won!", 400, 390);
  textSize(20);
  text("Click Anywhere to Continue", 400, 430);
  
}
void gamewinClicks() {
  if (mouseX > 0 && mouseY >0) {
   mode = INTRO; 
  }
}

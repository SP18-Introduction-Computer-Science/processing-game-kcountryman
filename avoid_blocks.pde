float x = 360;
float y = random(0, 720);
float y2 = random(0, 720);
float y3 = random(0, 720);
float x2, x3;

boolean game_over = false;
PFont f;


void setup() {
  size(720, 720);
  background(255);
  f = createFont("Times New Roman", 25, true);
}
void randomrect(float rx, float ry, float rx2, float ry2, float rx3, float ry3) {
  fill(0);
  if (frameCount>60) {
    rect(rx2, ry2, 40, 40);
  }
  if (frameCount>120) {
    rect(rx3, ry3, 40, 40);
  }
  rect(rx, ry, 40, 40);
}
 
void gameover(float squarex, float squarey) {
  if (((mouseY>squarey) && (mouseY<squarey+40) && (squarex <= 80) && (squarex >= 0)) || ((mouseY+40>squarey) && (mouseY+40<squarey+40) && (squarex <= 80) && (squarex >= 0))) {
    textFont (f, 25);
    fill(255, 0, 0);
    text("GAME OVER", 140, 160);
    game_over= true;
  }
}
void draw() {
  if (game_over == false) { // if not game over do
    println(y, y2, y3);
    background(255);
    noStroke();
    fill(200, 0, 0);
    rect(40, mouseY, 40, 40);
    x = x - 2;
    x2 = x2 -3;
    x3 = x3 -1;
    if ( x<  -40) {
      x = 720;
      y = random(0, 720);
    }
    if ( x2<  -40) {   
      x2 = 720;
      y2 = random(0, 720);
    }
    if ( x3<  -40) {
      x3 = 720;
      y3 = random(0, 720);
    }
    randomrect(x, y, x2, y2, x3, y3); // draw square
    gameover(x, y);
    gameover(x2, y2);
    gameover(x3, y3);
  }
}
void mousePressed() { // if ckliked reset program
  if (mouseButton == LEFT) {
    if (game_over == true) { // if game over reset all
      x = x2 = x3 = 720;
      y = random(0, 720);
      y2 = random(0, 720);
      y3 = random(0, 720);
      game_over = false;
    }
  }
  if (mouseButton == RIGHT) { // if clicked exit program
    exit();
  }
}
// Coding Rainbow
// Daniel Shiffman
// http://patreon.com/codingtrain
// Code for: https://youtu.be/kKT0v3qhIQY

class Leaf {
  PVector pos;
  PVector posmov;
  PVector xy;
  boolean reached = false;
  float dir1;
  float dir2;
  float tier1 = 60;
  float tier2 = 200;
  float tier3 = 400;


  Leaf(int gen) {
    pos = PVector.random2D();
    pos.normalize();
    if (gen<tier1) {
      pos.mult(random(50,100));
    } else if (gen<tier2 && gen>tier1) {
      pos.mult(random(200,300));
    }
    if (gen>tier2) {
      pos.mult(random(400,500));
    }
    posmov = pos.copy();
    posmov.add(width/2,height/2);
  }

  void reached() {
    reached = true;
  }

  void show() {
    fill(0,0,0);
    noStroke();
    ellipse(posmov.x, posmov.y, 4, 4);
  }

}

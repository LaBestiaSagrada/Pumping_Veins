// Coding Rainbow
// Daniel Shiffman
// http://patreon.com/codingtrain
// Code for: https://youtu.be/kKT0v3qhIQY

class Branch {
  Branch parent;
  PVector pos;
  PVector dir;
  int count = 0;
  PVector saveDir;
  float len = 10;
  float size = 0.14;
  float col = 0;
  int gen;

  Branch(PVector v, PVector d) {
    parent = null;
    pos = v.copy();
    dir = d.copy();
    saveDir = dir.copy();
  }

  Branch(Branch p,int gene) {
    parent = p;
    pos = parent.next();
    dir = parent.dir.copy();
    saveDir = dir.copy();
    gen = gene;
    size *= gen;
    if(size>6){size=5;}
    col  = gen;
  }

  void reset() {
    count = 0;
    dir = saveDir.copy();
  }

  PVector next() {
    PVector v = PVector.mult(dir, len);
    PVector next = PVector.add(pos, v);
    return next;
  }
}

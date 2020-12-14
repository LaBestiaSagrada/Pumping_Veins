// Coding Rainbow
// Daniel Shiffman
// http://patreon.com/codingtrain
// Code for: https://youtu.be/kKT0v3qhIQY

Tree tree1;
Tree tree2;
float min_dist = 20;
float max_dist = 400;
ArrayList<Tree> trees = new ArrayList<Tree>();
int num = -1;
int cantidad = 3;

void setup() {
  size(600, 600);
  colorMode(HSB,50);
  for (int i = 0; i <=cantidad; i++) {
    trees.add(new Tree(int(random(0,2))));
  }
}

void draw() {
  
  background(0);
  for (Tree t : trees) {
    t.grow();
    t.show();
  }
  for (int i = trees.size()-1; i >= 0; i--) {
    Tree t = trees.get(i);
    if (t.dleaves > t.cantidad - 12) {
      trees.set(i, new Tree(int(random(0,2))));
      num++;
    }
  }
    //println(frameRate);
}

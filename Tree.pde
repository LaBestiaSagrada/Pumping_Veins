class Tree {
  ArrayList<Branch> branches = new ArrayList<Branch>();
  ArrayList<Leaf> leaves = new ArrayList<Leaf>();
 
  int dleaves = 0;
  
  int gen = 0;
  int gen2 = 0;
  int roa;
  
  int count = 0;
  PVector startPos;
  float cantidad = 1000;
  
  Tree(int aaa) {
    cantidad = random(150, 800);
    startPos = new PVector(random(width), random(height));
    roa = aaa;
    for (int i = 0; i < cantidad; i++) {
      leaves.add(new Leaf(gen2));
      gen2++;
    }
    Branch root = new Branch(startPos, PVector.random2D());
    branches.add(root);
    Branch current = new Branch(root, 0);

    while (!closeEnough(current)) {
      Branch trunk = new Branch(current, gen);
      branches.add(trunk);
      current = trunk;
    }
  }

  boolean closeEnough(Branch b) {

    for (Leaf l : leaves) {
      float d = PVector.dist(b.pos, l.posmov);
      if (d < max_dist) {
        return true;
      }
    }
    return false;
  }

  void grow() {
    gen++;
    for (Leaf l : leaves) {
      Branch closest = null;
      PVector closestDir = null;
      float record = -1;

      for (Branch b : branches) {
        PVector dir = PVector.sub(l.posmov, b.pos);
        float d = dir.mag();
        if (d < min_dist) {
          l.reached();
          closest = null;
          break;
        } else if (d > max_dist) {
        } else if (closest == null || d < record) {
          closest = b;
          closestDir = dir;
          record = d;
        }
      }
      if (closest != null) {
        closestDir.normalize();
        closest.dir.add(closestDir);
        closest.count++;
      }
    }

    for (int i = leaves.size()-1; i >= 0; i--) {
      if (leaves.get(i).reached) {
        leaves.remove(i);
        dleaves++;
      }
    }

    for (int i = branches.size()-1; i >= 0; i--) {
      Branch b = branches.get(i);
      if (b.count > 0) {
        b.dir.div(b.count);
        b.dir.normalize();
        Branch newB = new Branch(b, gen);
        branches.add(newB);
        if (i>=250) {
          branches.remove(i-250);
        }
        b.reset();
      }
    }
  }

  void show() {
    //for (Leaf l : leaves) {
    //  l.show();
    //}
    
    for (Branch b : branches) {
      if (b.parent != null) {
        switch(roa) {
        case 0: 
          stroke(0, 50, 50, 25+b.gen-gen);
          break;
        case 1:
          stroke(33.3, 50, 50, 20+b.gen-gen);
          break;
        }
        strokeWeight(8-b.size);
        line(b.pos.x-2*b.dir.x, b.pos.y-2*b.dir.y, b.parent.pos.x, b.parent.pos.y);
      }
    }
  }
}

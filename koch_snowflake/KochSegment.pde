class KochSegment {
  PVector a;
  PVector b; 
 
  KochSegment(PVector a_, PVector b_) {
    a = a_.copy();
    b = b_.copy();
  }
  
  void show() {
    line(a.x, a.y, b.x, b.y); 
  }
 
  KochSegment[] generate(int apexCoefficient) {
    /*   
        Divides a line into four equal segments
        like this:
        ---   ~>   -^-  
        
        apex coefficient determines whether
        the point will face up or down
    */
    
    KochSegment[] children = new KochSegment[4];
    
    
    // convert segment to a vector to work with it
    PVector v = PVector.sub(b, a);
    v.div(3);
    
    // leftSide
    PVector leftSide_b = PVector.add(a, v);
    children[0] = new KochSegment(a, leftSide_b);
      
    // rightSide
    PVector rightSide_a = PVector.sub(b, v);
    children[3] = new KochSegment(rightSide_a, b);

    // apex
    v.rotate(apexCoefficient * PI / 3); // 60 degrees
    PVector apex = PVector.add(leftSide_b, v);
    children[1] = new KochSegment(leftSide_b, apex);
    children[2] = new KochSegment(apex, rightSide_a);
    
    return children;
  }
}

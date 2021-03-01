class Magnet {
  PVector[] P;
  float I;
  PVector p;
  float r;
  Magnet(float l, PVector p, float r, int N) {
    this.p=p;

    this.r=r;
    I=1;

    P = new PVector[10000];
    for (int i=0; i<P.length; i++) {
      float fi=N*i*2*PI/P.length;
      P[i]= new PVector(r*cos(fi)+p.x, r*sin(fi)+p.y, l*i/P.length - l/2 + p.z);
    }
  }
  PVector getB(PVector m) {
    PVector dl;
    PVector B=new PVector ();
    for (int i=0; i<P.length-1; i++) {
      dl = PVector.sub(P[i], P[i+1]);
      PVector r = PVector.sub(m, P[i]);
      PVector dB = dl.cross(r);
      dB.mult(mi*I/(4*PI*pow(r.mag(), 3)));
      B.add(dB);
    }
    return B;
  }

  void setI(float i) {
    I = i;
  }
  void draw() {
    fill(255,0,255);
    ellipse(p.x*mtp, p.y*mtp, mtp*2*r, mtp*2*r);
  }
}
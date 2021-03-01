class Loptica {
  PVector p;//olozaj;
  float R;//poluprecnik;
  PVector v;//brzina;
  PVector krajnji;
  Loptica() {
    R=0.01;
    p= new PVector (0.25, 0.25, R);
    v=new PVector (0, 0, 0);
  }

  void draw() {
    fill(0, 255, 0);
    ellipse(p.x*mtp, p.y*mtp, mtp*2*R, mtp*2*R);
  }

  void update() {
    v.add(applyF());
    PVector dv = v.copy();
    dv.mult(dt);
    p.add(dv);
  }

  PVector applyF() {
    int N=5;
    float dh=PI*R/N;
    PVector Fun = new PVector(0, 0, 0);
    for (float Fi=0; Fi<PI; Fi+=PI/N) {
      float r=R*sin(Fi);
      float dl=2*PI*r/N;
      PVector F= new PVector(0, 0, 0);
      for (float teta = 0; teta<TWO_PI; teta+=2*PI/N) {
        PVector a = new PVector(r*cos(teta), r*sin(teta), R*cos(Fi));
        PVector n = new PVector(a.x/a.mag(), a.y/a.mag(), a.z/a.mag());
        PVector B = new PVector(0, 0, 0);
        for (int g=0; g<Magneti.length; g++) {
          B.add(Magneti[g].getB(PVector.add(lopta.p, a)));
        }
        float Konst= dl*dh/mi;
        PVector dF1=B.cross(n);
        PVector dF=dF1.cross(B);
        dF.mult(Konst);
        F.add(dF);
      }
      Fun.add(F);
    }
    Fun.mult(1e6f);
    Fun.z=0;
    Fun.y=0;
    /*println(Fun);*/
    return Fun;
  }

  void setF(float F3) {
    if (F3>0) {
      Magneti[0].setI(0);
      Magneti[1].setI(1);
      PVector F2= applyF();
      Magneti[1].setI(sqrt(1*F3/F2.mag()));
      
    } else {
      Magneti[0].setI(1);
      Magneti[1].setI(0);
      PVector F1= applyF();
      Magneti[0].setI(sqrt(-F3/F1.mag()));
    }
  }
  
  
  
    
  
  
}
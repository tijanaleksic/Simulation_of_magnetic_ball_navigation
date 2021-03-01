float mi=PI*4e-7f;
int mtp=1000;
Magnet[] Magneti;
Loptica lopta;
PVector a, b;
float dt = 2;
void setup() {
  size(500, 500);
  Magneti =new Magnet[2];
  //Magneti[0]=new Magnet(0.2, new PVector(0.2, 0.25, -0.15), 0.01, 1000);
  Magneti[0]=new Magnet(0.2, new PVector(0.1, 0.25, -0.15), 0.025, 1000);
  //Magneti[1]=new Magnet(0.2, new PVector(0.1, 0.4, -0.15), 0.025, 1000);
  Magneti[1]=new Magnet(0.2, new PVector(0.4, 0.25, -0.15), 0.025, 1000);
  //Magneti[3]=new Magnet(0.2, new PVector(0.4, 0.4, -0.15), 0.025, 1000);
  //Magneti[0].setI(1);
  //Magneti[1].setI(1);
  //Magneti[2].setI(1);
  //Magneti[3].setI(1);
  lopta= new Loptica();
}
void draw() {
  background(255);
  //lopta.setF(1);
  lopta.update();
  for (int i=0; i<Magneti.length; i++) {
    Magneti[i].draw();
  }
  float rastojanje;
  float krajnje=0.29;
  float kp=0.2;
  rastojanje=krajnje-lopta.p.x;
  println(rastojanje /*, kp*rastojanje, krajnje, lopta.p.x*/);
  lopta.setF(kp*rastojanje);
  
  line(krajnje*mtp,0,krajnje*mtp,500);
  /*
  for (int j=0; j<25; j++) {
   for (int i = 0; i <25; i++) {
   float x= map(i, 0, 25, 0, 0.5);
   float y= map(j, 0, 25, 0, 0.5);
   PVector a= new PVector(x, y);
   PVector b= new PVector(0, 0);
   for (int k=0; k<Magneti.length; k++) {
   b.add(Magneti[k].getB(a));
   }
   
   b.normalize();
   //b.mult(1e5f);
   line(a.x*mtp, a.y*mtp, b.x*10+a.x*mtp, b.y*10+a.y*mtp);
   ellipse(a.x*mtp+b.x*10, b.y*10+mtp*a.y, 2, 2);
   }
   }*/
  lopta.draw();
}
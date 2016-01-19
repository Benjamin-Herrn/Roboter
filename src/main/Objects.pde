class Objects {
  int _form;
  ArrayList<PVector> punkte = new ArrayList<PVector> ();
  int click = 0;
  
  void add(int x,int y){
    PVector p = new PVector(x,y);
    punkte.add(p);
  }
  void drawrect(){
    anzahl = punkte.size();    
    if (mousePressed && click == 0){
    objects.add(mouseX,mouseY);
    click = 1;
    }
    if (!mousePressed) {click = 0;}
    if (anzahl == 2){
    pg.beginDraw();
    pg.rectMode(CORNERS);  
    pg.rect(punkte.get(0).x,punkte.get(0).y,punkte.get(1).x,punkte.get(1).y);
    pg.endDraw();
    punkte.remove(0);
    punkte.remove(0);
    }
  }
    void drawellipse(){
    anzahl = punkte.size();   
    if (mousePressed && click == 0){
    objects.add(mouseX,mouseY);
    click = 1;
    }
    if (!mousePressed) {click = 0;}
    if (anzahl == 2){
    pg.beginDraw();
    pg.ellipseMode(CORNERS);
    pg.ellipse(punkte.get(0).x,punkte.get(0).y,punkte.get(1).x,punkte.get(1).y);
    pg.endDraw();
    println(punkte.get(0).x,punkte.get(0).y,punkte.get(1).x,punkte.get(1).y);
    punkte.remove(0);
    punkte.remove(0);
    }
  }
}
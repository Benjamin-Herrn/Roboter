float alpha = 90;         //winkel am manfang auf 90grad gesetzt(senkrecht)
float rx,ry;              //mitte koordinaten
float px,py;              //vectorwerte
float sx,sy;              //spitzen koordinaten
int show = 0;             // show variable eingefuehrt (damit er erst beim kliocken erscheint)
int anzahl = 0;
int lock = 0;             //variable um punkte eines objektes immer paarweise zu bekommen
PGraphics pg;            //image erstellt
int proofx,proofy;

void setup(){
  size(1000,1000);
  frameRate(100);
  ellipseMode(CENTER);
  background(200);
  pg = createGraphics(displayWidth, displayHeight);
}

class Robot {
  float _r = 50;          //radius auf 50 pixel
  int _vr,_vl;            //geschwindigkeit der raeder
  PVector p = new PVector(px,py);  //neuer vector erstellt
  void drive (int vl,int vr){      //drive funktion erstellt
    _vr = vr;                      
    _vl = vl;                        //geschwindigkeiten in funktion der eigenschaft geschwindigkeit angepasst
    rx = rx + cos(alpha*PI/180.0) * (_vr/100.0 + _vl/100.0)/2.0;  //neue koordinaten fuer roboter beim fahren berechnen: je nach ausrichtung unterschiedlich weit in x-richtung (cos)(gl;eiches fuer y - sin);
    ry = ry - sin(alpha*PI/180.0) * (_vr/100.0 + _vl/100.0)/2.0;  // geschwindigkeit ist arithmetisches mittel aus radgeschwindigkeiten
    alpha = alpha + (_vr -_vl)/(_r*3.6);                    //neuer winkel zum drehen erforderlich --> differenz der Geschwindigkeiten * faktor / faktor = ?
   }
}

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

void proof(){
for (int i = 0; i < 360;  i = i+1){   proofx = round(rx+(robot._r+1)*cos(alpha*PI/180.0));  
    proofy = round(ry-(robot._r+1)*sin(alpha*PI/180.0));
  if (get(proofx,proofy) == #FFFFFF ){println("hi");}
    println(proofx,proofy);
  }
}


Robot robot = new Robot();                    //neue instanz der klasse erzeugt
Objects objects = new Objects();
void draw(){
  background(200);
  image(pg,0,0);
  if (keyPressed){if (key == ' '){show = 1;}}      //wenn klick dann soll roboter gezeigt werden    
  if (show == 1){

    px = (robot._r*cos(alpha*PI/180.0));
    py = (robot._r*sin(alpha*PI/180.0));
    if (keyPressed){if (key == ' '){
      rx = (mouseX);                        //roboter bei klick auf position des cursers gesetzt
      ry = (mouseY);
      }}
    sx = rx+robot._r*cos(alpha*PI/180.0);      //neue ausrichtung des roboters --> spitze neu berechnen (siehe rx) 
    sy = ry-robot._r*sin(alpha*PI/180.0);  

    ellipse(rx,ry,2*(robot._r+1),2*(robot._r+1));
    fill(255);
    stroke(2);
    ellipse(rx,ry,2*robot._r,2*robot._r);    //ellipse mit mittelpunkt und ausdehnung(doppelter radius)
    line(rx,ry,sx,sy);                  //linie die richtung anzeigt
 
    if (keyPressed){
      if (key == 'w') {                      //drive funktion mit geschwindigkeit aufgerufen
        robot.drive(100,0);
      }  
    }
    
  if (rx-robot._r <= 0){rx=0+robot._r;}                //wenn roboter an wand faehrt soll er nicht weiter fahren
    if (rx+robot._r >= width){rx=width-robot._r;}
    if (ry-robot._r <= 0){ry=0+robot._r;}
    if (ry+robot._r >= height){ry=height-robot._r;}
  }

proof();

  if (keyPressed){
  if (key == 'r'){
    lock = 1;
    cursor(CROSS);
    objects.drawrect();
    if (anzahl != 1){lock = 0;}
  }
  if (key == 'e'){
    cursor(CROSS);
    objects.drawellipse();
  }
  }
  if (lock != 1){if(!keyPressed){cursor(ARROW);}}
  }
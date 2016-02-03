float alpha = 90;         //winkel am manfang auf 90grad gesetzt(senkrecht)
float rx,ry;              //mitte koordinaten
float px,py;              //vectorwerte
float sx,sy;              //spitzen koordinaten
int show = 0;             // show variable eingefuehrt (damit er erst beim kliocken erscheint)
int anzahl = 0;
int lock = 0;             //variable um punkte eines objektes immer paarweise zu bekommen
int proofx,proofy;

void setup(){
  size(1000,1000);
  frameRate(100);
  ellipseMode(CENTER);
  background(200);
}


Robot robot = new Robot();                    //neue instanz der klasse erzeugt
Objects objects = new Objects();
void draw(){
 // println(get(mouseX,mouseY)==color(0,0,0));
  println(robot.kollision);
  background(200);
  objects.ShowObjects();
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
}
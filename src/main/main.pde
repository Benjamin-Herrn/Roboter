float alpha = 90;         //winkel am manfang auf 90grad gesetzt(senkrecht)
float rx,ry;              //mitte koordinaten
float px,py;              //vectorwerte
float sx,sy;              //spitzen koordinaten
int show = 0;             // show variable eingefuehrt (damit er erst beim kliocken erscheint)
int proofx,proofy;

void setup(){
  size(600,600);
  frameRate(100);
  ellipseMode(CENTER);
  background(200);
}


Robot robot = new Robot();                    //neue instanz der klasse erzeugt
Objects objects = new Objects();
void draw(){
  background(200);
  objects.ShowObjects();
  if (keyPressed){if (key == ' '){show = 1;}}      //wenn klick dann soll roboter gezeigt werden    
  if (show == 1){
    robot.show();
 
  if (keyPressed){
    if (key == 'w') {                      //drive funktion mit geschwindigkeit aufgerufen
      robot.drive(20,30);
    }  
  }   
    //if (rx-robot._r <= 0){rx=0+robot._r;}                //wenn roboter an wand faehrt soll er nicht weiter fahren
    //if (rx+robot._r >= width){rx=width-robot._r;}
    //if (ry-robot._r <= 0){ry=0+robot._r;}
    //if (ry+robot._r >= height){ry=height-robot._r;}
  }
}
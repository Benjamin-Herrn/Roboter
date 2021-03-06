//by Bothe Niklas and Herrn Benjamin
class Robot {                                                             
  float _r = 20;                                                          //radius auf 50 pixel
  int _vr,_vl;                                                            //geschwindigkeit der raeder
  boolean kollision = false;                                              //variable fuer kollision
  PVector p = new PVector(px,py);                                         //neuer vector erstellt
                                                                          
  void drive (int vl,int vr){                                             //drive funktion erstellt
    _vr = vr;                                                             
    _vl = vl;                                                             //geschwindigkeiten in funktion der eigenschaft geschwindigkeit angepass                                           
    rx = rx + cos(alpha*PI/180.0) * (_vr/100.0 + _vl/100.0)/2.0;          //neue koordinaten fuer roboter beim fahren berechnen: je nach ausrichtung unterschiedlich weit in x-richtung (cos)(gl;eiches fuer y - sin);
    ry = ry - sin(alpha*PI/180.0) * (_vr/100.0 + _vl/100.0)/2.0;          // geschwindigkeit ist arithmetisches mittel aus radgeschwindigkeiten                                                                                    
    alpha = alpha + (_vr -_vl)/(_r*3.6);                                  //neuer winkel zum drehen erforderlich --> differenz der Geschwindigkeiten * faktor / faktor = ?
    path();  
}                                                                       
                                                                          
  boolean Kollision(){                                                    //
    kollision =false;                                                     //
    for (int i = round(alpha) - 90; i < round(alpha) + 90;  i = i+1){     //
      proofx = round(rx+(robot._r+1)*cos(i*PI/180.0));                    //
      proofy = round(ry-(robot._r+1)*sin(i*PI/180.0));                    //
      if (objects.img.get(proofx,proofy) == color(0,0,0)){                            //
        kollision = true;                                                 //
      }                                                                   
    }                                                                     
    return kollision;                                                     //
  }                                                                       
                                                                          
  void show(){                                                            
  px = (robot._r*cos(alpha*PI/180.0));                                    
    py = (robot._r*sin(alpha*PI/180.0));                                  
                                                                          
    if (keyPressed){if (key == ' '){                                      
      rx = (mouseX);                                                      //roboter bei klick auf position des cursers gesetzt
      ry = (mouseY);
      alpha = 90.0;
      }}                                                                  
    sx = rx+robot._r*cos(alpha*PI/180.0);                                 //neue ausrichtung des roboters --> spitze neu berechnen (siehe rx) 
    sy = ry-robot._r*sin(alpha*PI/180.0);                                 
                                                                           
    fill(255);                                                            
    stroke(2);                                                            
    ellipse(rx,ry,2*robot._r,2*robot._r);                                 //ellipse mit mittelpunkt und ausdehnung(doppelter radius)
    line(rx,ry,sx,sy);                                                    //linie die richtung anzeigt
  }

  void path(){
    image(pathgraphic,0,0);
   if (get(round(rx),round(ry)) == color(255,255,255)){
     pathgraphic.beginDraw(); 
     pathgraphic.fill(170,255,70);
     pathgraphic.endDraw();
   }  
   if (get(round(rx),round(ry)) == color(170,255,70)){
     pathgraphic.beginDraw();
     pathgraphic.fill(138,221,70);
     pathgraphic.endDraw();
   }
   if (get(round(rx),round(ry)) == color(138,221,70)){
     pathgraphic.beginDraw();  
     pathgraphic.fill(51,204,51);
     pathgraphic.endDraw();
   }
   pathgraphic.beginDraw();
   pathgraphic.noStroke();
   pathgraphic.ellipse(rx,ry,3,3);
   pathgraphic.endDraw();
   image(pathgraphic,0,0);
 }}
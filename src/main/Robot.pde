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
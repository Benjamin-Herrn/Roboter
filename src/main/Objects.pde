//by Bothe Niklas and Herrn Benjamin
class Objects {                        
  PImage img;                          //image erstellt
  void ShowObjects (){                 //funktion fuer Objekte in Umgebung erstellt
    img = loadImage("Umgebung_2.png"); //png datei fuer Umgebung in das Image geladen
    image(img,0,0);                    //Image dargestellt (rechte obere ecke bei 0,0)
  }
}
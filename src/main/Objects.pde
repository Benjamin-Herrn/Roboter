class Objects {
  PImage img;            //image erstellt
  void ShowObjects (){
    img = loadImage("Umgebung_2.png");
    image(img,0,0);
  }
}
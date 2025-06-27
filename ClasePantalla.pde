abstract class Pantalla {
  PImage fondo;

  Pantalla(PImage fondo) {
    this.fondo = fondo;
  }

  /*void dibujarFondo() {
    image(fondo, 0, 0, width, height);
  }*/
  //agregue esto
  void dibujarFondo() {
    if (fondo != null) {
      image(fondo, 0, 0, width, height);
    } else {
      println("⚠️ Error: fondo es null en Pantalla");
      background(0); // Fondo negro de emergencia
    }
  }

  abstract void dibujar();
  abstract void mousePressed(float mx, float my);
}

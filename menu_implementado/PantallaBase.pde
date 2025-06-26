// --- PANTALLA BASE ---
abstract class Pantalla {
  PImage fondo;

  Pantalla(PImage fondo) {
    this.fondo = fondo;
  }

  void dibujarFondo() {
    image(fondo, 0, 0, width, height);
  }

  abstract void dibujar();
  abstract void mousePressed(float mx, float my);
}

class PantallaJuego extends Pantalla {
  PantallaJuego(PImage fondo) {
    super(fondo);
  }

  void dibujar() {
    dibujarFondo();

    fill(255);
    textSize(28);
    textAlign(CENTER);
    text("¡El juego ha comenzado!", width/2, 30);
  }

  void mousePressed(float mx, float my) {
    // Implementar si es necesario
  }
}

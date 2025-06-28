class PantallaJuego extends Pantalla {
  public PantallaJuego(PImage fondo) {
    super(fondo);
  }

  public void dibujar() {
    dibujarFondo();

    fill(255);
    textSize(28);
    textAlign(CENTER);
    text("¡El juego ha comenzado!", width/2, 30);
  }

  public void mousePressed(float mx, float my) {
    // Implementar si es necesario
  }
}

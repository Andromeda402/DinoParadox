// --- PANTALLA DE JUEGO ---
class PantallaJuego extends Pantalla {
  PantallaJuego(PImage fondo) {
    super(fondo);
  }

  void dibujar() {
    dibujarFondo();
    fill(255);
    textSize(28);
    textAlign(CENTER);
    text("¡El juego ha comenzado!", width/2, height/2);
  }

  void mousePressed(float mx, float my) {
    // Aquí podrías incluir condiciones de victoria o derrota
  }
}

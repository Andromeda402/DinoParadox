// --- PANTALLA DE MENÚ ---
class PantallaMenu extends Pantalla {
  Boton botonJugar;
  Boton botonSalir;
  PImage cientifico;

  PantallaMenu(PImage fondo, PImage cientifico) {
    super(fondo);
    this.cientifico = cientifico;
    botonJugar = new Boton("Jugar", width/2 - 75, 250, 150, 40);
    botonSalir = new Boton("Salir", width/2 - 75, 310, 150, 40);
  }

  void dibujar() {
    dibujarFondo();

    // Título
    fill(255);
    textAlign(CENTER);
    textSize(32);
    text("Mi Juego", width/2, 60);

    // Imagen del científico
    image(cientifico, 50, 100);

    // Cuadro de diálogo
    fill(255, 255, 200);
    rect(170, 100, 370, 100, 10);
    fill(0);
    textSize(14);
    textAlign(LEFT, TOP);
    text("¡Hola, soy el Dr. Dexter!\nHaz clic en 'Jugar' para comenzar tu misión.\nBuena suerte, guerrero.", 180, 110);

    // Botones
    botonJugar.dibujar();
    botonSalir.dibujar();
  }

  void mousePressed(float mx, float my) {
    if (botonJugar.estaSobre(mx, my)) {
      estadoJuego = MaquinaEstadosJuego.INTRO;
    } else if (botonSalir.estaSobre(mx, my)) {
      exit();
    }
  }
}

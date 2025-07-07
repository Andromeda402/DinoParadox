class PantallaMenu extends Pantalla {

  // ======== ATRIBUTOS ========

  private Boton botonJugar;
  private Boton botonSalir;
  private PImage cientifico;

  // ======== CONSTRUCTOR ========

  public PantallaMenu(PImage fondo, PImage cientifico) {
    super(fondo);
    this.cientifico = cientifico;
    botonJugar = new Boton("Jugar", width/2 - 75, 250, 150, 40);
    botonSalir = new Boton("Salir", width/2 - 75, 310, 150, 40);
  }

  // ======== METODOS ========

  //dibuja los objetos que conforman al menu
  public void dibujar() {
    dibujarFondo();

    fill(255);
    textAlign(CENTER);
    textSize(32);
    text("Mi Juego", width/2, 60);

    image(cientifico, 50, 100);

    fill(255, 255, 200);
    rect(170, 100, 370, 100, 10);
    fill(0);
    textSize(14);
    textAlign(LEFT, TOP);
    text("¡Hola, soy el Dr. Dexter!\nHaz clic en 'Jugar' para comenzar tu misión.\nBuena suerte, guerrero.", 180, 110);

    botonJugar.dibujar();
    botonSalir.dibujar();
  }

  public void mousePressed(float mx, float my) {
    if (botonJugar.estaSobre(mx, my)) {
      estadoJuego = MaquinaEstadosJuego.INTRO;
    } else if (botonSalir.estaSobre(mx, my)) {
      exit();
    }
  }

  // ======== GETTERS & SETTERS ========

  public Boton getBotonJugar() {
    return botonJugar;
  }

  public void setBotonJugar(Boton nuevoBotonJugar) {
    this.botonJugar = nuevoBotonJugar;
  }

  public Boton getBotonSalir() {
    return botonSalir;
  }

  public void setBotonSalir(Boton nuevoBotonSalir) {
    this.botonSalir = nuevoBotonSalir;
  }

  public PImage getCientifico() {
    return cientifico;
  }

  public void setCientifico(PImage nuevoCientifico) {
    this.cientifico = nuevoCientifico;
  }
}

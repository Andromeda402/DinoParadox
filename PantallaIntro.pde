class PantallaIntro extends Pantalla {
  
  // ======== ATRIBUTOS ========
  
  private String[] historia = {
    "Escuchen con atención...",
    "El mundo terminó con un rugido, no con un suspiro...",
    "Esta entidad combinó los restos fósiles de dinosaurios con tecnología alienígena y biomecánica...",
    "Los humanos luchamos con todas nuestras fuerzas... y perdimos.",
    "Décadas después, lo que queda de nuestra civilización sobrevive entre ruinas.",
    "Las bestias mecánicas dominan el territorio.",
    "Pero aún queda esperanza.",
    "Jack Tenreck y Hannah Dundee, dos cyborgs, son nuestra última baza.",
    "Juntos deben destruir a la Matriarca.",
    "Pero antes deberán enfrentarse al Martillo de Hierro y al Rex Supremo.",
    "El camino es peligroso, pero confío en ellos.",
    "Porque sólo los que poseen un alma pueden cambiar el destino de este mundo."
  };
  
  private int lineaActual = 0;
  private PImage cientifico;
  
  // ======== CONSTRUCTOR ========

  public PantallaIntro(PImage fondo, PImage cientifico) {
    super(fondo);
    this.cientifico = cientifico;
  }
  
  // ======== METODOS ========

  public void dibujar() {
    dibujarFondo();

    image(cientifico, 50, height - 150);

    fill(255, 255, 200);
    rect(160, height - 160, 420, 100, 10);

    fill(0);
    textSize(16);
    textAlign(LEFT, TOP);
    text(historia[lineaActual], 170, height - 150, 400, 90);

    fill(255);
    textSize(12);
    textAlign(RIGHT, BOTTOM);
    text("Haz clic para continuar...", width - 20, height - 10);
    
    
     mostrarGuiaControles();
    
  }

  public void mousePressed(float mx, float my) {
    lineaActual++;
    if (lineaActual >= historia.length) {
      estadoJuego = MaquinaEstadosJuego.JUGANDO_NIVEL01;
    }
  }
  
  // ======== GETTERS & SETTERS ========
  
  public String[] getHistoria(){
    return historia;
  }
  
  public void setHistoria(String[] nuevaHistoria){
    this.historia = nuevaHistoria;
  }
  
  public int getLineaActual(){
    return lineaActual;
  }
  
  public void setLineaActual(int nuevaLineaActual){
    this.lineaActual = nuevaLineaActual;
  }
  
  public PImage getCientifico(){
    return cientifico;
  }
  
  public void setCientifico(PImage nuevoCientifico){
    this.cientifico = nuevoCientifico;
  }
  
  private void mostrarGuiaControles() {
    // Fondo del cuadro (opcional)
    fill(0, 150); // semi-transparente
    rect(width - 210, 20, 190, 130, 10); // x, y, w, h, radio

    // Texto de controles
    fill(255);
    textAlign(LEFT);
    textSize(14);
    text("CONTROLES:", width - 200, 40);
    text("W - Mover arriba", width - 200, 60);
    text("S - Mover abajo", width - 200, 80);
    text("A - Mover izquierda", width - 200, 100);
    text("D - Mover derecha", width - 200, 120);
    text("ESPACIO - Disparar", width - 200, 140);
  } 
  
}

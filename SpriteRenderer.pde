class SpriteRenderer {

  // ======== ATRIBUTOS ========

  private PImage spriteSheet;

  private int anchoFrame;
  private int altoFrame;
  private int columnas; // Cuantos frames por fila

  private int frameActual;
  private int contadorFrames;
  private int velocidadAnimacion;

  private GameObject objeto;
  private boolean hayImagen;

  // ======== CONSTRUCTOR ========

  public SpriteRenderer(GameObject objeto) {
    this.objeto = objeto;

    this.anchoFrame = 60;
    this.altoFrame = 82;

    this.velocidadAnimacion = 6; // menor = mas rapido
    this.frameActual = 0;
    this.contadorFrames = 0;

    this.hayImagen = false;
  }

  // ======== METODOS ========

  // Cargar imagen del sprite sheet
  /* public void cambiarImagen(PImage nuevaImagen) {
   this.spriteSheet = nuevaImagen;
   this.columnas = spriteSheet.width / anchoFrame;
   this.hayImagen = true;
   this.frameActual = 0;
   this.contadorFrames = 0;
   }*/
  void cambiarImagen(PImage nuevaImagen) {
    if (nuevaImagen != null) {
      this.spriteSheet = nuevaImagen;
      this.columnas = spriteSheet.width / anchoFrame;  // Aquí NO va a dar error si la imagen existe
      this.hayImagen = true; // <-- ¡Faltaba esto!
      this.frameActual = 0;
      this.contadorFrames = 0;
    } else {
      println("ERROR: La imagen es null, revisa que esté en la carpeta data y el nombre sea correcto.");
    }
  }

  // Mostrar la animacion segun el estado
  public void mostrarAnimacion(int estado) {
    imageMode(CENTER);

    if (!hayImagen) {
      // Si no hay imagen se dibuja una elipse de reserva
      fill(#CCCCCC);
      ellipse(objeto.getPosicion().x, objeto.getPosicion().y, objeto.getTamanio().x, objeto.getTamanio().y);
      return;
    }

    switch (estado) {
    case MaquinaEstadosAnimacion.ANIMACION_QUIETO:
      dibujarFrame(0);
      break;

    case MaquinaEstadosAnimacion.ANIMACION_CAMINAR_IZQUIERDA:
      moverSprite(1);
      break;

    case MaquinaEstadosAnimacion.ANIMACION_CAMINAR_DERECHA:
      moverSprite(2);
      break;

    case MaquinaEstadosAnimacion.ANIMACION_ATAQUE:
      moverSprite(3);
      break;

    case MaquinaEstadosAnimacion.ANIMACION_MUERTE:
      moverSprite(4);
      break;

    default:
      dibujarFrame(0);
      break;
    }
  }

  // Muestra un solo frame estatico (el primero de una fila)
  private void dibujarFrame(int fila) {
    PImage frame = spriteSheet.get(
      0,
      fila * altoFrame,
      anchoFrame,
      altoFrame
      );

    image(frame, objeto.posicion.x, objeto.posicion.y, objeto.tamanio.x, objeto.tamanio.y);
  }

  // Reproduce animacion recorriendo los frames de una fila
  private void moverSprite(int fila) {
    int columna = frameActual % columnas;

    PImage frame = spriteSheet.get(
      columna * anchoFrame,
      fila * altoFrame,
      anchoFrame,
      altoFrame
      );

    image(frame, objeto.posicion.x, objeto.posicion.y, objeto.tamanio.x, objeto.tamanio.y);

    contadorFrames++;
    if (contadorFrames >= velocidadAnimacion) {
      frameActual++;
      if (frameActual >= columnas) {
        frameActual = 0;
      }
      contadorFrames = 0;
    }
  }

  // ======== GETTERS & SETTERS ========

  public PImage getSpriteSheet() {
    return spriteSheet;
  }

  public void setSpriteSheet(PImage nuevoSpriteSheet) {
    this.spriteSheet = nuevoSpriteSheet;
  }

  public int getAnchoFrame() {
    return anchoFrame;
  }

  public void setAnchoFrame(int nuevoAnchoFrame) {
    this.anchoFrame = nuevoAnchoFrame;
  }

  public int getAltoSheet() {
    return altoFrame;
  }

  public void setAltoSheet(int nuevoAltoFrame) {
    this.altoFrame = nuevoAltoFrame;
  }

  public int getColumnas() {
    return columnas;
  }

  public void setColumnas(int nuevaColumna) {
    this.columnas = nuevaColumna;
  }

  public int getFrameActual() {
    return frameActual;
  }

  public void setFrameActual(int nuevoFrameActual) {
    this.frameActual = nuevoFrameActual;
  }

  public int getContadorFrames() {
    return contadorFrames;
  }

  public void setContadorFrames(int nuevoContadorFrames) {
    this.contadorFrames = nuevoContadorFrames;
  }

  public int getVelocidadAnimacion() {
    return velocidadAnimacion;
  }

  public void setVelocidadAnimacion(int nuevaVelocidadAnimacion) {
    this.velocidadAnimacion = nuevaVelocidadAnimacion;
  }

  public GameObject getObjeto() {
    return objeto;
  }

  public void setObjeto(GameObject nuevoObjeto) {
    this.objeto = nuevoObjeto;
  }

  public Boolean getHayImagen() {
    return hayImagen;
  }

  public void setHayImagen(Boolean nuevoHayImagen) {
    this.hayImagen = nuevoHayImagen;
  }
}

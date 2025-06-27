class SpriteRenderer {
  PImage spriteSheet;

  int anchoFrame;
  int altoFrame;
  int columnas; // Cuantos frames por fila

  int frameActual;
  int contadorFrames;
  int velocidadAnimacion;

  GameObject objeto;
  boolean hayImagen;

  // Constructor
  public SpriteRenderer(GameObject objeto) {
    this.objeto = objeto;

    this.anchoFrame = 32;
    this.altoFrame = 32;

    this.velocidadAnimacion = 6; // menor = mas rapido
    this.frameActual = 0;
    this.contadorFrames = 0;

    this.hayImagen = false;
  }

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
      spriteSheet = nuevaImagen;
      columnas = spriteSheet.width / anchoFrame;  // Aquí NO va a dar error si la imagen existe
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
      ellipse(objeto.posicion.x, objeto.posicion.y, objeto.tamanio.x, objeto.tamanio.y);
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
}

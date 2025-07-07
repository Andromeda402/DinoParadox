class Pterodactilo extends Dinosaurio {

  // ======== ATRIBUTOS ========

  // ======== ANIMACION ========
  PImage sheet;
  int cols, rows, fw, fh;
  int cur = 0;
  int delay = 6;
  int counter = 0;

  // ======== POSICION PARA DIBUJAR ========
  float x, y;
  boolean facingLeft = false;

  private boolean cambioSentido;
  private int tiempoSoltarFruta;
  private ArrayList<Fruta> fruta;

  // ======== CONSTRUCTOR ========

  public Pterodactilo(PVector posicion, PVector tamanio, int vida, float velocidad, int danio, PImage sheet, int cols, int rows) {
    super(posicion, tamanio, vida, velocidad, danio);
    this.fruta = new ArrayList<Fruta>();

    this.sheet = sheet;
    this.cols = cols;
    this.rows = rows;
    this.fw = sheet.width / cols;
    this.fh = sheet.height / rows;

    this.x = posicion.x;
    this.y = posicion.y;
  }

  // ======== METODOS ========

  //dibuja al pterodactilo utilizando una ellipse de color verder
  //y las frutas que suelta
  public void dibujar() {
    fill(#FFA500);
    ellipse(getPosicion().x, getPosicion().y, getTamanio().x, getTamanio().y);




    counter++;
    if (counter >= delay) {
      counter = 0;
      cur = (cur + 1) % cols;
    }

    // seleccion del frame
    int sx = cur * fw;
    int sy = getRow() * fh;

    pushMatrix();
    translate(posicion.x, posicion.y);
    if (facingLeft) {
      scale(-2.5, 2.5);  //INVERTIDO Y AGRANDADO
    } else {
      scale(0.2);        //AUMENTA TAMAÑO DEL SPRITE
    }
    imageMode(CENTER);
    image(sheet.get(sx, sy, fw, fh), 0, 0);
    popMatrix();

    for (Fruta f : this.fruta) {
      f.dibujar();
    }
  }

  //el pterodactilo se mueve de izquierda a derecha de la pantalla
  public void mover(Personaje personaje, Dinosaurio dinosaurio) {
    if (this.cambioSentido == true) {
      this.posicion.x += dinosaurio.getVelocidad() * deltaTime;
      if (posicion.x + tamanio.x / 2 >= width) {
        this.cambioSentido = false;
      }
    } else {
      this.posicion.x -= dinosaurio.getVelocidad() * deltaTime;
      if (this.posicion.x - dinosaurio.getTamanio().x / 2 <= 0) {
        this.cambioSentido = true;
      }
    }

    this.tiempoSoltarFruta +=1;

    if (this.tiempoSoltarFruta >= 420) { // cada 4 segundos
      soltarFruta();
      this.tiempoSoltarFruta = 0;
    }

    for (int i = this.fruta.size() - 1; i >= 0; i--) {
      Fruta f = this.fruta.get(i);
      f.mover(1);
      f.explotar(personaje);
      if (f.detonar) {
        this.fruta.remove(i);
        //println("fruta eliminada");
      }
    }
  }

  //suelta la fruta para dañar al jugador
  public void soltarFruta() {
    fruta.add(new Fruta(new PVector(posicion.x, posicion.y), new PVector(15, 15)));
  }

  // ======== GETTERS & SETTERS ========

  public boolean conVida() {
    return vida > 0;
  }

  public boolean getCambioSentido() {
    return cambioSentido;
  }

  public void setCambioSentido(boolean nuevoCambioSentido) {
    this.cambioSentido = nuevoCambioSentido;
  }

  public int getTiempoSoltarFruta() {
    return tiempoSoltarFruta;
  }

  public void setTiempoSoltarFruta(int nuevoTiempoSoltarFruta) {
    this.tiempoSoltarFruta = nuevoTiempoSoltarFruta;
  }

  public ArrayList getFruta() {
    return fruta;
  }

  public void setFruta(ArrayList nuevaFruta) {
    this.fruta = nuevaFruta;
  }

  public int getRow() {
    return 0;
  }
}

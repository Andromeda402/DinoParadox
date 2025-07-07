class Matriarca extends Dinosaurio {
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


  private Collider colliderMatriarca;
  private int tiempoSoltarFruta;
  private ArrayList<Fruta> fruta;
  private int limiteFruta;

  // ======== CONSTRUCTOR CORREGIDO ========
  public Matriarca(PVector posicion, PVector tamanio, int vida, float velocidad, int danio, PImage sheet, int cols, int rows) {
    super(posicion, tamanio, vida, velocidad, danio);

    this.fruta = new ArrayList<Fruta>();
    this.colliderMatriarca = new Collider(this.posicion, this.tamanio);
    this.limiteFruta = 35;

    this.sheet = sheet;
    this.cols = cols;
    this.rows = rows;
    this.fw = sheet.width / cols;
    this.fh = sheet.height / rows;

    this.x = posicion.x;
    this.y = posicion.y;
  }

  // ======== DIBUJAR ========
  public void dibujar() {
    // dibuja las frutas primero
    for (Fruta f : fruta) {
      f.dibujar();
    }


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
    if (facingLeft) scale(-1, 1);
    imageMode(CENTER);
    image(sheet.get(sx, sy, fw, fh), 0, 0);
    popMatrix();
  }

  // ======== MOVIMIENTO HACIA EL PERSONAJE ========
  public void mover(Personaje personaje) {
    float dx = personaje.getPosicion().x - posicion.x;
    float dy = personaje.getPosicion().y - posicion.y;
    float distancia = dist(personaje.getPosicion().x, personaje.getPosicion().y, posicion.x, posicion.y);

    // Dirección de sprite
    facingLeft = dx < 0;

    if (distancia > 1) {
      posicion.x += dx / distancia * velocidad * deltaTime;
      posicion.y += dy / distancia * velocidad * deltaTime;
    }

    colliderMatriarca.setPosicion(posicion);
  }

  // ======== ATAQUE CUERPO A CUERPO ========
  public void atacar(Personaje personaje) {
    Collider colliderPersonaje = new Collider(personaje.getPosicion(), personaje.getTamanio());

    if (colliderPersonaje.hayColision(colliderMatriarca)) {
      personaje.setVida(personaje.getVida() - danio);
    }
  }

  // ======== DISPARO DE FRUTAS ========
  public void dispararFruta(Personaje personaje) {
    tiempoSoltarFruta++;

    if (tiempoSoltarFruta >= 20 && fruta.size() < limiteFruta) {
      fruta.add(new Fruta(new PVector(posicion.x, posicion.y), new PVector(15, 15)));
      tiempoSoltarFruta = 0;
    }

    for (int i = fruta.size() - 1; i >= 0; i--) {
      Fruta f = fruta.get(i);
      f.moverMultiples();
      f.explotar(personaje);
      f.duracion--;

      if (f.detonar || f.duracion <= 0) {
        fruta.remove(i);
      }
    }
  }

  // ======== GETTERS & SETTERS ========
  public boolean conVida() {
    return vida > 0;
  }

  public Collider getColliderMatriarca() {
    return colliderMatriarca;
  }

  public void setColliderMatriarca(Collider nuevoColliderMatriarca) {
    this.colliderMatriarca = nuevoColliderMatriarca;
  }

  public ArrayList<Fruta> getFruta() {
    return fruta;
  }

  public void setFruta(ArrayList<Fruta> nuevaFruta) {
    this.fruta = nuevaFruta;
  }

  public int getlimiteFruta() {
    return limiteFruta;
  }

  public void setLimiteFruta(int nuevoLimiteFruta) {
    this.limiteFruta = nuevoLimiteFruta;
  }

  public int getRow() {
    return 0;
  }
}

class Triceratops extends Dinosaurio {
  
  // ======== ANIMACION ========
  PImage sheet;
  int cols, rows, fw, fh;
  int cur = 0; 
  int delay = 6;
  int counter = 0;
  
  // ======== POSICION PARA DIBUJAR ========
  float x, y;
  boolean facingLeft = false;
  
  
  
  // ======== ATRIBUTOS ========
  
  private Collider colliderTriceratops;
  
  // ======== CONSTRUCTOR ========
  
  public Triceratops(PVector posicion, PVector tamanio, int vida, float velocidad, int danio, PImage sheet, int cols, int rows) {
    super(posicion, tamanio, vida, velocidad, danio);
    this.vidaMaximaD = vida;
    this.colliderTriceratops = new Collider(this.posicion, this.tamanio);
    this.sheet = sheet;
    this.cols = cols;
    this.rows = rows;
    this.fw = sheet.width / cols;
    this.fh = sheet.height / rows;
    
    this.x = posicion.x;
    this.y = posicion.y;
  }
  
  // ======== METODOS ========
  
  //dibuja una ellipse de color naranja
  public void dibujar() {
    fill(#4B2603);
    //ellipse(getPosicion().x, getPosicion().y, getTamanio().x, getTamanio().y);
    
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
    scale(-2.5, 2.5);  // ← INVERTIDO Y AGRANDADO
  } else {
    scale(1.5);        // ← AUMENTA TAMAÑO DEL SPRITE
  }
    imageMode(CENTER);
    image(sheet.get(sx, sy, fw, fh), 0, 0);
    popMatrix();
    dibujarBarraVidaD();
  }

  //el dinosaurio se mueve persiguiendo al personaje lentamente
  public void mover(Personaje personaje, Dinosaurio dinosaurio) {

    float dx = personaje.getPosicion().x - this.posicion.x;
    float dy = personaje.getPosicion().y - this.posicion.y;

    float distanciaPersonaje = dist(personaje.getPosicion().x, personaje.getPosicion().y, dinosaurio.getPosicion().x, dinosaurio.getPosicion().y);

    if (distanciaPersonaje > 1) {
      //this.posicion.x += dx / distanciaPersonaje * velocidad;
      //this.posicion.y += dy / distanciaPersonaje * velocidad;
      
      this.posicion.x += dx / distanciaPersonaje * dinosaurio.getVelocidad() * deltaTime;
      this.posicion.y += dy / distanciaPersonaje * dinosaurio.getVelocidad() * deltaTime;
    }
  }
  
  //el dinosaurio ataca al personaje cuando esta cuerpo a cuerpo
  public void atacar(Personaje personaje) {
    Collider colliderPersonaje = new Collider(personaje.getPosicion(), personaje.getTamanio());

    if (colliderPersonaje.hayColision(colliderTriceratops)) {
      
      personaje.setVida(personaje.getVida() - this.danio);
 
    }
  }
  
   public void dibujarBarraVidaD() {
  float barraAncho = 50;
  float barraAlto = 6;
  float barraX = posicion.x - barraAncho/2;
  float barraY = posicion.y - tamanio.y/2 - 10; // 10 píxeles arriba del dino

  // Fondo barra (vacía)
  fill(100);
  rect(barraX, barraY, barraAncho, barraAlto);

  // Barra llena proporcional a la vida
  float vidaRelativa = constrain((float)vida / vidaMaximaD, 0, 1);
  fill(255, 0, 0); // rojo
  rect(barraX, barraY, barraAncho * vidaRelativa, barraAlto);

  // Borde
  noFill();
  stroke(0);
  rect(barraX, barraY, barraAncho, barraAlto);
  noStroke();
  }
  
  // ======== GETTERS & SETTERS ========
  
  public boolean conVida() {
    return vida > 0;
  }
  
  public Collider getColliderTriceratops(){
    return colliderTriceratops;
  }
  
  public void setColliderTriceratops(Collider nuevoColliderTriceratops){
    this.colliderTriceratops = nuevoColliderTriceratops;
  }
  
  public int getRow() {
    return 0;
  }
  
 

}

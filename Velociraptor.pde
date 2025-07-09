class Velociraptor extends Dinosaurio {
  
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

  private Collider colliderVelociraptor;
  
  // ======== CONSTRUCTOR ========

  public Velociraptor(PVector posicion, PVector tamanio, int vida, float velocidad, int danio, PImage sheet, int cols, int rows) {
    super(posicion, tamanio, vida, velocidad, danio);
    colliderVelociraptor = new Collider(this.posicion, this.tamanio);
    this.sheet = sheet;
    this.cols = cols;
    this.rows = rows;
    this.fw = sheet.width / cols;
    this.fh = sheet.height / rows;
    
    this.x = posicion.x;
    this.y = posicion.y;
  }
  
  // ======== METODOS ========

  public void dibujar() {
    //super.dibujar();
    
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
    scale(0.7);        //AUMENTA TAMAÑO DEL SPRITE
  }
    imageMode(CENTER);
    image(sheet.get(sx, sy, fw, fh), 0, 0);
    popMatrix();

  }
  
  //el dinosaurio se mueve de izquierda a derecha
  public void mover() {

    this.posicion.x += this.velocidad * deltaTime;
    
  }

  //si en algun momento del recorrida se choca con el
  //personaje entonces le resta vida al mismo
  public void chocar(Personaje personaje, Dinosaurio dinosaurio) {
    Collider colliderPersonaje = new Collider(personaje.getPosicion(), personaje.getTamanio());

    if (colliderPersonaje.hayColision(colliderVelociraptor)) {
      
      personaje.setVida(personaje.getVida() - dinosaurio.getDanio());
      
      dinosaurio.setVida(0);
    }
  }
  
  // ======== GETTERS & SETTERS ========

  public boolean conVida() {
    return vida > 0;
  }
  
  public Collider getColliderVelociraptor(){
    return colliderVelociraptor;
  }
  
  public void setColliderVelociraptor(Collider nuevoColliderVelociraptor){
    this.colliderVelociraptor = nuevoColliderVelociraptor;
  }
  
  public int getRow() {
    return 0;
  }
}

class Triceratops extends Dinosaurio {
  
  // ======== ATRIBUTOS ========
  
  private Collider colliderTriceratops;
  
  // ======== CONSTRUCTOR ========
  
  public Triceratops(PVector posicion, PVector tamanio, int vida, float velocidad, int danio) {
    super(posicion, tamanio, vida, velocidad, danio);
    this.colliderTriceratops = new Collider(this.posicion, this.tamanio);
  }
  
  // ======== METODOS ========
  
  //dibuja una ellipse con color naranja
  public void dibujar() {
    fill(#4B2603);
    ellipse(getPosicion().x, getPosicion().y, getTamanio().x, getTamanio().y);
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
  
}

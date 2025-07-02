class Triceratops extends Dinosaurio {
  
  private Collider colliderTriceratops;
  
  public Triceratops(PVector posicion, PVector tamanio, int vida, float velocidad, int danio) {
    super(posicion, tamanio, vida, velocidad, danio);
    this.colliderTriceratops = new Collider(this.posicion, this.tamanio);
  }

  public void dibujar() {
    fill(#4B2603);
    ellipse(getPosicion().x, getPosicion().y, getTamanio().x, getTamanio().y);
  }

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
  
  public void atacar(Personaje personaje) {
    Collider colliderPersonaje = new Collider(personaje.getPosicion(), personaje.getTamanio());

    if (colliderPersonaje.hayColision(colliderTriceratops)) { //falta encapsulacion borrar este mensaje
      //personaje.vida -= this.danio;
      
      personaje.setVida(personaje.getVida() - this.danio);
      //this.vida  = 0;
      
      //personaje.setVida(0);
    }
  }
  
  
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

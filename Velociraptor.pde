class Velociraptor extends Dinosaurio {
  
  // ======== ATRIBUTOS ========

  private Collider colliderVelociraptor;
  
  // ======== CONSTRUCTOR ========

  public Velociraptor(PVector posicion, PVector tamanio, int vida, float velocidad, int danio) {
    super(posicion, tamanio, vida, velocidad, danio);
    colliderVelociraptor = new Collider(this.posicion, this.tamanio);
  }
  
  // ======== METODOS ========

  public void dibujar() {
    super.dibujar();
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
}

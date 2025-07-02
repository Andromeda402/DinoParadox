class Velociraptor extends Dinosaurio {

  private Collider colliderVelociraptor;

  public Velociraptor(PVector posicion, PVector tamanio, int vida, float velocidad, int danio) {
    super(posicion, tamanio, vida, velocidad, danio);
    colliderVelociraptor = new Collider(this.posicion, this.tamanio);
  }

  public void dibujar() {
    super.dibujar();
  }

  public void mover() {

    this.posicion.x += this.velocidad * deltaTime;
    
  }


  public void chocar(Personaje personaje, Dinosaurio dinosaurio) {
    Collider colliderPersonaje = new Collider(personaje.getPosicion(), personaje.getTamanio());

    if (colliderPersonaje.hayColision(colliderVelociraptor)) {
      //personaje.vida -= this.danio;
      personaje.setVida(personaje.getVida() - dinosaurio.getDanio());
      //this.vida  = 0;
      dinosaurio.setVida(0);
    }
  }


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

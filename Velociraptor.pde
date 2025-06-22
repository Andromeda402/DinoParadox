class Velociraptor extends Dinosaurio {

  Collider colliderVelociraptor;

  public Velociraptor(PVector posicion, PVector tamanio, int vida, float velocidad, int danio) {
    super(posicion, tamanio, vida, velocidad, danio);
    colliderVelociraptor = new Collider(this.posicion, this.tamanio);
  }

  public void dibujar() {
    super.dibujar();
  }

  public void mover() {

    posicion.x += velocidad;
  }




  public void chocar(Personaje personaje) {
    Collider colliderPersonaje = new Collider(personaje.posicion, personaje.tamanio);

    if (colliderPersonaje.hayColision(colliderVelociraptor)) {
      personaje.vida -= this.danio;
      this.vida  = 0;
    }
  }


  public boolean conVida() {
    return vida > 0;
  }
}

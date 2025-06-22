class Triceratops extends Dinosaurio {
  
  Collider colliderTriceratops;
  
  public Triceratops(PVector posicion, PVector tamanio, int vida, float velocidad, int danio) {
    super(posicion, tamanio, vida, velocidad, danio);
  }

  public void dibujar() {
    fill(#4B2603);
    ellipse(this.posicion.x, this.posicion.y, this.tamanio.x, this.tamanio.y);
  }

  public void mover(Personaje personaje) {

    float dx = personaje.posicion.x - this.posicion.x;
    float dy = personaje.posicion.y - this.posicion.y;

    float distanciaPersonaje = dist(personaje.posicion.x, personaje.posicion.y, this.posicion.x, this.posicion.y);

    if (distanciaPersonaje > 1) {
      this.posicion.x += dx / distanciaPersonaje * velocidad;
      this.posicion.y += dy / distanciaPersonaje * velocidad;
    }
  }
  
  public void atacar(Personaje personaje) {
    Collider colliderPersonaje = new Collider(personaje.posicion, personaje.tamanio);

    if (colliderPersonaje.hayColision(colliderTriceratops)) {
      personaje.vida -= this.danio;
      this.vida  = 0;
    }
  }
  
  
  public boolean conVida() {
    return vida > 0;
  }
  
  
  
}

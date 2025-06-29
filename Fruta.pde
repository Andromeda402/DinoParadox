class Fruta extends GameObject {

  private float velocidad;
  private boolean detonar;
  private int danio;
  private Collider colliderFruta;
  private float duracion;
  private PVector direccion;

  public Fruta(PVector posicion, PVector tamanio) {
    super(posicion, tamanio);
    this.velocidad = 1;
    this.danio = 1;
    this.duracion = 700;
    this.colliderFruta = new Collider(this.posicion, this.tamanio);

    this.direccion = new PVector(random(-1, 1), random(-1, 1));
  }

  public void dibujar() {
    fill(#370C48);
    noStroke();
    ellipse(posicion.x, posicion.y, tamanio.x, tamanio.y);
  }

  public void mover(int tipoMovimiento) {

    switch(tipoMovimiento) {

    case 1:
      {
        //posicion.y += velocidad;


        this.posicion.y += this.velocidad;


        if (this.posicion.y > height) {
          this.detonar = true;
        }
      }
    }
  }

  public void moverMultiples() {

    this.posicion.x += this.direccion.x * this.velocidad;
    this.posicion.y += this.direccion.y * this.velocidad;
    this.duracion -= 1;
  }


  public void explotar(Personaje personaje) {
    Collider colliderPersonaje = new Collider(personaje.getPosicion(), personaje.getTamanio());

    if (colliderPersonaje.hayColision(this.colliderFruta)) {
      //personaje.vida -= this.danio;
      personaje.setVida(personaje.getVida() - this.danio);
      this.detonar = true;
    }
  }

  public float getVelocidad() {
    return velocidad;
  }

  public void setVelocidad(float nuevaVelocidad) {
    this.velocidad = nuevaVelocidad;
  }

  public boolean getDetonar() {
    return detonar;
  }

  public void setDetonar(boolean nuevoDetonar) {
    this.detonar = nuevoDetonar;
  }

  public int getDanio() {
    return danio;
  }

  public void setDanio(int nuevoDanio) {
    this.danio = nuevoDanio;
  }

  public Collider getColliderFruta() {
    return colliderFruta;
  }

  public void setColliderFruta(Collider nuevoColliderFruta) {
    this.colliderFruta = nuevoColliderFruta;
  }

  public float getDuracion() {
    return duracion;
  }

  public void setDuracion(float nuevaDuracion) {
    this.duracion = nuevaDuracion;
  }

  public PVector getDireccion() {
    return direccion;
  }

  public void setDireccion(PVector nuevaDireccion) {
    this.direccion = nuevaDireccion;
  }
}

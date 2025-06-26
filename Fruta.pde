class Fruta extends GameObject {

  float velocidad;
  boolean detonar;
  int danio;
  Collider colliderFruta;
  float duracion;
  PVector direccion;

  public Fruta(PVector posicion, PVector tamanio) {
    super(posicion, tamanio);
    this.velocidad = 1;
    this.danio = 1;
    this.duracion = 700;
    this.colliderFruta = new Collider(this.posicion, this.tamanio);
    
    direccion = new PVector(random(-1, 1), random(-1, 1));
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
        posicion.y += velocidad;

        if (posicion.y > height) {
          detonar = true;
        }
      }
     
      
      
    }
  }
  
  public void moverMultiples(){
    
    posicion.x += direccion.x * velocidad;
    posicion.y += direccion.y * velocidad;
    duracion -= 1;
  
  }
  
  
  

  public void explotar(Personaje personaje) {
    Collider colliderPersonaje = new Collider(personaje.posicion, personaje.tamanio);

    if (colliderPersonaje.hayColision(colliderFruta)) {
      personaje.vida -= this.danio;
      detonar = true;
    }
  }
}

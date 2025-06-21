class Fruta extends GameObject{
  
  float velocidadCaida;
  boolean detonar;
  int danio;
  Collider colliderFruta;
  
  public Fruta(PVector posicion, PVector tamanio){
    super(posicion, tamanio);
    this.velocidadCaida = 1;
    this.danio = 1;
    this.colliderFruta = new Collider(this.posicion, this.tamanio);
  }
  
  public void dibujar(){
    fill(#370C48);
    noStroke();
    ellipse(posicion.x, posicion.y, tamanio.x, tamanio.y);
  }
  
  public void mover(){
    posicion.y += velocidadCaida;
    
    if (posicion.y > height) {
      detonar = true;
    }
  }
  
  public void explotar(Personaje personaje){
    Collider colliderPersonaje = new Collider(personaje.posicion, personaje.tamanio);
    
    if(colliderPersonaje.hayColision(colliderFruta)){
      personaje.vida -= this.danio;
      detonar = true;
    }
  }
  
  
  
}

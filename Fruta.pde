class Fruta extends GameObject{
  
  float velocidadCaida;
  boolean detonar;
  
  public Fruta(PVector posicion, PVector tamanio){
    super(posicion, tamanio);
    this.velocidadCaida = 1;
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
  
  
  
  
  
}

class Dinosaurio extends GameObject{
  
  int vida;
  float velocidad;
  int danio;
  
  
  public Dinosaurio(PVector posicion, PVector tamanio, int vida, float velocidad, int danio){
    super(posicion, tamanio);
    this.vida = vida;
    this.velocidad = velocidad;
    this.danio = danio;
  }
  
  public void dibujar(){
    fill(#144006);
    noStroke();
    ellipse(posicion.x, posicion.y, tamanio.x, tamanio.y);
  }
  
  public void mover(){
    
  }
  
}

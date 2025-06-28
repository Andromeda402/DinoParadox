class Dinosaurio extends GameObject {

  protected int vida;
  protected float velocidad;
  protected int danio;


  public Dinosaurio(PVector posicion, PVector tamanio, int vida, float velocidad, int danio) {
    super(posicion, tamanio);
    this.vida = vida;
    this.velocidad = velocidad;
    this.danio = danio;
  }

  public void dibujar() {
    fill(#144006);
    noStroke();
    ellipse(posicion.x, posicion.y, tamanio.x, tamanio.y);
  }

  public void mover() {
  }
  
  public int getVida(){
    return vida;
  }
  
  public void setVida(int nuevaVida){
    this.vida = nuevaVida;
  }
  
  public float getVelocidad(){
    return velocidad;
  }
  
  public void setVelocidad(float nuevaVelocidad){
    this.velocidad = nuevaVelocidad;
  }
  
  public int getDanio(){
    return danio;
  }
  
  public void setDanio(int nuevoDanio){
    this.danio = nuevoDanio;
  }
  
}

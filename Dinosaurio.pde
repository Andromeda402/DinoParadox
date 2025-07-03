class Dinosaurio extends GameObject {
  
  // ======== ATRIBUTOS ========

  protected int vida;
  protected float velocidad;
  protected int danio;
  
  // ======== CONSTRUCTOR ========

  public Dinosaurio(PVector posicion, PVector tamanio, int vida, float velocidad, int danio) {
    super(posicion, tamanio);
    this.vida = vida;
    this.velocidad = velocidad;
    this.danio = danio;
  }
  
  // ======== METODOS ========

  public void dibujar() {
    fill(#144006);
    noStroke();
    //ellipse(posicion.x, posicion.y, tamanio.x, tamanio.y);
    ellipse(getPosicion().x, getPosicion().y, getTamanio().x, getTamanio().y);
  }

  public void mover() {
  }
  
  // ======== GETTERS & SETTERS ========
  
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

class GameObject {

  protected PVector posicion;
  protected PVector tamanio;

  public GameObject(PVector posicion, PVector tamanio) {
    this.posicion = posicion;
    this.tamanio = tamanio;
  }
  
  public void dibujar(){};
  
  public void mover(){};
  
  
  
  public PVector getPosicion(){
    return posicion;
  }
  
  public void setPosicion(PVector nuevaPosicion){
    this.posicion = nuevaPosicion;
  }
  
  public PVector getTamanio(){
    return tamanio;
  }
  
  public void setTamanio(PVector nuevoTamanio){
    this.tamanio = nuevoTamanio;
  }
  
}

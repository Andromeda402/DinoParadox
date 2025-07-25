class GameObject {
  
  //clase encargado de gestionar la posicion y
  //el tamanio de los objetos
  
  // ======== ATRIBUTOS ========

  protected PVector posicion;
  protected PVector tamanio;
  
  // ======== CONSTRUCTOR ========

  public GameObject(PVector posicion, PVector tamanio) {
    this.posicion = posicion;
    this.tamanio = tamanio;
  }
  
  
  // ======== METODOS ========
  
  //Aqui se sobrescriben los métodos dibujar() y mover() porque
  //las sublcases de Dinosaurio modifican el comportamiento original
  //de la clase padre
  
  public void dibujar(){};
  
  public void mover(){};
  
  // ======== GETTERS & SETTERS ========
  
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

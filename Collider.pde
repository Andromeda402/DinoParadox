class Collider {
  
  // ======== ATRIBUTOS ========

  private PVector posicion;
  private PVector tamanio;

  
  // ======== CONSTRUCTOR ========
  
  public Collider(PVector posicion, PVector tamanio) {
    this.posicion = posicion;
    this.tamanio = tamanio;
  }
  
  // ======== METODOS ========
  
  //determina si hay colision entre dos objetos
  public boolean hayColision(Collider collider) {

    //se calcula la diferencia en X e Y de los centros de los
    //objetos(el actual y el que se recibe por parametro)
    float dx = this.posicion.x - collider.posicion.x;
    float dy = this.posicion.y - collider.posicion.y;
    //calcular la distancia entre los centros de los objetos usando Pitagoras
    float distanciaCuadrada = dx * dx + dy * dy; 

    // calcular los radios promedio
    
    //para el primer objeto
    //se divide el tamaño en X e Y para obtener la mitad del
    //ancho y alto, luego se promedia ambos valores para
    //obtener el radio aproximado
    float radioObjetoX = this.tamanio.x / 2.0;
    float radioObjetoY = this.tamanio.y / 2.0;
    float sumaRadioObjeto = (radioObjetoX + radioObjetoY) / 2.0;
    
    //esta parte hace lo mismo que la anterior, pero ahora
    //para el segundo objeto (el que se recibe como parametro)
    float radioColliderX = collider.tamanio.x / 2.0;
    float radioColliderY = collider.tamanio.y / 2.0;
    float sumaRadioCollider = (radioColliderX + radioColliderY) / 2.0;
    
    //se suma ambos radios para saber en que distancia maxima 
    //pueden colisionar, luego se eleva esa suma al cuadrado para
    //determinar la distancia minima que hay entre los centros
    //de los objetos
    float sumaRadios = sumaRadioObjeto + sumaRadioCollider;
    float sumaRadiosCuadrada = sumaRadios * sumaRadios; //cuadrado

    return distanciaCuadrada <= sumaRadiosCuadrada;
  }
  
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

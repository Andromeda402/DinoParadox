class Collider {

  private PVector posicion;
  private PVector tamanio;
  //float radio;

  public Collider(PVector posicion, PVector tamanio) {
    this.posicion = posicion;
    this.tamanio = tamanio;
  }

  public boolean hayColision(Collider collider) {

    // distancia al cuadrado entre los centros
    float dx = this.posicion.x - collider.posicion.x;
    float dy = this.posicion.y - collider.posicion.y;
    float distanciaCuadrada = dx * dx + dy * dy;

    // calcula los radios promedio
    float radioObjetoX = this.tamanio.x / 2.0;
    float radioObjetoY = this.tamanio.y / 2.0;
    float sumaRadioObjeto = (radioObjetoX + radioObjetoY) / 2.0;

    float radioColliderX = collider.tamanio.x / 2.0;
    float radioColliderY = collider.tamanio.y / 2.0;
    float sumaRadioCollider = (radioColliderX + radioColliderY) / 2.0;

    float sumaRadios = sumaRadioObjeto + sumaRadioCollider;
    float sumaRadiosCuadrada = sumaRadios * sumaRadios;

    return distanciaCuadrada <= sumaRadiosCuadrada;
  }
  
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

class Collider{
  
  PVector posicion;
  PVector tamanio;
  //float radio;
  
  public Collider(PVector posicion, PVector tamanio){
    this.posicion = posicion;
    this.tamanio = tamanio;
  }
  
  public boolean hayColision(Collider collider){
    
    //distancia al cuadrado entre los centros
    float dx = this.posicion.x - collider.posicion.x;
    float dy = this.posicion.y - collider.posicion.y;
    
    float distanciaCuadrada = dx * dx + dy * dy;
    
    //calcula los radios en X y en Y del collider
    float sumaRadioObjeto = (this.tamanio.x + this.tamanio.y)/ 2;
    float sumaRadioCollider = (collider.tamanio.x + collider.tamanio.y)/ 2;
    float sumaRadios = sumaRadioObjeto + sumaRadioCollider;
    float sumaRadiosCuadrada = sumaRadios * sumaRadios;
    
    return distanciaCuadrada <= sumaRadiosCuadrada;
    
  }
  
  
  
}

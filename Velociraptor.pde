class Velociraptor extends Dinosaurio{
  
  
  public Velociraptor(PVector posicion, PVector tamanio, int vida, float velocidad, int danio){
    super(posicion, tamanio, vida, velocidad, danio);
  }
  
  public void dibujar(){
    super.dibujar();
  }
  
  public void mover(){
    
    posicion.x += velocidad;
    
  }
  
  public boolean conVida() {
    return vida > 0;
  }
  
}

class Bala extends GameObject {

  private PVector posDestino;
  private PVector direccionProyectil;
  private float velocidad;
  private int danioBala;
  private boolean teclaEspacio;
  private Collider colliderBala;
  
  private float distMouseX;
  private float distMouseY;
  private float magnitud;;

  public Bala(PVector posicion, PVector tamanio, PVector posDestino) {
    super(posicion, tamanio);
    this.posDestino = posDestino;


    this.distMouseX = posDestino.x - posicion.x;
    this.distMouseY = posDestino.y - posicion.y;
    this.magnitud = sqrt(distMouseX * distMouseX + distMouseY * distMouseY);

    this.direccionProyectil = new PVector(distMouseX /magnitud, distMouseY /magnitud);


    this.velocidad = 8;
    this.danioBala = 1;
    this.teclaEspacio = false;
    this.colliderBala = new Collider(this.posicion, this.tamanio);
  }

  public void dibujar() {

    fill(#E1ED67);
    ellipse(posicion.x, posicion.y, tamanio.x, tamanio.y);
  }

  public void mover() {
    
    this.posicion.x += direccionProyectil.x * velocidad;
    this.posicion.y += direccionProyectil.y * velocidad;
  }
  

  public void impactar(Dinosaurio dinosaurio) {
    Collider colliderDinosaurio = new Collider(dinosaurio.posicion, dinosaurio.tamanio);

    if (colliderDinosaurio.hayColision(colliderBala)) {
      dinosaurio.vida -= this.danioBala;
    }
  }




  public void keyPressed() {
    if (keyCode == ' ') {
      teclaEspacio = true;
    }
  }

  public void keyReleased() {
    if (keyCode == ' ') {
      teclaEspacio = false;
    }
  }
  
  
  public PVector getPosDestino(){
    return posDestino;
  }
  
  public void setPosDestino(PVector nuevoPosDestino){
    this.posDestino = nuevoPosDestino;
  }
  
  public PVector getDireccionProyectil(){
    return direccionProyectil;
  }
  
  public void setDireccionProyectil(PVector nuevaDireccionProyectil){
    this.direccionProyectil = nuevaDireccionProyectil;
  }
  
  public float getVelocidad(){
    return velocidad;
  }
  
  public void setVelocidad(float nuevaVelocidad){
    this.velocidad = nuevaVelocidad;
  }
  
  public boolean getTeclaEspacio(){
    return teclaEspacio;
  }
  
  public void setTeclaEspacio(boolean nuevaTeclaEspacio){
    this.teclaEspacio = nuevaTeclaEspacio;
  }
  
  
  public Collider getColliderBala(){
    return colliderBala;
  }
  
  public void setTeclaEspacio(Collider nuevoColliderBala){
    this.colliderBala = nuevoColliderBala;
  }
  
  
  public float getDistMouseX(){
    return distMouseX;
  }
  
  public void setDistMouseX(float nuevaDistMouseX){
    this.distMouseX = nuevaDistMouseX;
  }
  
  public float getDistMouseY(){
    return distMouseY;
  }
  
  public void setDistMouseY(float nuevaDistMouseY){
    this.distMouseY = nuevaDistMouseY;
  }
  
  public float getMagnitud(){
    return magnitud;
  }
  
  public void setMagnitud(float nuevaMagnitud){
    this.magnitud = nuevaMagnitud;
  }
  
}

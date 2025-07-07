class Bala extends GameObject {
  
  // ======== ATRIBUTOS ========

  private PVector posDestino;
  private PVector direccionProyectil;
  private float velocidad;
  private int danioBala;
  private boolean teclaEspacio;
  private Collider colliderBala;
  
  private float distMouseX;
  private float distMouseY;
  private float magnitud;;
  
  // ======== CONSTRUCTOR ========

  public Bala(PVector posicion, PVector tamanio, PVector posDestino) {
    super(posicion, tamanio);
    this.posDestino = posDestino;


    this.distMouseX = getPosDestino().x - getPosicion().x;
    this.distMouseY = getPosDestino().y - getPosicion().y;
    this.magnitud = sqrt(this.distMouseX * this.distMouseX +this. distMouseY * this.distMouseY);

    this.direccionProyectil = new PVector(this.distMouseX /this.magnitud, this.distMouseY /this.magnitud);


    this.velocidad = 540;
    this.danioBala = 1;
    this.teclaEspacio = false;
    this.colliderBala = new Collider(this.posicion, this.tamanio);
  }
  
  // ======== METODOS ========
  
  public void dibujar() {

    fill(#E1ED67);
    //ellipse(posicion.x, posicion.y, tamanio.x, tamanio.y);
    
    ellipse(getPosicion().x, getPosicion().y, getTamanio().x, getTamanio().y);
    
  }

  public void mover() {
    
    this.posicion.x += this.direccionProyectil.x * this.velocidad * deltaTime;
    this.posicion.y += this.direccionProyectil.y * this.velocidad * deltaTime;
  }
  

  public void impactar(Dinosaurio dinosaurio) {
    Collider colliderDinosaurio = new Collider(dinosaurio.posicion, dinosaurio.tamanio);
    
    //si la bala impacta con un dinosaurio le quita vida
    if (colliderDinosaurio.hayColision(colliderBala)) {
      dinosaurio.setVida(dinosaurio.getVida() - this.danioBala);
    }
  }

//Control ESPACIO para disparar
 /* public void keyPressed() {
    if (keyCode == ' ') {
      teclaEspacio = true;
    }
  }

  public void keyReleased() {
    if (keyCode == ' ') {
      teclaEspacio = false;
    }
  }*/
  
  // ======== GETTERS & SETTERS ========
  
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
  
  public int getDanioBala(){
    return danioBala;
  }
  
  public void setDanioBala(int nuevoDanioBala){
    this.danioBala = nuevoDanioBala;
  }
  
}

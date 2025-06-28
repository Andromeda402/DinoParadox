class Personaje extends GameObject {

  private float velocidad;
  private int vida;
  private color colorPersonaje;
  private boolean izquierda, derecha, arriba, abajo;
  private ArrayList<Bala> bala;
  private int estadoAnimacion;
  
  private SpriteRenderer spriteRenderer;

  public Personaje(PVector posicion, PVector tamanio, float velocidad, int vida, color colorPersonaje) {
    super(posicion, tamanio);
    this.velocidad = velocidad;
    this.vida = vida;
    this.colorPersonaje = colorPersonaje;
    this.arriba = false;
    this.abajo = false;
    this.izquierda = false;
    this.derecha = false;
    this.bala = new ArrayList<Bala>();
    
    this.estadoAnimacion = MaquinaEstadosAnimacion.ANIMACION_QUIETO;
    this.spriteRenderer = new SpriteRenderer(this); //this es el personaje actual que se esta creando
                                                    //permite al renderer que pueda acceder a su posicion y tamanio
    
  }
  
  //esto agregue
  public void setSpriteImage(PImage img) {
    spriteRenderer.cambiarImagen(img);
}

  public void dibujar() {

    /*fill(#1C3E98);
    noStroke();
    ellipse(posicion.x, posicion.y, tamanio.x, tamanio.y);
    println(vida);*/
    
    if (vida <= 0) {
    estadoAnimacion = MaquinaEstadosAnimacion.ANIMACION_MUERTE;
  } else if (!arriba && !abajo && !izquierda && !derecha && estadoAnimacion != MaquinaEstadosAnimacion.ANIMACION_ATAQUE) {
    estadoAnimacion = MaquinaEstadosAnimacion.ANIMACION_QUIETO;
  }

  spriteRenderer.mostrarAnimacion(estadoAnimacion);
 
  }

  public void mover(String direccion) {
    
    switch(direccion) {

    case "arriba":
      {
        posicion.y -= velocidad;
        break;
      }

    case "abajo":
      {
        posicion.y += velocidad;
        break;
      }

    case "izquierda":
      {
        posicion.x -= velocidad;
        estadoAnimacion = MaquinaEstadosAnimacion.ANIMACION_CAMINAR_IZQUIERDA;
        break;
      }

    case "derecha":
      {
        posicion.x += velocidad;
        estadoAnimacion = MaquinaEstadosAnimacion.ANIMACION_CAMINAR_DERECHA;
        break;
      }
    }
  }

  public void keyPressed() {
    if (key == 'w' || key == 'W') {
      arriba = true;
    }

    if (key == 's' || key == 'S') {
      abajo = true;
    }

    if (key == 'd' || key == 'D') {
      derecha = true;
    }

    if (key== 'a' || key == 'A') {
      izquierda = true;
    }
  }

  public void keyReleased() {

    if (key == 'w' || key == 'W') {
      arriba = false;
    }

    if (key == 's' || key == 'S') {
      abajo = false;
    }

    if (key == 'd' || key == 'D') {
      derecha = false;
    }

    if (key== 'a' || key == 'A') {
      izquierda = false;
    }
  }

  public void disparar() {
    bala.add(new Bala(
      new PVector(this.posicion.x, this.posicion.y),
      new PVector(10, 10),
      new PVector(mouseX, mouseY)
      ));
  }
  
  
  public float getVelocidad(){
    return velocidad;
  }
  
  public void setVelocidad(float nuevaVelocidad){
    this.velocidad = nuevaVelocidad;
  }
  
  public int getVida(){
    return vida;
  }
  
  public void setVida(int nuevaVida){
    this.vida = nuevaVida;
  }
  
  public color getColorPersonaje(){
    return colorPersonaje;
  }
  
  public void setColorPersonaje(int nuevoColorPersonaje){
    this.colorPersonaje = nuevoColorPersonaje;
  }
  
  public boolean getArriba(){
    return arriba;
  }
  
  public void setArriba(boolean nuevoArriba){
    this.arriba = nuevoArriba;
  }
  
  public boolean getAbajo(){
    return abajo;
  }
  
  public void setAbajo(boolean nuevoAbajo){
    this.abajo = nuevoAbajo;
  }
  
  public boolean getIzquierda(){
    return izquierda;
  }
  
  public void setIzquierda(boolean nuevoIzquierda){
    this.izquierda = nuevoIzquierda;
  }
  
  public boolean getDerecha(){
    return derecha;
  }
  
  public void setDerecha(boolean nuevoDerecha){
    this.derecha = nuevoDerecha;
  }
  
  public ArrayList getBala(){
    return bala;
  }
  
  public void setBala(ArrayList nuevaBala){
    this.bala = nuevaBala;
  }
  
  public int getEstadoAnimacion(){
    return estadoAnimacion;
  }
  
  public void setEstadoAnimacion(int nuevoEstadoAnimacion){
    this.estadoAnimacion = nuevoEstadoAnimacion;
  }
  
  public SpriteRenderer getSpriteRenderer(){
    return spriteRenderer;
  }
  
  public void setSpriteRenderer(SpriteRenderer nuevoSpriteRenderer){
    this.spriteRenderer = nuevoSpriteRenderer;
  }
    
}

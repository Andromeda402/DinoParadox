class Personaje extends GameObject {
  
  // ======== ATRIBUTOS ========

  private float velocidad;
  private int vida;
  private int vidaMaxima;
  private color colorPersonaje;
  private boolean izquierda, derecha, arriba, abajo;
  private ArrayList<Bala> bala;
  private int estadoAnimacion;
  
  private SpriteRenderer spriteRenderer;
  
  //recien agregue hoy
  private boolean espacioPresionado;
  private float cooldownDisparo;
  private float tiempoUltimoDisparo;
  private boolean mirandoIzquierda;
  
  
  // ======== CONSTRUCTOR ========

  public Personaje(PVector posicion, PVector tamanio, float velocidad, int vida, int vidaMaxima, color colorPersonaje) {
    super(posicion, tamanio);
    this.velocidad = velocidad;
    this.vida = vida;
    this.vidaMaxima = vidaMaxima;
    this.colorPersonaje = colorPersonaje;
    this.arriba = false;
    this.abajo = false;
    this.izquierda = false;
    this.derecha = false;
    this.bala = new ArrayList<Bala>();
    
    this.estadoAnimacion = MaquinaEstadosAnimacion.ANIMACION_QUIETO;
    this.spriteRenderer = new SpriteRenderer(this); //this es el personaje actual que se esta creando
                                                    //permite al renderer que pueda acceder a su posicion y tamanio
    //recien agregue hoy
    this.espacioPresionado = true;
    this.cooldownDisparo = 0.2; // segundos
    this.tiempoUltimoDisparo = 0;
    this.mirandoIzquierda = false;
  }
  
  // ======== METODOS ========
  
  //esto agregue
  public void setSpriteImage(PImage img) {
    spriteRenderer.cambiarImagen(img);
}

  //dibuja al personaje utilizando una ellipse
  public void dibujar() {
    if (this.vida <= 0) {
    this.estadoAnimacion = MaquinaEstadosAnimacion.ANIMACION_MUERTE;
  } else if (!arriba && !abajo && !izquierda && !derecha && estadoAnimacion != MaquinaEstadosAnimacion.ANIMACION_ATAQUE) {
    this.estadoAnimacion = MaquinaEstadosAnimacion.ANIMACION_QUIETO;
  }

  spriteRenderer.mostrarAnimacion(estadoAnimacion);
  
  dibujarBarraVida(); 

  }


  public void mover(String direccion) {
    
    switch(direccion) {

    case "arriba":
      {
        this.posicion.y -= this.velocidad * deltaTime;
        break;
      }

    case "abajo":
      {
        this.posicion.y += this.velocidad * deltaTime;
        break;
      }

    case "izquierda":
      {
        this.posicion.x -= this.velocidad * deltaTime;
        estadoAnimacion = MaquinaEstadosAnimacion.ANIMACION_CAMINAR_IZQUIERDA;
        this.mirandoIzquierda = true;
        break;
      }

    case "derecha":
      {
        this.posicion.x += this.velocidad * deltaTime;
        estadoAnimacion = MaquinaEstadosAnimacion.ANIMACION_CAMINAR_DERECHA;
        this.mirandoIzquierda = false;
        break;
      }
    }
  }

  //controles activos W, A, S, D
  public void keyPressed() {
    if (key == 'w' || key == 'W') {
      this.arriba = true;
    }

    if (key == 's' || key == 'S') {
      this.abajo = true;
    }

    if (key == 'd' || key == 'D') {
      this.derecha = true;
    }

    if (key== 'a' || key == 'A') {
      this.izquierda = true;
    }
    
    if (key == ' ') espacioPresionado = false;
  }
  
  //controles inactivos W, A, S, D
  public void keyReleased() {

    if (key == 'w' || key == 'W') {
      this.arriba = false;
    }

    if (key == 's' || key == 'S') {
      this.abajo = false;
    }

    if (key == 'd' || key == 'D') {
      this.derecha = false;
    }

    if (key== 'a' || key == 'A') {
      this.izquierda = false;
    }
    
    if (key == ' ') espacioPresionado = true;
  }


  //agregue hoy
  public void disparar() {
    float tiempoActual = millis() / 1000.0;
    if (tiempoActual - tiempoUltimoDisparo >= cooldownDisparo) {
      Bala nueva = new Bala(
        new PVector(this.posicion.x, this.posicion.y),
        new PVector(10, 10),
        new PVector(mouseX, mouseY)
        );
      bala.add(nueva);
      tiempoUltimoDisparo = tiempoActual;
    }
  }
  
  // ======== GETTERS & SETTERS ========
  
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
  
  public boolean isEspacioPresionado(){
    return espacioPresionado;
  }
  
  public void recibirDanio(int danio){
    this.vida = max(0, this.vida - danio);
    println("vida actual: " + this.vida);
  }
  
  private void dibujarBarraVida() {
  float barraAncho = 100;
  float barraAlto = 10;
  float x = posicion.x - barraAncho / 2;
  float y = posicion.y - tamanio.y / 2 - 20;

  // Fondo (gris oscuro)
  fill(80);
  noStroke();
  rect(x, y, barraAncho, barraAlto);

  // Vida actual (verde)
  float vidaProporcional = map(vida, 0, 100, 0, barraAncho);
  fill(#00FF00);
  rect(x, y, vidaProporcional, barraAlto);

  // Borde
  stroke(0);
  noFill();
  rect(x, y, barraAncho, barraAlto);
  }   
  
  public boolean isMirandoIzquierda(){
    return mirandoIzquierda;
  }
}

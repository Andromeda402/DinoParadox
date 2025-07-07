class Pterodactilo extends Dinosaurio {
  
  // ======== ATRIBUTOS ========

  private boolean cambioSentido;
  private int tiempoSoltarFruta;
  private ArrayList<Fruta> fruta;
  
  // ======== CONSTRUCTOR ========

  public Pterodactilo(PVector posicion, PVector tamanio, int vida, float velocidad, int danio) {
    super(posicion, tamanio, vida, velocidad, danio);
    this.fruta = new ArrayList<Fruta>();
  }
  
  // ======== METODOS ========
  
  //dibuja al pterodactilo utilizando una ellipse de color verder
  //y las frutas que suelta
  public void dibujar() {
    fill(#FFA500);
    ellipse(getPosicion().x, getPosicion().y, getTamanio().x, getTamanio().y);

    for (Fruta f : this.fruta) {
      f.dibujar();
    }
  }

  //el pterodactilo se mueve de izquierda a derecha de la pantalla
  public void mover(Personaje personaje, Dinosaurio dinosaurio) {
    if (this.cambioSentido == true) {
      this.posicion.x += dinosaurio.getVelocidad() * deltaTime;
      if (posicion.x + tamanio.x / 2 >= width) {
        this.cambioSentido = false;
      }
    } else {
      this.posicion.x -= dinosaurio.getVelocidad() * deltaTime;
      if (this.posicion.x - dinosaurio.getTamanio().x / 2 <= 0) {
        this.cambioSentido = true;
      }
    }

    this.tiempoSoltarFruta +=1;

    if (this.tiempoSoltarFruta >= 420) { // cada 4 segundos
      soltarFruta();
      this.tiempoSoltarFruta = 0;
    }

    for (int i = this.fruta.size() - 1; i >= 0; i--) {
      Fruta f = this.fruta.get(i);
      f.mover(1);
      f.explotar(personaje);
      if (f.detonar) {
        this.fruta.remove(i);
        //println("fruta eliminada");
      }
    }
  }

  //suelta la fruta para dañar al jugador
  public void soltarFruta() {
    fruta.add(new Fruta(new PVector(posicion.x, posicion.y), new PVector(15, 15)));
  }
  
  // ======== GETTERS & SETTERS ========

  public boolean conVida() {
    return vida > 0;
  }
  
  public boolean getCambioSentido(){
    return cambioSentido;
  }
  
  public void setCambioSentido(boolean nuevoCambioSentido){
    this.cambioSentido = nuevoCambioSentido;
  }
  
  public int getTiempoSoltarFruta(){
    return tiempoSoltarFruta;
  }
  
  public void setTiempoSoltarFruta(int nuevoTiempoSoltarFruta){
    this.tiempoSoltarFruta = nuevoTiempoSoltarFruta;
  }
  
  public ArrayList getFruta(){
    return fruta;
  }
  
  public void setFruta(ArrayList nuevaFruta){
    this.fruta = nuevaFruta;
  }
  
}

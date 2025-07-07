class Matriarca extends Dinosaurio {  //reutilizacion del spawner de los 
                                      //dinosaurios para generar a la matriarca
  
  // ======== ATRIBUTOS ========

  private Collider colliderMatriarca;
  private int tiempoSoltarFruta;
  private ArrayList<Fruta> fruta;
  private int limiteFruta;
  
  // ======== CONSTRUCTOR ========
  
  public Matriarca (PVector posicion, PVector tamanio, int vida, float velocidad, int danio) {
    super(posicion, tamanio, vida, velocidad, danio);
    this.fruta = new ArrayList<Fruta>();
    this.colliderMatriarca = new Collider(this.posicion, this.tamanio);
    
    this.limiteFruta = 35;
  }
  
  // ======== METODOS ========

  public void dibujar() {
    fill(#DE0000);
    ellipse(getPosicion().x, getPosicion().y, getTamanio().x, getTamanio().y);

    for (Fruta f : fruta) {
      f.dibujar();
    }
  }

//la matriarca se mueve hacia el personaje persiguiendolo
  public void mover(Personaje personaje) {

    
    float dx = personaje.getPosicion().x - getPosicion().x;
    
    
    float dy = personaje.getPosicion().y - getPosicion().y;

    
    float distanciaPersonaje = dist(personaje.getPosicion().x, personaje.getPosicion().y, getPosicion().x, getPosicion().y);

    if (distanciaPersonaje > 1) {
      
      this.posicion.x += dx / distanciaPersonaje * getVelocidad() * deltaTime;
      
      this.posicion.y += dy / distanciaPersonaje * getVelocidad() * deltaTime;
    }
  }

  //metodo para atacar al personaje si esta cuerpo a cuerpo
  public void atacar(Personaje personaje) {
    Collider colliderPersonaje = new Collider(personaje.getPosicion(), personaje.getTamanio());

    if (colliderPersonaje.hayColision(colliderMatriarca)) {
      //personaje.vida -= this.danio;
      personaje.setVida(personaje.getVida() - this.danio);
    }
  }

  //metodo para disparar multiples frutas a su alrededor
  public void dispararFruta(Personaje personaje) {
    this.tiempoSoltarFruta +=1;

    if (this.tiempoSoltarFruta >= 20 && fruta.size() < this.limiteFruta) { 
      //fruta.add(new Fruta(new PVector(getPosicion().x, getPosicion().y), new PVector(15, 15)));
      
      fruta.add(new Fruta(new PVector(getPosicion().x, getPosicion().y), new PVector(15, 15) ));
      
      this.tiempoSoltarFruta = 0;
    }

    for (int i = fruta.size() - 1; i >= 0; i--) {
      Fruta f = fruta.get(i);
      f.moverMultiples();
      f.explotar(personaje);
      f.duracion -=1;
      if (f.detonar || f.duracion <= 0) {
        fruta.remove(i);
        //println("fruta eliminada");
      }
    }

    
  }
  
  // ======== GETTERS & SETTERS ========
  
  public boolean conVida() {
    return vida > 0;
  }
  
  public Collider getColliderMatriarca(){
    return colliderMatriarca;
  }
  
  public void setColliderMatriarca(Collider nuevoColliderMatriarca){
    this.colliderMatriarca = nuevoColliderMatriarca;
  }
  
  public ArrayList getFruta(){
    return fruta;
  }
  
  public void setFruta(ArrayList nuevaFruta){
    this.fruta = nuevaFruta;
  }
  
  public int getlimiteFruta(){
    return limiteFruta;
  }
  
  public void setLimiteFruta(int nuevoLimiteFruta){
    this.limiteFruta = nuevoLimiteFruta;
  }
  
}

class Matriarca extends Dinosaurio {  //reutilizacion del spawner de los 
                                      //dinosaurios para generar a la matriarca

  private Collider colliderMatriarca;
  private int tiempoSoltarFruta;
  private ArrayList<Fruta> fruta;
  private int limiteFruta;
  
  public Matriarca (PVector posicion, PVector tamanio, int vida, float velocidad, int danio) {
    super(posicion, tamanio, vida, velocidad, danio);
    this.fruta = new ArrayList<Fruta>();
    colliderMatriarca = new Collider(this.posicion, this.tamanio);
    
    limiteFruta = 10;
  }

  public void dibujar() {
    fill(#DE0000);
    ellipse(posicion.x, posicion.y, tamanio.x, tamanio.y);

    for (Fruta f : fruta) {
      f.dibujar();
    }
  }

  public void mover(Personaje personaje) {

    float dx = personaje.posicion.x - this.posicion.x;
    float dy = personaje.posicion.y - this.posicion.y;

    float distanciaPersonaje = dist(personaje.posicion.x, personaje.posicion.y, this.posicion.x, this.posicion.y);

    if (distanciaPersonaje > 1) {
      this.posicion.x += dx / distanciaPersonaje * velocidad;
      this.posicion.y += dy / distanciaPersonaje * velocidad;
    }
  }


  public void atacar(Personaje personaje) {
    Collider colliderPersonaje = new Collider(personaje.posicion, personaje.tamanio);

    if (colliderPersonaje.hayColision(colliderMatriarca)) {
      personaje.vida -= this.danio;
    }
  }

  public void dispararFruta(Personaje personaje) {
    tiempoSoltarFruta +=1;

    if (tiempoSoltarFruta >= 20 && fruta.size() < limiteFruta) { 
      fruta.add(new Fruta(new PVector(posicion.x, posicion.y), new PVector(15, 15)));
      tiempoSoltarFruta = 0;
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

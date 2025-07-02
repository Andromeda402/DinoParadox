class Nivel02 {

  private Personaje personaje;
  private SpawnerDinosaurio spawnerMatriarca;
  private SpriteRenderer spriteRendererer;// esto agregue


  public Nivel02(PImage spritePersonaje) {
    personaje = new Personaje(
      new PVector (300, 400), //posicion
      new PVector(40, 40), //tamanio
      160, // velocidad
      20, //vidas
      color(#1C3E98)); //color
    spawnerMatriarca = new SpawnerDinosaurio();
  
   // spriteRenderer = new SpriteRenderer();//esto agregue
    personaje.spriteRenderer.cambiarImagen(spritePersonaje); 
  }

  public void iniciar() {
    
    
    mover();
    personaje.dibujar();
    
    
    spawnerMatriarca.actualizarMatriarca(personaje);
    spawnerMatriarca.dibujar();
    

      for (int i = personaje.bala.size() - 1; i >= 0; i--) {
        Bala b = personaje.bala.get(i);
        b.mover();
        b.dibujar();
        boolean colisiono = false;

      
        
        // Verificar colision con matriarca
        if (!colisiono) {
          for (int h = this.spawnerMatriarca.matriarca.size() - 1; h >= 0; h--) {
            Matriarca m = this.spawnerMatriarca.matriarca.get(h);
            Collider colMatriarca = new Collider(m.getPosicion(), m.getTamanio());
            if (b.colliderBala.hayColision(colMatriarca)) {
              //m.vida -= b.danioBala;
              m.setVida(m.getVida() - b.getDanioBala());
              if (m.getVida() <= 0) { //solo cuenta si el dino llego a 0 y no fue eliminado por el spawner
                estadoJuego = MaquinaEstadosJuego.VICTORIA;
                println("GANASTE EL JUEGO FELICIDADES");
              }
              colisiono = true;
              break;
            }
          }
        }
        

        // Si algun dinosarurio colisiono o se salio de pantalla se elimina
        if (colisiono || b.getPosicion().x < 0 || b.getPosicion().x > width || b.getPosicion().y < 0 || b.getPosicion().y > height) {
          personaje.bala.remove(i);
        }
      }
      
      if(personaje.getVida() <= 0){
      estadoJuego = MaquinaEstadosJuego.DERROTA;
      println("FUERA DE COMBATE");
     }
    }
  

  public void mover() {
    if (personaje.arriba) personaje.mover("arriba");
    if (personaje.abajo) personaje.mover("abajo");
    if (personaje.izquierda) personaje.mover("izquierda");
    if (personaje.derecha) personaje.mover("derecha");
  }

  public void keyPressed() {

    personaje.keyPressed();

    if (key == ' ') { // espacio
      personaje.disparar();
    }
  }

  public void keyReleased() {

    personaje.keyReleased();
  }
  
  public Personaje personaje(){
    return personaje;
  }
  
  public void getPersonaje(Personaje nuevoPersonaje){
    this.personaje = nuevoPersonaje;
  }
  
  public SpawnerDinosaurio getSpawnerMatriarca(){
    return spawnerMatriarca;
  }
  
  public void setSpawnerMatriarca(SpawnerDinosaurio nuevoSpawnerMatriarca){
    this.spawnerMatriarca = nuevoSpawnerMatriarca;
  }

}

class Nivel01 {
 
  private Personaje personaje;
  private SpawnerDinosaurio spawnerVelociraptor;
  private SpawnerDinosaurio spawnerPterodactilo;
  private SpawnerDinosaurio spawnerTriceratops;

  private int contadorEliminaciones;


  public Nivel01(PImage spritePersonaje) {
    personaje = new Personaje(
      new PVector (300, 400), //posicion
      new PVector(40, 40), //tamanio
      4, // velocidad
      600, //vidas 
      color(#1C3E98)); //color
    spawnerVelociraptor = new SpawnerDinosaurio();
    spawnerPterodactilo = new SpawnerDinosaurio();
    spawnerTriceratops = new SpawnerDinosaurio();

    personaje.spriteRenderer.cambiarImagen(spritePersonaje);
    
    contadorEliminaciones = 0;
  }

  public void iniciar() {
    

    mover();
    personaje.dibujar();

    spawnerVelociraptor.actualizarVelociraptor();
    spawnerVelociraptor.dibujar();

    spawnerPterodactilo.actualizarPterodactilo(personaje);
    spawnerPterodactilo.dibujar();

    spawnerTriceratops.actualizarTriceratops(personaje);
    spawnerTriceratops.dibujar();

    for (Velociraptor velociraptor : spawnerVelociraptor.velociraptor) {
      velociraptor.chocar(personaje);



      for (int i = personaje.bala.size() - 1; i >= 0; i--) {
        Bala b = personaje.bala.get(i);
        b.mover();
        b.dibujar();



        boolean colisiono = false;

        // Verificar colision con velociraptores
        for (int h = spawnerVelociraptor.velociraptor.size() - 1; h >= 0; h--) {
          Velociraptor v = spawnerVelociraptor.velociraptor.get(h);
          if (b.colliderBala.hayColision(v.colliderVelociraptor)) {
            v.vida -= b.danioBala;
            if (v.vida <= 0) { //solo cuenta si el dino llego a 0 y no fue eliminado por el spawner
              contadorEliminaciones += 1;
              println("Dinosaurios Eliminados: "+contadorEliminaciones);
            }
            colisiono = true;
            break;  // Una bala solo golpea una vez
          }
        }

        // Verificar colision con pterodactilos
        if (!colisiono) {
          for (int h = spawnerPterodactilo.pterodactilo.size() - 1; h >= 0; h--) {
            Pterodactilo p = spawnerPterodactilo.pterodactilo.get(h);
            Collider colPterodactilo = new Collider(p.posicion, p.tamanio);
            if (b.colliderBala.hayColision(colPterodactilo)) {
              p.vida -= b.danioBala;
              if (p.vida <= 0) { //solo cuenta si el dino llego a 0 y no fue eliminado por el spawner
                contadorEliminaciones += 1;
                println("Dinosaurios Eliminados: "+contadorEliminaciones);
              }
              colisiono = true;
              break;
            }
          }
        }

        // Verificar colision con triceratops
        if (!colisiono) {
          for (int h = spawnerTriceratops.triceratops.size() - 1; h >= 0; h--) {
            Triceratops p = spawnerTriceratops.triceratops.get(h);
            Collider colTriceratops = new Collider(p.posicion, p.tamanio);
            if (b.colliderBala.hayColision(colTriceratops)) {
              p.vida -= b.danioBala;
              if (p.vida <= 0) { //solo cuenta si el dino llego a 0 y no fue eliminado por el spawner
                contadorEliminaciones += 1;
                println("Dinosaurios Eliminados: " +contadorEliminaciones);
              }
              colisiono = true;
              break;
            }
          }
        }


        // Si algun dinosarurio colisiono o se salio de pantalla se elimina
        if (colisiono || b.posicion.x < 0 || b.posicion.x > width || b.posicion.y < 0 || b.posicion.y > height) {
          personaje.bala.remove(i);
        }
      }
    }

    //contador para los dinosaurios eliminados por el jugador
    if (contadorEliminaciones >= 10) { //se deben eliminar x cantidad de dinosaurios para llegar al siguiente nivel
      estadoJuego = MaquinaEstadosJuego.JUGANDO_NIVEL02;
      println("¡Pasaste al Nivel 2 por eliminar " +contadorEliminaciones+ " dinosaurios");
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
  
  public Personaje getPersonaje(){
    return personaje;
  }
  
  public void setPersonaje(Personaje nuevoPersonaje){
    this.personaje = nuevoPersonaje;
  }
  
  public SpawnerDinosaurio getSpawnerVelociraptor(){
    return spawnerVelociraptor;
  }
  
  public void setSpawnerVelociraptor(SpawnerDinosaurio nuevoSpawnerVelociraptor){
    this.spawnerVelociraptor = nuevoSpawnerVelociraptor;
  }
  
  public SpawnerDinosaurio getSpawnerPterodactilo(){
    return spawnerPterodactilo;
  }
  
  public void setSpawnerPterodactilo(SpawnerDinosaurio nuevoSpawnerPterodactilo){
    this.spawnerPterodactilo = nuevoSpawnerPterodactilo;
  }
  
  public SpawnerDinosaurio getSpawnerTriceratops(){
    return spawnerTriceratops;
  }
  
  public void setSpawnerTriceratops(SpawnerDinosaurio nuevoSpawnerTriceratops){
    this.spawnerTriceratops = nuevoSpawnerTriceratops;
  }
  
}

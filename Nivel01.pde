class Nivel01 {

  Personaje personaje;
  SpawnerDinosaurio spawnerVelociraptor;
  SpawnerDinosaurio spawnerPterodactilo;
  SpawnerDinosaurio spawnerTriceratops;


  public Nivel01() {
    personaje = new Personaje(
      new PVector (300, 400), //posicion
      new PVector(40, 40), //tamanio
      4, // velocidad
      6, //vidas
      color(#1C3E98)); //color
    spawnerVelociraptor = new SpawnerDinosaurio();
    spawnerPterodactilo = new SpawnerDinosaurio();
    spawnerTriceratops = new SpawnerDinosaurio();
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
            colisiono = true;
            break;  // Una bala solo golpea a uno
          }
        }

        // Verificar colision con pterodactilos
        if (!colisiono) {
          for (int h = spawnerPterodactilo.pterodactilo.size() - 1; h >= 0; h--) {
            Pterodactilo p = spawnerPterodactilo.pterodactilo.get(h);
            Collider colPterodactilo = new Collider(p.posicion, p.tamanio);
            if (b.colliderBala.hayColision(colPterodactilo)) {
              p.vida -= b.danioBala;
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
              colisiono = true;
              break;
            }
          }
        }
        

        // Si algun dinosarurio colisiono o se salio de pantalla, se elimina
        if (colisiono || b.posicion.x < 0 || b.posicion.x > width || b.posicion.y < 0 || b.posicion.y > height) {
          personaje.bala.remove(i);
        }
      }
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
}

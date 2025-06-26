class Nivel02 {

  Personaje personaje;
  SpawnerDinosaurio spawnerMatriarca;
  
  


  public Nivel02() {
    personaje = new Personaje(
      new PVector (300, 400), //posicion
      new PVector(40, 40), //tamanio
      4, // velocidad
      600, //vidas
      color(#1C3E98)); //color
    spawnerMatriarca = new SpawnerDinosaurio();
  
    
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
          for (int h = spawnerMatriarca.matriarca.size() - 1; h >= 0; h--) {
            Matriarca m = spawnerMatriarca.matriarca.get(h);
            Collider colMatriarca = new Collider(m.posicion, m.tamanio);
            if (b.colliderBala.hayColision(colMatriarca)) {
              m.vida -= b.danioBala;
              if (m.vida <= 0) { //solo cuenta si el dino llego a 0 y no fue eliminado por el spawner
                estadoJuego = MaquinaEstadosJuego.VICTORIA;
                println("GANASTE EL JUEGO FELICIDADES");
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

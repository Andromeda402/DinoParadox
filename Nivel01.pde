class Nivel01 {

  Personaje personaje;
  SpawnerDinosaurio spawnerVelociraptor;

  public Nivel01() {
    personaje = new Personaje(
      new PVector (300, 400), //posicion
      new PVector(40, 40), //tamanio
      4, // velocidad
      6, //vidas
      color(#1C3E98)); //color
    spawnerVelociraptor = new SpawnerDinosaurio();
  }

  public void iniciar() {

    mover();
    personaje.dibujar();
    spawnerVelociraptor.actualizarVelociraptor();
    spawnerVelociraptor.dibujar();
    
  }

  public void mover() {
    if (personaje.arriba) personaje.mover("arriba");
    if (personaje.abajo) personaje.mover("abajo");
    if (personaje.izquierda) personaje.mover("izquierda");
    if (personaje.derecha) personaje.mover("derecha");
  }

  public void keyPressed() {

    personaje.keyPressed();
  }

  public void keyReleased() {

    personaje.keyReleased();
  }
}

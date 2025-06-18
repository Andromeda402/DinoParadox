class SpawnerDinosaurio {

  ArrayList<Velociraptor> velociraptor;
  int tiempoEntreSpawns;
  int contador;

  public SpawnerDinosaurio() {
    this.velociraptor = new ArrayList<Velociraptor>();
    this.tiempoEntreSpawns = 120;
    this.contador = 0;
  }

  public void dibujar() {
    for (Velociraptor v : velociraptor) {
      v.dibujar();
    }
  }

  public void generarVelociraptor() {


    Velociraptor v = new Velociraptor(
      new PVector(0, random(300, height -50)),
      new PVector(50, 50),
      3,
      1,
      1
      );


    for (int i = 0; i < 5-1; i++) {
      velociraptor.add(v);
    }
  }



  public void actualizarVelociraptor() {
    contador++;
    if (contador >= tiempoEntreSpawns) {
      generarVelociraptor();
      contador = 0;
    }


    for (int i = velociraptor.size() - 1; i >= 0; i--) {
      Velociraptor v = velociraptor.get(i);
      if (v != null) {

        v.mover();
        if (v.conVida() == false) {

          velociraptor.remove(i);
        }
      }
    }
  }
}

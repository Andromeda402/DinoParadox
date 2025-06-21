class SpawnerDinosaurio {

  ArrayList<Velociraptor> velociraptor;
  int tiempoRecargaV;
  int contadorV;
  
  ArrayList<Pterodactilo> pterodactilo;
  int tiempoRecargaP;
  int contadorP;
  
  public SpawnerDinosaurio() {
    this.velociraptor = new ArrayList<Velociraptor>();
    this.pterodactilo = new ArrayList<Pterodactilo>();
    this.tiempoRecargaV = 100;
    this.tiempoRecargaP = 350;
    this.contadorV = 0;
    this.contadorP = 0;
  }

  public void dibujar() {
    for (Velociraptor v : velociraptor) {
      v.dibujar();
    }
    
    for(Pterodactilo p : pterodactilo){
      p.dibujar();
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
  
  public void generarPterodactilo(){
    
    Pterodactilo p = new Pterodactilo(
    new PVector(0, random(100, height - 450)),
    new PVector(30, 30),
      3,
      1,
      1
    );
    
    for (int i = 0; i < 8-1; i++) {
      pterodactilo.add(p);
    }
    
  }



  public void actualizarVelociraptor() {
    
    //Velociraptor
    contadorV++;
    if (contadorV >= tiempoRecargaV) {
      generarVelociraptor();
      contadorV = 0;
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
    
    public void actualizarPterodactilo(Personaje personaje){
      //Pterodactilo
   contadorP++;
   if(contadorP >= tiempoRecargaP){
     generarPterodactilo();
     contadorP = 0;
   }
   
   for (int i = pterodactilo.size() - 1; i >= 0; i--) {
      Pterodactilo p = pterodactilo.get(i);
      if (p != null) {

        p.mover(personaje);
        if (p.conVida() == false) {

          pterodactilo.remove(i);
        }
      }
    }
    
   
  }
  
  
  
  
  
  
  
}

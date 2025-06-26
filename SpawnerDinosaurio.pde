class SpawnerDinosaurio {

  ArrayList<Velociraptor> velociraptor;
  int tiempoRecargaV;
  int contadorV;

  ArrayList<Pterodactilo> pterodactilo;
  int tiempoRecargaP;
  int contadorP;
  
  ArrayList<Triceratops> triceratops;
  int tiempoRecargaT;
  int contadorT;
  
  ArrayList<Matriarca> matriarca;
  int tiempoRecargaM;
  int contadorM;
  boolean matriarcaGenerada;
  

  public SpawnerDinosaurio() {
    this.velociraptor = new ArrayList<Velociraptor>();
    this.pterodactilo = new ArrayList<Pterodactilo>();
    this.triceratops = new ArrayList<Triceratops>();
    this.tiempoRecargaV = 100;
    this.tiempoRecargaP = 350;
    this.tiempoRecargaT = 500;
    this.contadorV = 0;
    this.contadorP = 0;
    this.contadorT = 0;
    
    this.matriarca = new ArrayList<Matriarca>();
    this.tiempoRecargaM = 100; //sin usar
    this.contadorM = 0; //sin usar
    this.matriarcaGenerada = false;
    
  }

  public void dibujar() {
    for (Velociraptor v : velociraptor) {
      v.dibujar();
    }

    for (Pterodactilo p : pterodactilo) {
      p.dibujar();
    }
    
    for (Triceratops t : triceratops) {
      t.dibujar();
    }
    
    for (Matriarca m : matriarca) {
      m.dibujar();
    }
    
  }

  public void generarVelociraptor() {

    Velociraptor v = new Velociraptor(
      new PVector(0, random(300, height -50)),
      new PVector(50, 50),
      2,
      1,
      1
      );


    for (int i = 0; i < 5-1; i++) {
      velociraptor.add(v);
    }
  }

  public void generarPterodactilo() {

    Pterodactilo p = new Pterodactilo(
      new PVector(0, random(100, height - 450)),
      new PVector(50, 50),
      1,
      1,
      1
      );

    for (int i = 0; i < 8-1; i++) {
      pterodactilo.add(p);
    }
  }
  
  public void generarTriceratops(){
    
    Triceratops t = new Triceratops(
      new PVector(0, random(300, height - 50)),
      new PVector(80, 80),
      8,
      0.20,
      1
      );

    for (int i = 0; i < 8-1; i++) {
      triceratops.add(t);
    }
  }
  
  public void generarMatriarca(){
    
    Matriarca m = new Matriarca(
      new PVector(0, random(300, height - 50)),
      new PVector(100, 100),
      20,
      0.30,
      1
      );

    for (int i = 0; i < 1; i++) {
      matriarca.add(m);
      
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

  public void actualizarPterodactilo(Personaje personaje) {
    //Pterodactilo
    contadorP++;
    if (contadorP >= tiempoRecargaP) {
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
  
  public void actualizarTriceratops(Personaje personaje) {
    //Triceratops
    contadorT++;
    if (contadorT >= tiempoRecargaT) {
      generarTriceratops();
      contadorT = 0;
    }

    for (int i = triceratops.size() - 1; i >= 0; i--) {
      Triceratops t = triceratops.get(i);
      if (t != null) {

        t.mover(personaje);
        if (t.conVida() == false) {
          
          triceratops.remove(i);
        }
      }
    }
  }
  
  public void actualizarMatriarca(Personaje personaje) {
    //Triceratops
    contadorM++;
    if (!matriarcaGenerada) {
      generarMatriarca();
      matriarcaGenerada = true; // SOLO UNA VEZ
    }

    for (int i = matriarca.size() - 1; i >= 0; i--) {
      Matriarca m = matriarca.get(i);
      if (m != null) {
        m.mover(personaje);
        m.atacar(personaje);
        m.dispararFruta(personaje);

        if (!m.conVida()) {
          matriarca.remove(i);
        }
      }
      
    }
  }
  
  
}

class SpawnerDinosaurio {
  
  // ======== ATRIBUTOS ========

  private ArrayList<Velociraptor> velociraptor;
  private int tiempoRecargaV;
  private int contadorV;

  private ArrayList<Pterodactilo> pterodactilo;
  private int tiempoRecargaP;
  private int contadorP;
  
  private ArrayList<Triceratops> triceratops;
  private int tiempoRecargaT;
  private int contadorT;
  
  private ArrayList<Matriarca> matriarca;
  private int tiempoRecargaM;
  private int contadorM;
  private boolean matriarcaGenerada;
  
  // ======== CONSTRUCTOR ========
  
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
  
  // ======== METODOS ========
   
  //para cada dinosaurio de su propio tipo se dibuja el dinoaurio
  public void dibujar() {
    for (Velociraptor v : this.velociraptor) {
      v.dibujar();
    }

    for (Pterodactilo p : this.pterodactilo) {
      p.dibujar();
    }
    
    for (Triceratops t : this.triceratops) {
      t.dibujar();
    }
    
    for (Matriarca m : this.matriarca) {
      m.dibujar();
    }
    
  }

  //generador de velociraptores
  public void generarVelociraptor() {

    Velociraptor v = new Velociraptor( 
      new PVector(0, random(300, height -50)), // posicion
      new PVector(60, 60), //tamanio
      2, // vida
      65, // velocidad
      1, // danio
      raptorSheet,
  4,  // columnas del spritesheet
  5   // filas del spritesheet
      );


    for (int i = 0; i < 5-1; i++) {
      velociraptor.add(v);
    }
  }

  //generador de pterodactilos
  public void generarPterodactilo() {

    Pterodactilo p = new Pterodactilo(
      new PVector(0, random(100, height - 450)), // posicion
      new PVector(50, 50),
      1, // vida
      60, // velocidad
      1, // danio
      pteroSheet,
  3,  // columnas del spritesheet
  3  //filas
      );

    for (int i = 0; i < 8-1; i++) {
      pterodactilo.add(p);
    }
  }
  
  //generador de triceratops
  public void generarTriceratops(){
    
    Triceratops t = new Triceratops(
      new PVector(0, random(300, height - 50)), // posicion
      new PVector(80, 80),
      8, // vida
      10, // velocidad
      1, // danio
      triceSheet,
  4,  // columnas del spritesheet
  5  //filas
      );

    for (int i = 0; i < 8-1; i++) {
      triceratops.add(t);
    }
  }
  
  //generador de matriarca (una sola)
  public void generarMatriarca(){
    
    Matriarca m = new Matriarca(
      new PVector(0, random(300, height - 50)), // posicion
      new PVector(100, 100),
      20, // vida
      5, // velocidad
      1, // danio
      matriarcaSheet,
  4,  // columnas del spritesheet
  4   // filas del spritesheet
      );

    for (int i = 0; i < 1; i++) {
      matriarca.add(m);
      println("Se creó una Matriarca");
    }
  }
  

  //para cada dinosaurio se utiliza un metodo actualizar 
  //para que se generen cada cierto tiempo y se 
  //remuevan si ya no tienen vida

  public void actualizarVelociraptor() {

    //Velociraptor
    contadorV++;
    if (this.contadorV >= this.tiempoRecargaV) {
      generarVelociraptor();
      this.contadorV = 0;
    }


    for (int i = this.velociraptor.size() - 1; i >= 0; i--) {
      Velociraptor v = this.velociraptor.get(i);
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
    if (this.contadorP >= this.tiempoRecargaP) {
      generarPterodactilo();
      this.contadorP = 0;
    }

    for (int i = this.pterodactilo.size() - 1; i >= 0; i--) {
      Pterodactilo p = this.pterodactilo.get(i);
      if (p != null) {

        p.mover(personaje, p);
        if (p.conVida() == false) {
          
          pterodactilo.remove(i);
        }
      }
    }
  }
  
  public void actualizarTriceratops(Personaje personaje) {
    //Triceratops
    contadorT++;
    if (this.contadorT >= this.tiempoRecargaT) {
      generarTriceratops();
      this.contadorT = 0;
    }

    for (int i = this.triceratops.size() - 1; i >= 0; i--) {
      Triceratops t = this.triceratops.get(i);
      if (t != null) {

        t.mover(personaje, t);
        t.atacar(personaje);
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

    for (int i = this.matriarca.size() - 1; i >= 0; i--) {
      Matriarca m = this.matriarca.get(i);
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
  
  // ======== GETTERS & SETTERS ========
  
  public ArrayList getVelociraptor(){
    return velociraptor;
  }
  
  public void setVelociraptor(ArrayList nuevoVelociraptor){
    this.velociraptor = nuevoVelociraptor;
  }
  
  public int getTiempoRecargaV(){
    return tiempoRecargaV;
  }
  
  public void setTiempoRecargaV(int nuevoTiempoRecargaV){
    this.tiempoRecargaV = nuevoTiempoRecargaV;
  }
  
  public int getContadorV(){
    return contadorV;
  }
  
  public void setContadorV(int nuevoContadorV){
    this.contadorV = nuevoContadorV;
  }
  
  public ArrayList getPterodactilo(){
    return pterodactilo;
  }
  
  public void setPterodactilo(ArrayList nuevoPterodactilo){
    this.pterodactilo = nuevoPterodactilo;
  }
  
  public int getTiempoRecargaP(){
    return tiempoRecargaP;
  }
  
  public void setTiempoRecargaP(int nuevoTiempoRecargaP){
    this.tiempoRecargaP = nuevoTiempoRecargaP;
  }
  
  public int getContadorP(){
    return contadorP;
  }
  
  public void setContadorP(int nuevoContadorP){
    this.contadorP = nuevoContadorP;
  }
  
  public ArrayList getTriceratops(){
    return triceratops;
  }
  
  public void setTriceratops(ArrayList nuevoTriceratops){
    this.triceratops = nuevoTriceratops;
  }
  
  public int getTiempoRecargaT(){
    return tiempoRecargaT;
  }
  
  public void setTiempoRecargaT(int nuevoTiempoRecargaT){
    this.tiempoRecargaT = nuevoTiempoRecargaT;
  }
  
  public int getContadorT(){
    return contadorT;
  }
  
  public void setContadorT(int nuevoContadorT){
    this.contadorT = nuevoContadorT;
  }
  
  public ArrayList getMatriarca(){
    return matriarca;
  }
  
  public void setMatriarca(ArrayList nuevaMatriarca){
    this.matriarca = nuevaMatriarca;
  }
  
  public int getTiempoRecargaM(){
    return tiempoRecargaM;
  }
  
  public void setTiempoRecargaM(int nuevoTiempoRecargaM){
    this.tiempoRecargaM = nuevoTiempoRecargaM;
  }
  
  public int getContadorM(){
    return contadorT;
  }
  
  public void setContadorM(int nuevoContadorM){
    this.contadorM = nuevoContadorM;
  }
  
  public boolean getMatriarcaGenerada(){
    return matriarcaGenerada;
  }
  
  public void setMatriarcaGenerada(boolean nuevaMatriarcaGenerada){
    this.matriarcaGenerada = nuevaMatriarcaGenerada;
  }
  
}

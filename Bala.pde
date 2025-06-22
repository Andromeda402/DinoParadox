class Bala extends GameObject {

  PVector posDestino;
  PVector direccionProyectil;
  float velocidad;
  int danioBala;
  boolean teclaEspacio;
  Collider colliderBala;
  
  float distMouseX;
  float distMouseY;
  float magnitud;;

  public Bala(PVector posicion, PVector tamanio, PVector posDestino) {
    super(posicion, tamanio);
    this.posDestino = posDestino;


    this.distMouseX = posDestino.x - posicion.x;
    this.distMouseY = posDestino.y - posicion.y;
    this.magnitud = sqrt(distMouseX * distMouseX + distMouseY * distMouseY);

    this.direccionProyectil = new PVector(distMouseX /magnitud, distMouseY /magnitud);


    this.velocidad = 4;
    this.danioBala = 1;
    this.teclaEspacio = false;
    this.colliderBala = new Collider(this.posicion, this.tamanio);
  }

  public void dibujar() {

    fill(#E1ED67);
    ellipse(posicion.x, posicion.y, tamanio.x, tamanio.y);
  }

  public void mover() {
    
    this.posicion.x += direccionProyectil.x * velocidad;
    this.posicion.y += direccionProyectil.y * velocidad;
  }
  

  public void impactar(Dinosaurio dinosaurio) {
    Collider colliderDinosaurio = new Collider(dinosaurio.posicion, dinosaurio.tamanio);

    if (colliderDinosaurio.hayColision(colliderBala)) {
      dinosaurio.vida -= this.danioBala;
    }
  }




  public void keyPressed() {
    if (keyCode == ' ') {
      teclaEspacio = true;
    }
  }

  public void keyReleased() {
    if (keyCode == ' ') {
      teclaEspacio = false;
    }
  }
}

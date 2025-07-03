abstract class Pantalla {
  
  // ======== ATRIBUTOS ========
  
  protected PImage fondo;
  
  // ======== CONSTRUCTOR ========

  public Pantalla(PImage fondo) {
    this.fondo = fondo;
  }

  // ======== METODOS ========
  
  public void dibujarFondo() {
    if (fondo != null) {
      image(fondo, 0, 0, width, height);
    } else {
      println("⚠️ Error: fondo es null en Pantalla");
      background(0); // Fondo negro de emergencia
    }
  }

  public abstract void dibujar();
  public abstract void mousePressed(float mx, float my);
  
  // ======== GETTERS & SETTERS ========
  
  public PImage getFondo(){
    return fondo;
  }
  
  public void setFondo(PImage nuevoFondo){
    this.fondo = nuevoFondo;
  }
  
}

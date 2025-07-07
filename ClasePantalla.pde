abstract class Pantalla {

  // ======== ATRIBUTOS ========

  protected PImage fondo;

  // ======== CONSTRUCTOR ========

  public Pantalla(PImage fondo) {
    this.fondo = fondo;
  }

  // ======== METODOS ========

  //dibuja el fondo para las pantallas, en caso de no haber ninguno
  //se mostrara un mensaje en consola
  public void dibujarFondo() {
    if (fondo != null) {
      image(fondo, 0, 0, width, height);
    } else {
      println("⚠️ Error: fondo es null en Pantalla");
      background(0); // Fondo negro de emergencia
    }
  }

  //cualquier clase que herede de la clase abstracta pantalla
  //esta obligada a implementar los metodos abstractos
  public abstract void dibujar();
  public abstract void mousePressed(float mx, float my);

  // ======== GETTERS & SETTERS ========

  public PImage getFondo() {
    return fondo;
  }

  public void setFondo(PImage nuevoFondo) {
    this.fondo = nuevoFondo;
  }
}

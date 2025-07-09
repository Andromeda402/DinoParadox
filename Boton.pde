class Boton {
  
  // ======== ATRIBUTOS ========
  
  private String etiqueta;
  private float x, y, w, h;
  
  // ======== CONSTRUCTOR ========

  Boton(String etiqueta, float x, float y, float w, float h) {
    this.etiqueta = etiqueta;
    this.x = x;
    this.y = y;
    this.w = w;
    this.h = h;
  }
  
  // ======== METODOS ========
  
  //si el mouse esta sobre el boton pinta la figura de un color
  //y sino lo esta entonces se pintara de otro color

  public void dibujar() {
    if (estaSobre(mouseX, mouseY)) {
      fill(100, 200, 255);
    } else {
      fill(180);
    }
    rect(x, y, w, h, 10);
    fill(0);
    textAlign(CENTER, CENTER);
    textSize(20);
    text(etiqueta, x + w/2, y + h/2);
  }
  
  // ======== GETTERS & SETTERS ========

  public boolean estaSobre(float mx, float my) {
    return mx > x && mx < x + w && my > y && my < y + h;
  }

  public String getEtiqueta() {
    return etiqueta;
  }

  public void setEtiqueta(String nuevaEtiqueta) {
    this.etiqueta = nuevaEtiqueta;
  }
  
}

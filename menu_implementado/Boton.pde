// --- BOTÓN ---
class Boton {
  private String etiqueta;
  private float x, y, w, h;

  Boton(String etiqueta, float x, float y, float w, float h) {
    this.etiqueta = etiqueta;
    this.x = x;
    this.y = y;
    this.w = w;
    this.h = h;
  }

  void dibujar() {
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

  boolean estaSobre(float mx, float my) {
    return mx > x && mx < x + w && my > y && my < y + h;
  }

  String getEtiqueta() {
    return etiqueta;
  }

  void setEtiqueta(String nuevaEtiqueta) {
    this.etiqueta = nuevaEtiqueta;
  }
}

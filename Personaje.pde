class Personaje extends GameObject {

  float velocidad;
  int vida;
  color colorPersonaje;
  boolean izquierda, derecha, arriba, abajo;


  public Personaje(PVector posicion, PVector tamanio, float velocidad, int vida, color colorPersonaje) {
    super(posicion, tamanio);
    this.velocidad = velocidad;
    this.vida = vida;
    this.colorPersonaje = colorPersonaje;
    this.arriba = false;
    this.abajo = false;
    this.izquierda = false;
    this.derecha = false;
  }

  public void dibujar() {

    fill(#1C3E98);
    noStroke();
    ellipse(posicion.x, posicion.y, tamanio.x, tamanio.y);
    println(vida);
  }

  public void mover(String direccion) {

    switch(direccion) {

    case "arriba":
      {
        posicion.y -= velocidad;
        break;
      }

    case "abajo":
      {
        posicion.y += velocidad;
        break;
      }

    case "izquierda":
      {
        posicion.x -= velocidad;
        break;
      }

    case "derecha":
      {
        posicion.x += velocidad;
        break;
      }
    }
  }

  public void keyPressed() {
    if (keyCode == UP) {
      arriba = true;
    }

    if (keyCode == DOWN) {
      abajo = true;
    }

    if (keyCode == RIGHT) {
      derecha = true;
    }

    if (keyCode == LEFT) {
      izquierda = true;
    }
  }

  public void keyReleased() {

    if (keyCode == UP) {
      arriba = false;
    }

    if (keyCode == DOWN) {
      abajo = false;
    }

    if (keyCode == RIGHT) {
      derecha = false;
    }

    if (keyCode == LEFT) {
      izquierda = false;
    }
  }
}

class Personaje extends GameObject {

  float velocidad;
  int vida;
  color colorPersonaje;
  boolean izquierda, derecha, arriba, abajo;
  ArrayList<Bala> bala;

  public Personaje(PVector posicion, PVector tamanio, float velocidad, int vida, color colorPersonaje) {
    super(posicion, tamanio);
    this.velocidad = velocidad;
    this.vida = vida;
    this.colorPersonaje = colorPersonaje;
    this.arriba = false;
    this.abajo = false;
    this.izquierda = false;
    this.derecha = false;
    this.bala = new ArrayList<Bala>();
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
    if (key == 'w' || key == 'W') {
      arriba = true;
    }

    if (key == 's' || key == 'S') {
      abajo = true;
    }

    if (key == 'd' || key == 'D') {
      derecha = true;
    }

    if (key== 'a' || key == 'A') {
      izquierda = true;
    }
  }

  public void keyReleased() {

    if (key == 'w' || key == 'W') {
      arriba = false;
    }

    if (key == 's' || key == 'S') {
      abajo = false;
    }

    if (key == 'd' || key == 'D') {
      derecha = false;
    }

    if (key== 'a' || key == 'A') {
      izquierda = false;
    }
  }

  public void disparar() {
    bala.add(new Bala(
      new PVector(this.posicion.x, this.posicion.y),
      new PVector(10, 10),
      new PVector(mouseX, mouseY)
      ));
  }
}

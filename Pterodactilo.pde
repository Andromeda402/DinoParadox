class Pterodactilo extends Dinosaurio {

  boolean cambioSentido;
  int tiempoSoltarFruta;
  ArrayList<Fruta> fruta;

  public Pterodactilo(PVector posicion, PVector tamanio, int vida, float velocidad, int danio) {
    super(posicion, tamanio, vida, velocidad, danio);
    this.fruta = new ArrayList<Fruta>();
  }

  public void dibujar() {
    fill(#FFA500);
    ellipse(posicion.x, posicion.y, tamanio.x, tamanio.y);

    for (Fruta f : fruta) {
      f.dibujar();
    }
  }

  public void mover(Personaje personaje) {
    if (cambioSentido == true) {
      posicion.x += velocidad;
      if (posicion.x + tamanio.x / 2 >= width) {
        cambioSentido = false;
      }
    } else {
      posicion.x -= velocidad;
      if (posicion.x - tamanio.x / 2 <= 0) {
        cambioSentido = true;
      }
    }

    tiempoSoltarFruta +=1;

    if (tiempoSoltarFruta >= 420) { // cada 4 segundos
      soltarFruta();
      tiempoSoltarFruta = 0;
    }

    for (int i = fruta.size() - 1; i >= 0; i--) {
      Fruta f = fruta.get(i);
      f.mover();
      f.explotar(personaje);
      if (f.detonar) {
        fruta.remove(i);
        println("fruta eliminada");
      }
    }
  }

  public void soltarFruta() {
    fruta.add(new Fruta(new PVector(posicion.x, posicion.y), new PVector(15, 15)));
  }




  public boolean conVida() {
    return vida > 0;
  }
}

// --- VARIABLES GLOBALES Y OBJETOS ---
int estadoJuego = MaquinaEstadosJuego.MENU;

PantallaMenu menu;
PantallaIntro intro;
PantallaJuego juego;

PImage fondoMenu;
PImage fondoJuego;
PImage imagenCientifico;

void setup() {
  size(600, 400);
  textFont(createFont("Arial", 20));

  // Cargar imágenes
  fondoMenu = loadImage("fondo_menu.jpg");
  fondoJuego = loadImage("fondo_juego.jpg");
  imagenCientifico = loadImage("cientifico.png");

  // Redimensionar si es necesario
  imagenCientifico.resize(100, 0);

  // Crear pantallas
  menu = new PantallaMenu(fondoMenu, imagenCientifico);
  intro = new PantallaIntro(fondoMenu, imagenCientifico);
  juego = new PantallaJuego(fondoJuego);
}

void draw() {
  switch (estadoJuego) {
    case MaquinaEstadosJuego.MENU:
      menu.dibujar();
      break;
    case MaquinaEstadosJuego.INTRO:
      intro.dibujar();
      break;
    case MaquinaEstadosJuego.JUGANDO:
      juego.dibujar();
      break;
    case MaquinaEstadosJuego.VICTORIA:
      // Aquí puedes crear una pantalla de victoria
      background(0, 200, 0);
      fill(255);
      textAlign(CENTER, CENTER);
      textSize(32);
      text("¡Victoria!", width/2, height/2);
      break;
    case MaquinaEstadosJuego.DERROTA:
      background(200, 0, 0);
      fill(255);
      textAlign(CENTER, CENTER);
      textSize(32);
      text("Derrota...", width/2, height/2);
      break;
  }
}

void mousePressed() {
  switch (estadoJuego) {
    case MaquinaEstadosJuego.MENU:
      menu.mousePressed(mouseX, mouseY);
      break;
    case MaquinaEstadosJuego.INTRO:
      intro.mousePressed(mouseX, mouseY);
      break;
    case MaquinaEstadosJuego.JUGANDO:
      juego.mousePressed(mouseX, mouseY);
      break;
    case MaquinaEstadosJuego.VICTORIA:
    case MaquinaEstadosJuego.DERROTA:
      estadoJuego = MaquinaEstadosJuego.MENU;  // Reiniciar o volver al menú
      break;
  }
}

// --- CLASE DE ESTADOS ---
class MaquinaEstadosJuego {
  public static final int MENU = 0;
  public static final int INTRO = 1;
  public static final int JUGANDO = 2;
  public static final int VICTORIA = 3;
  public static final int DERROTA = 4;
}

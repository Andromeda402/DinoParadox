// Variables globales
PImage spritePersonaje;
PantallaMenu pantallaMenu;
PantallaIntro pantallaIntro;
Nivel01 nivel01;
Nivel02 nivel02;

int estadoJuego;
PImage fondoMenu;
PImage fondoIntro;
PImage cientifico;

int tiempoAnterior;
int tiempoActual;

//tiempo transcurrido entre un frame y otro frame (segundos)
float deltaTime;

PImage fondoNivel1;
PImage fondoNivel2;
int nivelActual;

PImage imgPantallaDerrota;
PImage imgPantallaVictoria; 

//musica
import ddf.minim.*;

Minim minim;
AudioPlayer musicaMenu;
AudioPlayer musicaNivel1;
AudioPlayer musicaNivel2;
AudioPlayer musicaVictoria;
AudioPlayer musicaDerrota;

boolean musicaVictoriaReproducida = false;
boolean musicaDerrotaReproducida = false;

public void setup() {
  size(800, 600);

  fondoMenu = loadImage("fondo_menu.jpg");
  fondoIntro = loadImage("fondo_intro.jpg");
  cientifico = loadImage("cientifico2.jpeg");
  cientifico.resize(100, 0);
  spritePersonaje = loadImage("Personaje.png");//esto agregue
  
  //fondo nivel
  fondoNivel1 = loadImage("fondoNivel1.png");
  fondoNivel2 = loadImage("fondoNivel2.png");
  nivelActual = 1;

  //esto agregue
  if (fondoMenu == null) println("❌ fondo_menu.png no se cargó.");
  if (fondoIntro == null) println("❌ fondo_intro.png no se cargó.");
  if (cientifico == null) println("❌ cientifico.png no se cargó.");

  pantallaMenu = new PantallaMenu(fondoMenu, cientifico);
  pantallaIntro = new PantallaIntro(fondoIntro, cientifico);

  nivel01 = new Nivel01(spritePersonaje);
  nivel02 = new Nivel02(spritePersonaje);

  estadoJuego = MaquinaEstadosJuego.MENU;
  
  tiempoAnterior = millis();
  
  imgPantallaDerrota = loadImage("fondo_derrota.jpg");
  imgPantallaVictoria = loadImage("fondo_victoria.jpg");
  
  //musica
  
  minim = new Minim(this);
  // Cargar música desde la carpeta data
  musicaMenu = minim.loadFile("musica_menu.mp3");
  musicaNivel1 = minim.loadFile("musica_nivel1.mp3");
  musicaNivel2 = minim.loadFile("musica_nivel2.mp3");
  musicaVictoria = minim.loadFile("victoria.mp3");
  musicaDerrota = minim.loadFile("derrota.mp3");


}



public void draw() {
  
  tiempoActual = millis();
  deltaTime = (tiempoActual - tiempoAnterior) / 1000.0; //segundos
  tiempoAnterior = tiempoActual;
  background(0);
  
  switch(estadoJuego) {
  
  case MaquinaEstadosJuego.MENU:
    musicaVictoriaReproducida = false;
    musicaDerrotaReproducida = false;
    reproducirMusica(musicaMenu);

    fill(#132B50);
    textSize(44);
    textAlign(CENTER);
    text("Presiona cualquier tecla", width/2, height/2);

    textSize(20);
    text("Antes maximizar Processing para ver los mensajes en consola", width/2, height-200);

    //menu();
    pantallaMenu.dibujar(); // ← Debes tener esta instancia creada
    break;

  case MaquinaEstadosJuego.INTRO:
    pantallaIntro.dibujar(); // ← También debes tener esta instancia
    break;

  case MaquinaEstadosJuego.JUGANDO_NIVEL01:
    reproducirMusica(musicaNivel1);
    jugando01(); //cambiar a jugando02 para el siguiente nivel
    break;

  case MaquinaEstadosJuego.JUGANDO_NIVEL02:
    reproducirMusica(musicaNivel2);
    jugando02(); //cambiar a jugando02 para el siguiente nivel
    break;

  case MaquinaEstadosJuego.VICTORIA:
  if (musicaMenu.isPlaying()) musicaMenu.pause();
  if (musicaNivel1.isPlaying()) musicaNivel1.pause();
  if (musicaNivel2.isPlaying()) musicaNivel2.pause();

  if (musicaVictoria != null && !musicaVictoriaReproducida) {
    musicaVictoria.rewind();
    musicaVictoria.play();
    musicaVictoriaReproducida = true;
  }
  
  imageMode(CORNER);
  if (imgPantallaDerrota != null) {
    image(imgPantallaVictoria, 0, 0, width, height);
  } else {
    // Backup por si la imagen no carga
    background(#132B50);
    fill(255);
    textSize(44);
    textAlign(CENTER);
    text("GANADOR", width/2, height/2);
  }
  break;

  case MaquinaEstadosJuego.DERROTA:
  if (musicaMenu.isPlaying()) musicaMenu.pause();
  if (musicaNivel1.isPlaying()) musicaNivel1.pause();
  if (musicaNivel2.isPlaying()) musicaNivel2.pause();

  if (musicaDerrota != null && !musicaDerrotaReproducida) {
    musicaDerrota.rewind();
    musicaDerrota.play();
    musicaDerrotaReproducida = true;
  }
  
  imageMode(CORNER);
  if (imgPantallaDerrota != null) {
    image(imgPantallaDerrota, 0, 0, width, height);
  } else {
    // Backup por si la imagen no carga
    background(#132B50);
    fill(255);
    textSize(44);
    textAlign(CENTER);
    text("FUERA DE COMBATE", width/2, height/2);
  }
  break;
  
  //musica
  default:
    detenerTodas();
    break;

  }
}

public void jugando01() {
  dibujarFondo();
  nivel01.iniciar();
}

public void jugando02() {
  dibujarFondo();
  nivel02.iniciar();
}


public void dibujarFondo() {
  imageMode(CORNER);
  
  if (nivelActual == 1) {
    image(fondoNivel1, 0, 0, width, height);
  } else if (nivelActual == 2) {
    image(fondoNivel2, 0, 0, width, height);
  } else {
    background(0); // fondo negro si ocurre un error
  }
}

public void pasarNivel2(){
  nivelActual = 2;
}



public void keyPressed() {

  if (estadoJuego == 0) {
    estadoJuego = 3;
  }

  nivel01.keyPressed();
  nivel02.keyPressed();
}


public void keyReleased() {

  nivel01.keyReleased();
  nivel02.keyReleased();
}

//puede ser
void mousePressed() {
  if (estadoJuego == MaquinaEstadosJuego.MENU) {
    pantallaMenu.mousePressed(mouseX, mouseY);
  } else if (estadoJuego == MaquinaEstadosJuego.INTRO) {
    pantallaIntro.mousePressed(mouseX, mouseY);
  }
}  
 void reproducirMusica(AudioPlayer musica) {
  if (!musica.isPlaying()) {
    if(musica != musicaVictoria && musica!= musicaDerrota){
    detenerTodas();
    }
    musica.rewind();
    musica.loop(); // o .play() si no querés que se repita
  }
}

void detenerTodas() {
  if (musicaMenu.isPlaying()) musicaMenu.pause();
  if (musicaNivel1.isPlaying()) musicaNivel1.pause();
  if (musicaNivel2.isPlaying()) musicaNivel2.pause();
  if (musicaVictoria != null && musicaVictoria.isPlaying()) musicaVictoria.pause();
  if (musicaDerrota != null && musicaDerrota.isPlaying()) musicaDerrota.pause();
}

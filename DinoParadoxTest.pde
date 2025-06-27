

/*
Nivel01 nivel01;
 Nivel02 nivel02;
 int estadoJuego;
 PImage spritePersonaje;
 pantallaMenu = new PantallaMenu(fondoMenu, cientifico);
 pantallaIntro = new PantallaIntro(fondoIntro, cientifico);
 
 
 
 public void setup() {
 size(800, 600);
 //esto creo q es
 estadoJuego = MaquinaEstadosJuego.MENU;
 
 spritePersonaje = loadImage("Personaje.png");
 
 println("Elimina 10 dinosaurios");
 nivel01 = new Nivel01();
 nivel02 = new Nivel02();
 estadoJuego = 0;
 
 }*/
/*
PantallaMenu pantallaMenu;
 PantallaIntro pantallaIntro;
 PImage fondoMenu, fondoIntro, cientifico;
 
 public void setup() {
 size(800, 600);
 
 // Cargar imágenes necesarias
 fondoMenu = loadImage("fondo_menu.png");
 fondoIntro = loadImage("fondo_intro.png");
 cientifico = loadImage("cientifico.png");
 
 pantallaMenu = new PantallaMenu(fondoMenu, cientifico);
 pantallaIntro = new PantallaIntro(fondoIntro, cientifico);
 
 nivel01 = new Nivel01();
 nivel02 = new Nivel02();
 
 estadoJuego = MaquinaEstadosJuego.MENU; // Asegura que el juego empiece por el menú
 }
 */
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



public void setup() {
  size(800, 600);

  fondoMenu = loadImage("fondo_menu.jpg");
  fondoIntro = loadImage("fondo_intro.jpg");
  cientifico = loadImage("cientifico.png");
  cientifico.resize(100, 0);
  spritePersonaje = loadImage("Personaje.png");//esto agregue

  //esto agregue
  if (fondoMenu == null) println("❌ fondo_menu.png no se cargó.");
  if (fondoIntro == null) println("❌ fondo_intro.png no se cargó.");
  if (cientifico == null) println("❌ cientifico.png no se cargó.");

  pantallaMenu = new PantallaMenu(fondoMenu, cientifico);
  pantallaIntro = new PantallaIntro(fondoIntro, cientifico);

  nivel01 = new Nivel01(spritePersonaje);
  nivel02 = new Nivel02(spritePersonaje);

  estadoJuego = MaquinaEstadosJuego.MENU;
}



public void draw() {
  background(0);



  switch(estadoJuego) {
  case MaquinaEstadosJuego.MENU:

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
    jugando01(); //cambiar a jugando02 para el siguiente nivel
    break;

  case MaquinaEstadosJuego.JUGANDO_NIVEL02:

    jugando02(); //cambiar a jugando02 para el siguiente nivel
    break;

  case MaquinaEstadosJuego.VICTORIA:

    fill(#132B50);
    textSize(44);
    textAlign(CENTER);
    text("GANASTE EL JUEGO", width/2, height/2);

    //victoria();
    break;

  case MaquinaEstadosJuego.DERROTA:
    //derrota();
    break;
  }
}

public void jugando01() {
  nivel01.iniciar();
}

public void jugando02() {
  nivel02.iniciar();
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

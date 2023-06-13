import processing.sound.*;

float deltaTime;
boolean debugMode = false;
color[] cores = {#BF3B0F, #F5A716, #E5DE07, #ABF214, #109EE3, #C102ED, #ED0278};
float[][] gridPontos;
PFont minhaFonte;

String mensagemFimDeJogo;

boolean comecou;
boolean acabou;

int tempo;
int pontos;
int vidas=8;
int moedas;
int peninhas;

int itens = 25;
int colunas = 5;
int linhas = itens/colunas;
float espacoX;
float espacoY;

float me = 35;
float md = 35;
float mc = 110;
float mb = 45;

boolean invencivel = false;
DebugMode meuDebug;

CenaIntro cenaIntro;
CenaGame cenaGame;
CenaCreditos cenaCreditos;

ArrayList<Scene> cenas;

SoundFile somPeninha;
SoundFile somClique;

void settings () {
  size(720, 486);
}

int contaFase = 0;

void setup() {
  frameRate(60);
  meuDebug = new DebugMode();

  cenas = new ArrayList<Scene>();
  cenaIntro = new CenaIntro();
  cenaGame = new CenaGame();
  cenaCreditos = new CenaCreditos(cenaIntro);

  cenaIntro.ativo=true;

  cenas.add(cenaIntro);
  cenas.add(cenaGame);
  cenas.add(cenaCreditos);
  somPeninha = new SoundFile(this, "PENINHA/som_peninha.mp3");
  somClique = new SoundFile(this, "som_clique.mp3");
}

void draw() {
  clear();
  deltaTime = 30/frameRate;

  if (debugMode) {
    meuDebug.display();
  }

  for (Scene c : cenas) {
    if (c.ativo) {
      c.update();
      c.display();
    }
  }
}

void mousePressed() {
  if (cenas.get(contaFase) == cenaIntro) {
    if (mouseX >= cenaIntro.buttonX && mouseX <= cenaIntro.buttonX + cenaIntro.buttonWidth &&
        mouseY >= cenaIntro.buttonY && mouseY <= cenaIntro.buttonY + cenaIntro.buttonHeight) {
      cenaGame.setDificuldade(0);
      cenas.get(contaFase).ativo = false;
      contaFase = cenas.indexOf(cenaGame);
      cenas.get(contaFase).ativo = true;
    } else if (mouseX >= cenaIntro.buttonX && mouseX <= cenaIntro.buttonX + cenaIntro.buttonWidth &&
               mouseY >= cenaIntro.buttonY + cenaIntro.buttonHeight + cenaIntro.buttonSpacing && mouseY <= cenaIntro.buttonY + 2 * cenaIntro.buttonHeight + cenaIntro.buttonSpacing) {
      cenaGame.setDificuldade(1);
      cenas.get(contaFase).ativo = false;
      contaFase = cenas.indexOf(cenaGame);
      cenas.get(contaFase).ativo = true;
    } else if (mouseX >= cenaIntro.buttonX && mouseX <= cenaIntro.buttonX + cenaIntro.buttonWidth &&
               mouseY >= cenaIntro.buttonY + 2 * cenaIntro.buttonHeight + 2 * cenaIntro.buttonSpacing && mouseY <= cenaIntro.buttonY + 3 * cenaIntro.buttonHeight + 2 * cenaIntro.buttonSpacing) {
      cenaGame.setDificuldade(2);
      cenas.get(contaFase).ativo = false;
      contaFase = cenas.indexOf(cenaGame);
      cenas.get(contaFase).ativo = true;
    }
    else if (mouseX >= cenaIntro.buttonX && mouseX <= cenaIntro.buttonX + cenaIntro.buttonWidth &&
               mouseY >= cenaIntro.buttonY + 3 * cenaIntro.buttonHeight + 3 * cenaIntro.buttonSpacing && mouseY <= cenaIntro.buttonY + 4 * cenaIntro.buttonHeight + 3 * cenaIntro.buttonSpacing) {
      cenas.get(contaFase).ativo = false;
      contaFase = cenas.indexOf(cenaCreditos);
      cenas.get(contaFase).ativo = true;
      mousePressed = false;
    }
  }
  
  somClique.play();
}

void keyPressed() {
  if (!acabou) {
    if (keyCode==32) {
      if (peninhas>0) {
        peninhas--;
        somPeninha.play();
        jogador.atirou();
      }
    }

    if ((keyCode==49)||(key=='1')) {
      debugMode = !debugMode;
    }
    
    jogador.apertouKey();
  }
}

void keyReleased() { 
  jogador.soltouKey();
}

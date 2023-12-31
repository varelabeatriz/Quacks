class Hud {
  int cont = vidas+1;
  ArrayList<PImage> imagensVidas;

  Hud() {
    imagensVidas = new ArrayList<PImage>();
    for (int i=1; i<=cont; i++) {
      PImage img = loadImage("HUD/HUD"+i+".png");
      imagensVidas.add(img);
    }

    minhaFonte = createFont("Asterix.ttf", 21);
  }

  void display() {
    image(imagensVidas.get(vidas), 15, 15, 80, 80);

    textSize(16);
    fill(255); 
    textFont(minhaFonte);
    textAlign(LEFT);
    text("Tempo: " + tempo, 120, 50, 200, 50);
    text("Pontos: " + pontos, 120, 75, 200, 50);
    text("Peninhas: " + peninhas, 550, 50, 200, 50);
    text("Moedas: " + moedas, 550, 75, 200, 50);
  }

  void apanhou() {
    if (!acabou) {
      if (vidas>0) {
        vidas--;
      } else {
        mensagemFimDeJogo = "Perdeu o Jogo!";
        acabou=true;
      }
    }
  }
  
  void update() {
  }

  void pegouMoeda() {
    moedas++;
  }
  
  void pegouPeninha() {
    peninhas++;
  }
}

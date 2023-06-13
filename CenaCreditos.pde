class CenaCreditos extends Scene {
  PFont fonte;
  String textoCreditos;
  PFont fonteBotaoVoltar;
  float buttonWidth;
  float buttonHeight;
  float buttonX;
  float buttonY;
  float buttonSpacing;
  Scene cenaAtual;

  CenaCreditos(Scene cenaAtual) {
    fonte = createFont("Arial", 12);
    textoCreditos = "Em um mundo encantado, existem diversas criaturas adoráveis e coloridas.Entre elas, dois personagens se destacam: Fofura,\num pequeno e carismático ser,e Lingo-Lingo, um herói valente e destemido. No entanto, Fofura está em perigo\ne cabe a Lingo-Lingo salvá-lo dos temíveis Lesmo.\n\nOs Lesmo são criaturas malvadas que desejam capturar Fofura e usá-lo para fins nefastos.Eles espalharam suas \ntropas por todo o reino, tornando a missão de Lingo-Lingo ainda mais desafiadora. Mas ele não desistirá facilmente!\n\nLingo-Lingo precisa coletar moedas e peninhas. As moedas são essenciais para adquirir novas habilidades\ne melhorar o equipamento de Lingo-Lingo, enquanto as peninhas são utilizadas para criar flechas poderosas.\n\nEssa é a história do mini RPG em que Lingo-Lingo deve enfrentar os Lesmo, coletar moedas e peninhas,\ntransformadas em flechas para derrotar os inimigos e salvar Fofura. Lembre-se o tempo corre contra você\nUma jornada repleta de desafios, emoções e amizade, em um mundo mágico que encanta jogadores de todas as idades.\n\nPara se locomover com Lingo-Lingo basta utilizar as setinhas do mouse ou WSAD e,\npara atirar suas flechas, basta clicar com o espaço do mouse.\nVocê pode escolher diferentes níveis de dificuldade onde cada nível os Lesmo andam em diferentes velocidades.\n\n Gabriel Souza Pereira - 001201901351 \n Guilherme Brusarosco Franco - 001202006795 \n Luan Sallowicz Padovan - 001202000219 \n Matheus Gonzaga de Moraes Barros - 001202004977 \n Rafael Elias Campos da Silva – 001201905572";
    
    buttonWidth = 200;
    buttonHeight = 60;
    buttonX = width / 2 - buttonWidth / 2;
    buttonY = height / 2 - buttonHeight;
    buttonSpacing = 20;
    this.cenaAtual = cenaAtual;
  }
  
  @Override
  void update() {
    if (mousePressed && mouseX >= buttonX && mouseX <= buttonX + buttonWidth &&
        mouseY >= buttonY + 3 * buttonHeight + 3 * buttonSpacing && mouseY <= buttonY + 4 * buttonHeight + 3 * buttonSpacing) {
      cenas.get(contaFase).ativo = false;
      contaFase = cenas.indexOf(cenaIntro);
      cenas.get(contaFase).ativo = true;
    }
  }

  @Override
  void display() {
    background(0);
    
    textAlign(LEFT, TOP);
    fill(255);
    textFont(fonte);
    text(textoCreditos, 10, 10);
    
    if (mouseX >= buttonX && mouseX <= buttonX + buttonWidth &&
        mouseY >= buttonY + 3 * buttonHeight + 3 * buttonSpacing && mouseY <= buttonY + 4 * buttonHeight + 3 * buttonSpacing) {
      fill(200);
    }
    
    rect(buttonX, buttonY + 3 * buttonHeight + 3 * buttonSpacing, buttonWidth, buttonHeight);
    fill(10);
    textSize(24);
    textAlign(CENTER, TOP);
    text("VOLTAR", buttonX + buttonWidth / 2, buttonY + 3 * buttonHeight + 3 * buttonSpacing + buttonHeight / 3);
  }
}

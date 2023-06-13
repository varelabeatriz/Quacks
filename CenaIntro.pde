// -*- coding: utf-8 -*-

import processing.core.PImage;

class CenaIntro extends Scene {
  PImage img_felpudo;
  float fl;
  float fa;
  
  float buttonWidth;
  float buttonHeight;
  float buttonX;
  float buttonY;
  float buttonSpacing;

  CenaIntro() {
    super();

    img_felpudo = loadImage("felpudo_google_glass.png");
    fl = img_felpudo.width * 0.9;
    fa = img_felpudo.height * 0.9;

    buttonWidth = 200;
    buttonHeight = 60;
    buttonX = width / 2 - buttonWidth / 2;
    buttonY = height / 2 - buttonHeight;
    buttonSpacing = 20;
  }

  @Override
  void display() {
    //minhaFonte = createFont("Arial", 24);
    fill(#ab9758);
    background(#FFA500);
    fill(50);
    noStroke();
    fill(30);
    rect(0, 40, width, 80);
    textAlign(CENTER, TOP);
    textFont(minhaFonte);
    textSize(50);
    fill(#FF0000);
    text("Quacks", 0, 60, width, 160);
    pushMatrix();
    scale(-1, 10.0);
    image(img_felpudo, -width / 2 - fl / 2, height - fa - 5, fl, fa);
    popMatrix();

    textAlign(CENTER, CENTER);
    textSize(24);
    stroke(0);
    
    // Botão "Fácil"
    fill(255);
    if (mouseX >= buttonX && mouseX <= buttonX + buttonWidth &&
        mouseY >= buttonY && mouseY <= buttonY + buttonHeight) {
      fill(200);
    }
    rect(buttonX, buttonY, buttonWidth, buttonHeight);
    fill(10);
    textSize(24);
    text("FÁCIL", buttonX, buttonY, buttonWidth, buttonHeight);

    // Botão "Normal"
    fill(255);
    if (mouseX >= buttonX && mouseX <= buttonX + buttonWidth &&
        mouseY >= buttonY + buttonHeight + buttonSpacing && mouseY <= buttonY + 2 * buttonHeight + buttonSpacing) {
      fill(200);
    }
    rect(buttonX, buttonY + buttonHeight + buttonSpacing, buttonWidth, buttonHeight);
    fill(10);
    textSize(24);
    text("NORMAL", buttonX, buttonY + buttonHeight + buttonSpacing, buttonWidth, buttonHeight);

    // Botão "Difícil"
    fill(255);
    if (mouseX >= buttonX && mouseX <= buttonX + buttonWidth &&
        mouseY >= buttonY + 2 * buttonHeight + 2 * buttonSpacing && mouseY <= buttonY + 3 * buttonHeight + 2 * buttonSpacing) {
      fill(200);
    }
    rect(buttonX, buttonY + 2 * buttonHeight + 2 * buttonSpacing, buttonWidth, buttonHeight);
    fill(10);
    textSize(24);
    text("DIFÍCIL", buttonX, buttonY + 2 * buttonHeight + 2 * buttonSpacing, buttonWidth, buttonHeight);
    
    fill(255);
    if (mouseX >= buttonX && mouseX <= buttonX + buttonWidth &&
        mouseY >= buttonY + 3 * buttonHeight + 3 * buttonSpacing && mouseY <= buttonY + 4 * buttonHeight + 3 * buttonSpacing) {
      fill(200);
    }
    rect(buttonX, buttonY + 3 * buttonHeight + 3 * buttonSpacing, buttonWidth, buttonHeight);
    fill(10);
    textSize(24);
    text("CRÉDITOS", buttonX, buttonY + 3 * buttonHeight + 3 * buttonSpacing, buttonWidth, buttonHeight);
  }
}

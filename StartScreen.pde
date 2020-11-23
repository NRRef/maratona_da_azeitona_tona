public class StartScreen{
  int btn1StartX = 300;
  int btn1StartY = 250;
  int btn2StartX = w-450;
  int btn2StartY = 250;
  boolean rect1Over = false;
  boolean rect2Over = false;
  
  void draw(){
    image(startBack, 0, 0);
    update();
    if (rect1Over) {
      fill(50);
    } else {
      fill(0);
    }
    rect(btn1StartX,btn1StartY,150,30);
    fill(255);
    textFont(font, 14);
    text("Iniciar Jogo",btn1StartX+30,btn1StartY+20);
    
    
    if (rect2Over) {
      fill(50);
    } else {
      fill(0);
    }
    rect(btn2StartX,btn2StartY,150,30);
    
    fill(255);
    textFont(font, 14);
    text("Zerar Pontuação",btn2StartX+10,btn2StartY+20);
    
  }
  void update() {
    
    if ( overRect(btn1StartX, btn1StartY, 150, 30) ) {
      
      rect1Over = true;
      rect2Over = false;
    } else if ( overRect(btn2StartX, btn2StartY, 150, 30) ) {
      rect1Over = false;
      rect2Over = true;
    }
    else {
      rect1Over = rect2Over = false;
    }
  }
  
  void btnClick(int btn){
    if(btn == 1){
      actualScreen = "GAME";
    }else if(btn == 2){
      game.resetScore();
    }
  }

  boolean overRect(int x, int y, int width, int height)  {
  if (mouseX >= x && mouseX <= x+width && 
      mouseY >= y && mouseY <= y+height) {
    return true;
  } else {
    return false;
  }
}
  
}

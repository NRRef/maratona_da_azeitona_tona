public class GameOverScreen{
  int btn1StartX = 300;
  int btn1StartY = 250;
  int btn2StartX = w-450;
  int btn2StartY = 250;
  boolean rect1Over = false;
  boolean rect2Over = false;
  
  void draw(){
    background(255);
    fill(0);
    textFont(font, 80);
    text("GAME OVER",270,150);
    update();
    if (rect1Over) {
      fill(50);
    } else {
      fill(0);
    }
    rect(btn1StartX,btn1StartY,150,30);
    fill(255);
    textFont(font, 14);
    text("Tentar Novamente",btn1StartX+10,btn1StartY+20);
    
    
    if (rect2Over) {
      fill(50);
    } else {
      fill(0);
    }
    rect(btn2StartX,btn2StartY,150,30);
    
    fill(255);
    textFont(font, 14);
    text("Menu Inicial",btn2StartX+20,btn2StartY+20);
    
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
      actualScreen = "START";
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

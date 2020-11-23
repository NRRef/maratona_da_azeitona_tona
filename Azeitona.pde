public class Azeitona{
  
  int pWidth = 60;
  int pHeight = 100;
  boolean jumpBoolUp = true;
  boolean jumpBoolDown = true;
  int timeDelay = 10;
  color c = color(0);
  int x = 50;
  int y = h-pHeight;
  int speed = tonaSpeed;
  int pixSize = 5;
  String state = "WALK";
  boolean oscilateFoot = true;
  int footTime = frame/8;
  int footCounter = footTime;
  
  
  void draw() {
    if(!jumpBoolUp){
      jumpAnimationUp();
    }
    if(!jumpBoolDown){
      jumpAnimationDown();
    }    
    display();
   }
  int counter;
  void jump(){
    if(state != "JUMP"){
      state = "JUMP";
      counter = 5; //Suaviza a queda após o ponto máximo
      if (this.jumpBoolUp && jumpBoolDown){
        this.jumpBoolUp = false;
      }
    }
  }
  void jumpDown(){
    if (!this.jumpBoolUp){
      this.jumpBoolUp = true;
      this.jumpBoolDown = false;
      
    }
    
  }
  
  void jumpAnimationUp() {
      
      if (jumpBoolUp)
      {
        
      }
      else if(y > pHeight*1){
          y = y - speed;
       }
       else if(counter>0){
         counter = counter -1;
       }
       else{
         jumpBoolUp = true;
         jumpBoolDown = false;
       }
     }
     void jumpAnimationDown() {
      //y = y - pHeight*1.6;
      if(y < height - pHeight){
          y = y + speed;
       }
       else{
         jumpBoolDown = true;
         state = "WALK";
       }
     }
  
  
  
  
  void display() {
    int i,j;
    int[][] sprite = new int[12][20];
    if(state == "JUMP"){
      sprite = tonaSprite;
    }else if(state == "WALK"){
      sprite = oscilateFoot? tonaWalk1Sprite : tonaWalk2Sprite;
      oscilateFoot = footCounter==0?!oscilateFoot:oscilateFoot;
      footCounter = footCounter>0?footCounter-1:footTime;
      
      
    }
    
    for(i = 0;i<pWidth/pixSize; i++){
      for(j = 0;j<pHeight/pixSize; j++){
        fill(colorsR[sprite[i][j]],colorsG[sprite[i][j]],colorsB[sprite[i][j]],sprite[i][j]==0?0:255);
        stroke(colorsR[sprite[i][j]],colorsG[sprite[i][j]],colorsB[sprite[i][j]], sprite[i][j]==0?0:255);
        //stroke(0);
        rect(x+i*pixSize,y+j*pixSize,pixSize,pixSize);
      }
    }
   }
}

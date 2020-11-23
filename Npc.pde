public class Npc{
  int pWidth = 60;
  int pHeight = 60;
  int bottomStart = 20;
  int midStart = pWidth+50 ;
  int pixSize = 5;
  boolean toKill = false;
  color c = color(0);
  int x = w-pWidth;
  int y = h-pHeight-(round(random(1))==1?bottomStart:midStart);
  int speed = npcSpeed;
  int type = round(random(3));
  boolean enemy = type<=1?true:false;
  int pontos = 0;
  int highScore = 0;
  
  
  
  void draw() {
    display();
    move();
    colideListener(tona,this);
    //noLoop();
   }
  void move(){
    x = x - speed;
    if(x <= pWidth*-1){
      x = w+pWidth;
      this.toKill = true;
    }
  }
  boolean shouldKill(){
    return this.toKill;
  }
  void colide(){
    if(enemy){
      toKill = true;
      heart.dropHeart();
      game.killNpc();
    }else{
      toKill = true;
      game.killNpc();
      game.increasePoints(type == 2?100:250);
      
    }
    
  }
  void colideListener(Azeitona a,Npc b){
    
    //int aTopLeftX = a.x;
    //int aTopLeftY = a.y;
    int aBottomLeftX = a.x;
    int aBottomLeftY = a.y+a.pHeight;
    int aTopRightX = a.x+a.pWidth;
    int aTopRightY = a.y;
    //int aBottomRightX = a.x+a.pWidth;
    //int aBottomRightY = a.y+a.pHeight;
    
    int bTopLeftX = b.x;
    int bTopLeftY = b.y;
    int bBottomLeftX = b.x;
    int bBottomLeftY = b.y+b.pHeight;
    int bTopRightX = b.x+b.pWidth;
    int bTopRightY = b.y;
    int bBottomRightX = b.x+b.pWidth;
    int bBottomRightY = b.y+b.pHeight;
    
    if(bBottomLeftX < aTopRightX && bBottomLeftY > aTopRightY && bBottomLeftX > aBottomLeftX && bBottomLeftY < aBottomLeftY){
      colide();
    }else if(bTopLeftX < aTopRightX && bTopLeftY > aTopRightY && bTopLeftX > aBottomLeftX && bTopLeftY < aBottomLeftY){
      colide();
    }
    else if(bTopRightX > aBottomLeftX && bTopRightY < aBottomLeftY && bTopRightX < aTopRightX && bTopRightY > aTopRightY){
      colide();
    }
    else if(bBottomRightX > aBottomLeftX && bBottomRightY < aBottomLeftY && bBottomRightX < aTopRightX && bBottomRightY > aTopRightY){
      colide();
    }
  }
  
  
  void display() {
    int i,j,spr=type;
    for(i = 0;i<pWidth/pixSize; i++){
      for(j = 0;j<pHeight/pixSize; j++){
        fill(colorsR[npcSprite[spr][i][j]],colorsG[npcSprite[spr][i][j]],colorsB[npcSprite[spr][i][j]],npcSprite[spr][i][j]==0?0:255);
        stroke(colorsR[npcSprite[spr][i][j]],colorsG[npcSprite[spr][i][j]],colorsB[npcSprite[spr][i][j]],npcSprite[spr][i][j]==0?0:255);
        //stroke(0);
        rect(x+i*pixSize,y+j*pixSize,pixSize,pixSize);
      }
    }
   }
}

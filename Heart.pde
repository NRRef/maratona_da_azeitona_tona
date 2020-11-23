public class Heart{
  int pWidth = 20;
  int pHeight = 20;
  int pixSize = 2;
  float x = 20;
  float x1 = x+pWidth+10;
  float x2 = x1+pWidth+10;
  
  float y = 10;
  
  
  int numberOfHearts = 3;
  void draw() {
    display();
    //noLoop();
   }
   void dropHeart() {
    if (numberOfHearts>0){
      numberOfHearts = numberOfHearts - 1;
      //print(numberOfHearts);
    }else{
      game.gameOver();
    }
   }
   void increaseHeart() {
    numberOfHearts = numberOfHearts <3?numberOfHearts+1:3;
   }
   void resetHearts() {
    numberOfHearts = 3;
   }
  
  void display() {
    int i,j;
    
      int[][] sprite1 = numberOfHearts>=1?heartSprite:heartEmptySprite;
      int[][] sprite2 = numberOfHearts>=2?heartSprite:heartEmptySprite;
      int[][] sprite3 = numberOfHearts>=3?heartSprite:heartEmptySprite;
      
          
      for(i = 0;i<pWidth/pixSize; i++){
        for(j = 0;j<pHeight/pixSize; j++){
          fill(colorsR[sprite1[i][j]],colorsG[sprite1[i][j]],colorsB[sprite1[i][j]],sprite1[i][j]==0?0:255);
          stroke(colorsR[sprite1[i][j]],colorsG[sprite1[i][j]],colorsB[sprite1[i][j]], sprite1[i][j]==0?0:255);
          rect(x+i*pixSize,y+j*pixSize,pixSize,pixSize);
        }
      }
      for(i = 0;i<pWidth/pixSize; i++){
        for(j = 0;j<pHeight/pixSize; j++){
          fill(colorsR[sprite2[i][j]],colorsG[sprite2[i][j]],colorsB[sprite2[i][j]],sprite2[i][j]==0?0:255);
          stroke(colorsR[sprite2[i][j]],colorsG[sprite2[i][j]],colorsB[sprite2[i][j]], sprite2[i][j]==0?0:255);
          rect(x1+i*pixSize,y+j*pixSize,pixSize,pixSize);
        }
      }
      for(i = 0;i<pWidth/pixSize; i++){
        for(j = 0;j<pHeight/pixSize; j++){
          fill(colorsR[sprite3[i][j]],colorsG[sprite3[i][j]],colorsB[sprite3[i][j]],sprite3[i][j]==0?0:255);
          stroke(colorsR[sprite3[i][j]],colorsG[sprite3[i][j]],colorsB[sprite3[i][j]], sprite3[i][j]==0?0:255);
          rect(x2+i*pixSize,y+j*pixSize,pixSize,pixSize);
        }
      }
    
   }
  
}

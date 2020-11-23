public class GameScreen{
  
int demarcacao = 128;

void draw(){
  if(gameOver){
    noLoop();
  }else{
    increasePoints(1);
    loop();
  }
  background(0, 191, 255);
  image(back, bx, by);
  image(back, bx+960*2, by);
  if(bx==-960*2){
    bx = 0;
  }else{
    bx = bx-1;
  }
  
  fill(0);  
  textFont(font, 20);
  text(highScore,470,20);
  fill(0);  
  textFont(font, 20);
  text(pontos,550,20);
  groundDisplay();
  ////Desenho do chão da maratona
  //fill(255);
  //line(demarcacao, h - 34, demarcacao + 15, h);
  
  ////Linha preta que define o chão
  //fill(0);
  //rect(0,h-36,w,2);
  
  ////Primeira raia
  //fill(colorsR[7],colorsG[7],colorsB[7]);
  //rect(0,h-34,w,10);
  
  ////Linha branca que delimita a raia 1 da 2
  //fill(255);
  //rect(0,h-24,w,2);
  
  ////Segunda raia
  //fill(colorsR[7],colorsG[7],colorsB[7]);
  //rect(0,h-22,w,10);
  
  ////Linha branca que delimita a raia 2 da 3
  //fill(255);
  //rect(0,h-12,w,2);
  
  ////Raia 3
  //fill(colorsR[7],colorsG[7],colorsB[7]);
  //rect(0,h-10,w,10);
  
  if(enableCreateNpc){
    if(round(random(1))==0){
      npcs.add(new Npc());
      counterForEnableCreateNpc = timeForEnableCreateNpc;
      enableCreateNpc = !enableCreateNpc;
    }else{
      counterForEnableCreateNpc = timeForEnableCreateRandomNpc;
      enableCreateNpc = !enableCreateNpc;
    }
    
  }else{
    if(counterForEnableCreateNpc == 0){
      enableCreateNpc = !enableCreateNpc;
    }else{
      counterForEnableCreateNpc = counterForEnableCreateNpc - 1;
    }
    
  }
  
  tona.draw();
  
  killNpc();
  for(int i = 0;i<npcs.size();i++){
    npcs.get(i).draw();
  }
  //for(Npc npc : npcs) npc.draw();
  heart.draw();
  
}

void gameOver(){
  gameOver = true;
  actualScreen = "GAMEOVER";
}
void resetGame(){
  gameOver = false;
  pontos = 0;
  heart.resetHearts();
  redraw();
}
void increasePoints(int howMuch){
  pontos = pontos+howMuch;
  if(pontos>highScore){
    highScore = pontos;
    output = createWriter("./saves/save.txt"); 
    output.print(highScore);
    output.flush();
    output.close();
  }
}
void resetScore(){
    highScore = 0;
    output = createWriter("./saves/save.txt"); 
    output.print(highScore);
    output.flush();
    output.close();
}
void killNpc(){
  for (Iterator<Npc> it = npcs.iterator(); it.hasNext(); ) {
      Npc npc = it.next();
      if (npc.shouldKill()) {
          it.remove();
      }
    }
    redraw();
    
}
  int groundX = 0;
  int groundY = h-34;
  int groundPWidth = w;
  int groundPHeight = 34;
  int groundPixSize = 2;
    
  void groundMove(){
    groundX = groundX - npcSpeed;
      if(groundX <= groundPWidth*-1){
        groundX = w+groundPWidth;
      }
  }
  void groundDisplay(){
    int i,j;
    int[][] sprite = groundSprite;
    for(i = 0;i<groundPWidth/groundPixSize; i++){
      for(j = 0;j<groundPHeight/groundPixSize; j++){
        fill(colorsR[sprite[i][j]],colorsG[sprite[i][j]],colorsB[sprite[i][j]],sprite[i][j]==0?0:255);
        stroke(colorsR[sprite[i][j]],colorsG[sprite[i][j]],colorsB[sprite[i][j]],sprite[i][j]==0?0:255);
        //stroke(0);
        rect(groundX+i*groundPixSize,groundY+j*groundPixSize,groundPixSize,groundPixSize);
      }
    }
  }

}

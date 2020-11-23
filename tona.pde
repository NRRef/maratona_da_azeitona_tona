import java.util.Iterator;

int w = 960;
int h = 360;
int tonaSpeed = 9;
int npcSpeed = 10;
int speed = 5;
int frame = 60;
int[][] groundSprite = new int[480][17];
int[][] tonaSprite = new int[12][20];
int[][] tonaWalk1Sprite = new int[12][20];
int[][] tonaWalk2Sprite = new int[12][20];
int[][][] npcSprite = new int[4][12][12];
int[][] heartSprite = new int[10][10];
int[][] heartEmptySprite = new int[10][10];
int[] colorsR = {255,0,76,192,147,55,255,198,255,142};
int[] colorsG = {255,0,79,0,103,86,255,89,255,65};
int[] colorsB = {255,0,43,0,45,35,255,17,0,12};
ArrayList<Npc> npcs;
boolean gameOver = false;
PImage back,startBack;

int pontos = 0;
int highScore = 0;
String actualScreen = "START";

BufferedReader reader;
String line;
PFont font;
PrintWriter output;
void setup(){
    size(960,360);
    frameRate(frame);
    
    font = loadFont("LucidaConsole-48.vlw");
    startBack = loadImage("./imgs/start_background.png");
    back = loadImage("./imgs/sky.png");
    npcs = new ArrayList();
    loadSave();
    loadSprite("ground", groundSprite);
    loadSprite("tona", tonaSprite);
    loadSprite("tona_walk_1", tonaWalk1Sprite);
    loadSprite("tona_walk_2", tonaWalk2Sprite);
    loadSpriteArray("npc1", npcSprite,0);
    loadSpriteArray("npc2", npcSprite,1);
    loadSpriteArray("npc3", npcSprite,2);
    loadSpriteArray("npc4", npcSprite,3);
    loadSprite("heart", heartSprite);
    loadSprite("heart_empty", heartEmptySprite);
}
Azeitona tona = new Azeitona();
GameScreen game = new GameScreen();
GameOverScreen gameover = new GameOverScreen();
StartScreen start = new StartScreen();

Heart heart = new Heart();
int bx = 0;
int by = 0;

int counterForEnableCreateNpc = 0;
int timeForEnableCreateNpc = 50;
int timeForEnableCreateRandomNpc = 10;
boolean enableCreateNpc = true;
void draw(){

    if(actualScreen == "GAME"){
      game.draw();
    }else if(actualScreen == "START"){
      start.draw();
    }else if(actualScreen == "GAMEOVER"){
      gameover.draw();
    }

}


void mousePressed() {
  if(actualScreen == "START"){
    if (start.rect1Over) {
      game = new GameScreen();
      npcs = new ArrayList();
      game.resetGame();
      start.btnClick(1);
    }else if(start.rect2Over){
      start.btnClick(2);
    }
  }
  if(actualScreen == "GAMEOVER"){
    if (gameover.rect1Over) {
      game = new GameScreen();
      npcs = new ArrayList();
      game.resetGame();
      gameover.btnClick(1);
    }else if(gameover.rect2Over){
      gameover.btnClick(2);
    }
  }
}
void keyPressed() {
  
    if(actualScreen == "GAME"){
      if (keyCode == UP || key == ' ') {
        tona.jump();
      }
      else if (keyCode == DOWN) {
        tona.jumpDown();
      }
      else if (keyCode == RIGHT) {
        heart.increaseHeart();
      }
      else if (keyCode == LEFT) {
        heart.dropHeart();
      }
      if (key == 'r') {
        game.resetGame();
      }
    }else if(actualScreen == "START"){
       if (key == 's') {
        actualScreen = "GAME";
      }
    }
  
}



void loadSprite(String filename, int[][] vector){
    reader = createReader("./sprites/" + filename + ".txt");
    try{
      line = reader.readLine();
      int j = 0;
      while(line!= null){
        String[] list = split(line, TAB);
        for(int i = 0; i< list.length;i++){
             vector[i][j] = int(list[i]);
          }
          
        j = j+1;
        line = reader.readLine();
     }}
    catch (IOException e) {
      e.printStackTrace();
      line = null;
    }
}
void loadSpriteArray(String filename, int[][][] vector, int arrayIndex){
    reader = createReader("./sprites/" + filename + ".txt");
    try{
      line = reader.readLine();
      int j = 0;
      while(line!= null){
        String[] list = split(line, TAB);
        for(int i = 0; i< list.length;i++){
             vector[arrayIndex][i][j] = int(list[i]);
          }
          
        j = j+1;
        line = reader.readLine();
      }
    }catch (IOException e) {
      e.printStackTrace();
      line = null;
    }
}
void loadSave(){
    reader = createReader("./saves/save.txt");
    try{
      line = reader.readLine();
      highScore = int(line);
    }catch (IOException e) {
      e.printStackTrace();
      line = null;
    }
}

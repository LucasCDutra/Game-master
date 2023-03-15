
import java.util.List;
import java.util.stream.Collectors;
import ddf.minim.*;

Minim gerenciador;
AudioPlayer efeitoPlayerDamage;
AudioPlayer efeitoZombieDamage;
AudioPlayer efeitoPlayerWalkDamage;
AudioPlayer musicMenu;
AudioPlayer musicGame;


static final int FADE = 2500;

static final List<Bullet> bullets = new ArrayList();  // JS 
static final PVector playerPos = new PVector();
  int playerLife = 6;

PVector charPos1 = new PVector();
PVector charPos2 = new PVector();

static final PVector gunScopePos = new PVector();
static final PVector playerSpd = new PVector();
static final PVector bulletSpd = new PVector();
static final List<Integer> bulletPool = new ArrayList();  


static final int NUM = 10, FPS = 60, BG = -1;
ArrayList<Zombie> enemys = new ArrayList<Zombie>();

final Zombie[] snipes = new Zombie[NUM];
final PVector target = new PVector();

int dificuldade = 0;
int gunSelect = 1;
short gunDamage;
int zombieCount = 0;

int zombieDamageTime = 0;
int playerDamageTime = 20;
int gameTime;
int timeGame = 20;

int numShots = 0;
int x_main = 400;
int y_main = 300;

int m = 5;
int pause = 0;
int scoreZombie;

boolean firstShot = false;
boolean startGame = false;

boolean wPressed = false;
boolean dPressed = false;
boolean sPressed = false;
boolean aPressed = false;

float angle = 0;

PImage cursor;
PImage titleMenu;
PImage character;
PImage char1;
PImage gun;


PImage zombie;
PImage zombieDmg;
PImage zombie2;
PImage zombie2Dmg;
PImage zombie3;
PImage zombie3Dmg;

PImage life1;
PImage life2;
PImage life3;
PImage score;

PImage buttonJogar;
PImage buttonControles;
PImage buttonCreditos;
PImage buttonDificuldade0;
PImage buttonDificuldade0_;
PImage buttonDificuldade1;
PImage buttonDificuldade1_;
PImage buttonDificuldade2;
PImage buttonDificuldade2_;
PImage buttonBack;
PImage buttonBack_;
PImage buttonbackMenu;
PImage buttonbackMenu_;
PImage buttonjogarnovamente;
PImage buttonjogarnovamente_;


PImage controllerW;
PImage controllerW_;
PImage controllerA;
PImage controllerA_;
PImage controllerS;
PImage controllerS_;
PImage controllerD;
PImage controllerD_;
PImage controllerM;
PImage controllerM_;

PImage gunSelect1;
PImage gunSelect2;
PImage gunSelect3;
PImage gunSelect1_;
PImage gunSelect2_;
PImage gunSelect3_;

PImage background;
PImage backgroundImage;
PImage backgroundSelection;
PImage backgroundCredito;
PImage bg_controller;
PImage gameoverbg;

String screen = "initialPage";
//initialPage
//playGame
//selectionPage
//controllerPage
//CreditosPage

void setup() {      
  frameRate(60);
  size(1200, 700);
  
  //****** efeitos de som   
  gerenciador = new Minim(this);
  musicMenu = gerenciador.loadFile("./effects/musicMenu.mp3");
  musicGame = gerenciador.loadFile("./effects/musicGame.mp3");
  efeitoPlayerDamage = gerenciador.loadFile("./effects/playerDamage.wav");
  efeitoZombieDamage = gerenciador.loadFile("./effects/zombieDamage.wav");
  efeitoPlayerWalkDamage = gerenciador.loadFile("./effects/playerSteps.wav");
  
  //******importar imagens********
  life1 = loadImage("./images/health_0.png"); 
  life2 = loadImage("./images/health_0.png"); 
  life3 = loadImage("./images/health_0.png"); 
  score = loadImage("./images/scorepng.png");  
  
  background = loadImage("./images/bg.jpg");
  backgroundSelection = loadImage("./images/bg_selections.jpg");
  bg_controller = loadImage("./images/bg_controller.jpg");
  backgroundCredito = loadImage("./images/bg_creditos.jpg");
  
  gameoverbg = loadImage("./images/gameover.png");
  backgroundImage = loadImage("./images/bg_game.png");
  
  titleMenu = loadImage("./images/titleMenu.png");
  
  char1 =  loadImage("./images/character1.png"); 
  gun = loadImage("./images/gun10.png"); 
  zombie = loadImage("./images/enemy1.png"); 
  zombieDmg = loadImage("./images/enemy1_damage.png"); 
  zombie2 = loadImage("./images/enemy2.png"); 
  zombie2Dmg = loadImage("./images/enemy2_damage.png"); 
  zombie3 = loadImage("./images/enemy3.png"); 
  zombie3Dmg = loadImage("./images/enemy3_damage.png"); 
  
  cursor = loadImage("./images/scopeCursor.png");
  
  buttonJogar = loadImage("./images/button_jogar.png");
  buttonControles = loadImage("./images/button_controles.png");
  buttonCreditos = loadImage("./images/button_credito.png");
  buttonBack = loadImage("./images/backButton.png");
  buttonBack_ = loadImage("./images/backButton_.png");
  
  gunSelect1 = loadImage("./images/gun10_select.png");
  gunSelect1_ = loadImage("./images/gun10_select_.png");
  gunSelect2 = loadImage("./images/gun20_select.png");
  gunSelect2_ = loadImage("./images/gun20_select_.png");
  gunSelect3 = loadImage("./images/gun30_select.png");
  gunSelect3_ = loadImage("./images/gun30_select_.png");  
  
  buttonDificuldade0 = loadImage("./images/dificuldade0.png");
  buttonDificuldade0_ = loadImage("./images/dificuldade0_.png");
  buttonDificuldade1 = loadImage("./images/dificuldade1.png");
  buttonDificuldade1_ = loadImage("./images/dificuldade1_.png");
  buttonDificuldade2 = loadImage("./images/dificuldade2.png");
  buttonDificuldade2_ = loadImage("./images/dificuldade2_.png");
  
  buttonjogarnovamente  = loadImage("./images/jogarnovamente.png");
  buttonjogarnovamente_ = loadImage("./images/jogarnovamente_.png");
  buttonbackMenu = loadImage("./images/menu.png");
  buttonbackMenu_= loadImage("./images/menu_.png");
  
  
  controllerW = loadImage("./images/keyboardW.png");
  controllerW_ = loadImage("./images/keyboardW_.png");
  controllerA = loadImage("./images/keyboardA.png");
  controllerA_ = loadImage("./images/keyboardA_.png");
  controllerS = loadImage("./images/keyboardS.png");
  controllerS_ = loadImage("./images/keyboardS_.png");
  controllerD = loadImage("./images/keyboardD.png");
  controllerD_ = loadImage("./images/keyboardD_.png");
  controllerM = loadImage("./images/keyboardMouse.png");
  controllerM_ = loadImage("./images/keyboardMouse_.png");
  
  cursor(cursor);
  
}

void draw() {  
  cursor(cursor);
  buttonJogar = loadImage("./images/button_jogar.png");
  buttonControles = loadImage("./images/button_controles.png");
  buttonCreditos = loadImage("./images/button_credito.png");
  if(gunSelect ==1){  
    gun = loadImage("./images/gun10.png"); 
    gunDamage = 2;
  }else if(gunSelect ==2){  
    gun = loadImage("./images/gun20.png");     
    gunDamage = 4;
  }else if(gunSelect == 3){  
    gun = loadImage("./images/gun30.png");     
    gunDamage = 6;
  }
  
  if(screen == "initialPage"){     
      //musicMenu.setGain(0); 
     //musicMenu.getGain();
     musicMenu.play();   
     
    //musicMenu.shiftGain(musicMenu.getGain(),-80,FADE);
    background(background);
    image(titleMenu,350,10);    
    stroke(255,0,0);    
     
    if((mouseX > width-195 && mouseX < width-60) && (mouseY > height-445 && mouseY < height- 385)){
      buttonJogar = loadImage("./images/button_jogarhover.png");
      image(buttonJogar,width-200,height-445);
    }else{    
      image(buttonJogar,width-200,height-450);
    }   
    
    if((mouseX > width-247 && mouseX < width-60) && (mouseY > height-365 && mouseY < height- 310)){     
      buttonControles = loadImage("./images/button_controleshover.png");      
      image(buttonControles,width-253,height-370);
    }else{
      image(buttonControles,width-253,height-375);
    }
    if((mouseX > width-247 && mouseX < width-60) && (mouseY > height-300 && mouseY < height- 240)){     
      buttonCreditos = loadImage("./images/button_credito_.png");      
      image(buttonCreditos,width-253,height-295);
    }else{
      image(buttonCreditos,width-253,height-300);
    }
    
    
    
    
  }else if(screen == "controllerPage"){        
    background(bg_controller);
    image(buttonBack,20,20);
    if((mouseX > 30 && mouseX < 65) && (mouseY > 30 && mouseY < 65)){      
      image(buttonBack_,20,20);
    }
    
    
    image(controllerW,300,100);  
    image(controllerW_,500,120);   
    
    image(controllerA,300,200);
    image(controllerA_,500,220);
    
    image(controllerS,300,300);
    image(controllerS_,500,320);    
    
    image(controllerD,300,400);
    image(controllerD_,500,420);
    
    image(controllerM,280,500);
    image(controllerM_,500,520);
    
    
      
  }else if(screen == "creditosPage"){   
    background(backgroundCredito);
    image(buttonBack,20,20);
    if((mouseX > 30 && mouseX < 65) && (mouseY > 30 && mouseY < 65)){      
      image(buttonBack_,20,20);
    }
    
  }else if(screen == "selectionPage"){    
    background(backgroundSelection);
    image(buttonBack,20,20);
    if((mouseX > 30 && mouseX < 65) && (mouseY > 30 && mouseY < 65)){      
      image(buttonBack_,20,20);
    }
    
    if((mouseX >width-160 && mouseX < width-10) && (mouseY >height-80  && mouseY <  height-10)){    
      buttonJogar = loadImage("./images/button_jogarhover.png");
      image(buttonJogar,width-160,height-75);
    }else{   
      image(buttonJogar,width-160,height-80);
    }  
    
    if(gunSelect == 1){
      image(gunSelect1_,width-950,400);
      image(gunSelect2,width-700,400);
      image(gunSelect3,width-450,380);      
    }else if(gunSelect == 2){
      image(gunSelect1,width-950,400);
      image(gunSelect2_,width-700,400);
      image(gunSelect3,width-450,380);      
    }else if(gunSelect == 3){
      image(gunSelect1,width-950,400);
      image(gunSelect2,width-700,400);
      image(gunSelect3_,width-450,380);      
    }        
    
    if(dificuldade == 0){
      image(buttonDificuldade0_,width-950,155);
      image(buttonDificuldade1,width-700,150);
      image(buttonDificuldade2,width-450,150);  
    }else if(dificuldade == 1){
      image(buttonDificuldade0,width-950,150);
      image(buttonDificuldade1_,width-700,155);
      image(buttonDificuldade2,width-450,150);  
    }else if(dificuldade == 2){
      image(buttonDificuldade0,width-950,150);
      image(buttonDificuldade1,width-700,150);
      image(buttonDificuldade2_,width-450,155);  
    }
    stroke(255,0,0);
        
    
  }else if(screen == "playGame"){
    
  musicMenu.pause();
    
  background(backgroundImage);
  image(life1,50,20);
  image(life2,85,20);
  image(life3,120,20);
  
  
  char1 =  loadImage("./images/character1.png");    
  if(playerLife == 0  ){
    image(gameoverbg,0,0);    
    
      fill(255);
      textSize(50);
      text(scoreZombie,600,300);
      image(score,570,280);
      
      if((mouseX >480 && mouseX < 726) && (mouseY >350  && mouseY <  415)){    
        image(buttonjogarnovamente_,480,357);
      }else{           
        image(buttonjogarnovamente,480,350);
      }
      
      if((mouseX >530 && mouseX < 680) && (mouseY >450  && mouseY <  522)){            
        image(buttonbackMenu_,530,450);
      }else{  
        image(buttonbackMenu,530,457);
      }
      
      
      
    
  }else{  
    fill(255);
    textSize(30);
    text(scoreZombie,1140,43);
    image(score,1110,20);
  
  
  
  if(gameTime % (60 - (dificuldade*5)) == 0){
    
    if(zombieCount != 0  && zombieCount%(30-dificuldade*10)==0){
      addEnemy(zombie3,zombie3Dmg,30);
    }else if( zombieCount != 0 && zombieCount%(10-dificuldade*4)==0){
      addEnemy(zombie2,zombie2Dmg,20);
    }else{
      addEnemy(zombie,zombieDmg,10);
    }
  }
  
  target.set(playerPos.x, playerPos.y);
  
  for (Zombie d: enemys){
   if((d.loc.x +25 >= charPos1.x && d.loc.x-25 <= charPos2.x) && 
     (d.loc.y +25 >= charPos1.y && d.loc.y-25 <= charPos2.y)){  
       char1= loadImage("./images/character1_damage.png"); 
       if(playerDamageTime == 0){
         if(playerLife > 0){
             if(playerLife == 6){
               efeitoPlayerDamage.play();
               life3 = loadImage("./images/health_2.png");            
               playerLife --;
             }else if(playerLife == 5){               
               efeitoPlayerDamage.play();
               life3 = loadImage("./images/health_1.png");            
               playerLife --;
             }else if(playerLife == 4){               
               efeitoPlayerDamage.play();  
               life2 = loadImage("./images/health_2.png");           
               playerLife --;
             }else if(playerLife == 3){               
               efeitoPlayerDamage.play();  
               life2 = loadImage("./images/health_1.png");           
               playerLife --;
             }else if(playerLife == 2){               
               efeitoPlayerDamage.play();  
               life1 = loadImage("./images/health_2.png");           
               playerLife --;
             }else if(playerLife == 1){               
               efeitoPlayerDamage.play();  
               life1 = loadImage("./images/health_1.png");           
               playerLife --;
             }
         }     
         playerDamageTime=20;
       }else{           
         playerDamageTime--;
       }
       
       println("**************** zombie "+d.zombieId+ " te infectou");
   }
    d.script(target);    
    if(zombieDamageTime == 0 ){   
      d.zombieImg = d.srcImage;
      zombieDamageTime = 10;
    }else{
      zombieDamageTime --;
    }
  }  
   
 
  gameTime++;
  moveCharacter();
  scopeCharacter();  
  bulletWalking();
}
}
}



//*************** TESTE BULLET ***********
 
void addBullet() {  
  if(firstShot){  
    bulletSpd.set(mouseX, mouseY, 0);
    bulletSpd.sub(playerPos.x,playerPos.y); 
    bulletSpd.normalize(); 
    
    if(gunSelect == 1){  
      bulletSpd.mult(20); 
    }else if(gunSelect == 2){  
      bulletSpd.mult(12); 
    }else if(gunSelect == 3){    
      bulletSpd.mult(7);   
    } 
    
    bullets.add(new Bullet(playerPos, bulletSpd,gunDamage));
  }else{
    firstShot = true;
  }
  
}
 
 
void bulletWalking(){
   fill(Bullet.COLOUR); 
  int b = bullets.size(); 
  while (b-- != 0){
     boolean hit = false;
    Bullet bul = bullets.get(b);
    if (bul.script()){
      bulletPool.add(b);
    }
    int e = enemys.size(); 
     while (e-- != 0){
        Zombie d = enemys.get(e);
        if((bul.pos.x >= d.zombiePos1.x && bul.pos.x <= d.zombiePos2.x) && (bul.pos.y >= d.zombiePos1.y && bul.pos.y <= d.zombiePos2.y)){    
            if(!hit){        
               
              efeitoZombieDamage.rewind();
              efeitoZombieDamage.play();
              
              d.zombieImg = d.srcImageDamage;
              d.zombieLife =  d.zombieLife - bul.gunDamage;
              bullets.remove(b);
            }
            if(!hit && d.zombieLife <= 0){
              scoreZombie++;
              enemys.remove(d);     
            }
            hit = true;
        }
     }
  }
}

//FIM TESTE BULLET


//******** ENYMIES 
void addEnemy(PImage img, PImage dmg, int lf ){
    enemys.add(new Zombie(img,dmg,lf));
    zombieCount++;
}

void newGame(){
    firstShot = false;
    int e = enemys.size(); 
     while (e-- != 0){
        //Zombie d = enemys.get(e);
        enemys.remove(e);
     }
  
  gameTime = 0;
  scoreZombie = 0;
  life1 = loadImage("./images/health_0.png"); 
  life2 = loadImage("./images/health_0.png"); 
  life3 = loadImage("./images/health_0.png"); 
  playerLife = 6;
}


//* ******** ENYMIES

//Precionando Mouse
void mousePressed() {
  if(screen == "initialPage"){
    if((mouseX > width-195 && mouseX < width-60) && (mouseY > height-445 && mouseY < height- 385)){
      screen = "selectionPage";
    }else if((mouseX > width-247 && mouseX < width-60) && (mouseY > height-365 && mouseY < height- 310)){
      screen = "controllerPage";
    }else if((mouseX > width-247 && mouseX < width-60) && (mouseY > height-300 && mouseY < height- 240)){
      screen = "creditosPage";
    }
    
  }
  
  if(screen == "selectionPage"){
    if((mouseX > 30 && mouseX < 65) && (mouseY > 30 && mouseY < 65)){
      screen = "initialPage";
    }      
    if((mouseX >width-160 && mouseX < width-10) && (mouseY >height-80  && mouseY <  height-10)){
      newGame();
      screen = "playGame";
    }    
    if((mouseX > width-950 && mouseX < width-750) && (mouseY >160 && mouseY<230 )){
      dificuldade = 0;
    }else  if((mouseX > width-700 && mouseX < width-500) && (mouseY >160 && mouseY<230 )){
     dificuldade =1;
    }else  if((mouseX > width-450 && mouseX < width-250) && (mouseY >160 && mouseY<230 )){
      dificuldade =2;
    }  
    if((mouseX > width-950 && mouseX < width-720) && (mouseY >400 && mouseY<510 )){
      gunSelect = 1;
    }else  if((mouseX > width-700 && mouseX < width-520) && (mouseY >400 && mouseY<510 )){
     gunSelect =2;
    }else  if((mouseX > width-450 && mouseX < width-220) && (mouseY >400 && mouseY<510 )){
      gunSelect =3;
    }
  
  }
  
  if(screen == "controllerPage"){
    if((mouseX > 30 && mouseX < 65) && (mouseY > 30 && mouseY < 65)){
        screen = "initialPage";
      } 
  }
    if(screen == "creditosPage"){
    if((mouseX > 30 && mouseX < 65) && (mouseY > 30 && mouseY < 65)){
        screen = "initialPage";
      } 
  }
  
  if(screen == "playGame"){
    if(playerLife == 0){
      if((mouseX > 480 && mouseX < 726) && (mouseY > 350 && mouseY < 415)){
        newGame();
      }
    
      if((mouseX > 530 && mouseX < 680) && (mouseY > 450 && mouseY < 522)){
        screen="initialPage";
      }
    }
        
   if (mouseButton == LEFT) {
     addBullet();
    }
  }
}

void scopeCharacter(){  
  pushMatrix();
  angle = atan2(playerPos.x -mouseX, playerPos.y-mouseY);
  translate(playerPos.x, playerPos.y);
  rotate(-angle-HALF_PI);
  image(gun,5,-3);
  image(char1,-22,-25);
  popMatrix();
}

//Pressionando Teclado
void moveCharacter(){
   if (aPressed){      
      if ( x_main > 80) {x_main = x_main - m;}
    }
    if (dPressed){     
      if ( x_main < (width - 60) ) {x_main = x_main + m;}
    }
    if (wPressed){  
       if ( y_main > 80 ){y_main = y_main - m;} 
    }
    if (sPressed){      
       if ( y_main < (height - 60)){y_main = y_main + m;} 
    }
    
    
    if(aPressed || dPressed ||wPressed ||sPressed){
        efeitoPlayerWalkDamage.play();    
    }else{      
        efeitoPlayerWalkDamage.pause();    
    }
    
    //efeitoPlayerWalkDamage.rewind();
    playerPos.set(x_main,y_main,0);
    charPos1.set(playerPos.x-20,playerPos.y-20);
    charPos2.set(playerPos.x+20,playerPos.y+20);
}

void keyPressed() {
    if (keyCode == 'W' || keyCode == 'w') { //CIMA
     wPressed = true;
    }else if (keyCode == 'S' || keyCode == 's') { //BAIXO     
     sPressed = true;
    }else if (keyCode == 'D' || keyCode == 'd') { //DIREITA
     dPressed = true;
    }else if (keyCode == 'A' || keyCode == 'a') {//ESQUERDA
     aPressed = true;
    }
    
    if(key == 'e'){
      addEnemy(zombie,zombieDmg,4);
    }
    if(key == 'r'){
      newGame();
    }
    
    if (keyCode == 32) {
       screen = "playGame";
       addBullet();
    }
}

void keyReleased(){
  if (keyCode == 'W' || keyCode == 'w') { //CIMA
     wPressed = false;
    }else if (keyCode == 'S' || keyCode == 's') { //BAIXO      
     sPressed = false;
    }else if (keyCode == 'D' || keyCode == 'd') { //DIREITA
     dPressed = false;
    }else if (keyCode == 'A' || keyCode == 'a') {//ESQUERDA
     aPressed = false;
    }
}

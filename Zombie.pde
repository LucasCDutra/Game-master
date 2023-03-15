

 class Zombie {  
  static final color FILL = 0250, STROKE = 0;
  static final float MAX_SPD = 2.0;
  static final float MAX_FORCE = .5; 
  static final float  WEIGHT = 1.5; 
   
   
   PVector saida1 = new PVector(20,310);
   PVector saida2 = new PVector(1180,310);
   PVector saida3 = new PVector(610,20);
   PVector saida4 = new PVector(610,680);   
  
  PVector[] locR = {saida1,saida2,saida3,saida4};
    
    
    
  final PVector vel = new PVector(random(-2, 2), random(-2, 2));
  final PVector acc = new PVector();  
  PVector zombiePos1 = new PVector();
  PVector zombiePos2 = new PVector();
  PImage zombieImg; 
  PImage srcImageDamage;
  PImage srcImage;
  
  
  int zombieLife;
  int zombieId = zombieCount;
  PVector locSelect = locR[parseInt(random(0,4))];
   PVector loc = new PVector(locSelect.x,locSelect.y);
  
  
  Zombie(PImage zombieImgSrc,PImage zombieDamageSrc,int zombieLifeSrc){
    srcImage = zombieImgSrc;
    srcImageDamage = zombieDamageSrc;
    zombieImg = zombieImgSrc;
    zombieLife = zombieLifeSrc;
  
  }
  
  void script(PVector target) {
    seek(target);
    update();
    display();
  }
 
  void seek(PVector target) {
     PVector.sub(target, loc, acc).setMag(MAX_SPD);
     PVector.sub(acc, vel, acc).limit(MAX_FORCE);
  }
 
  void update() {
    vel.add(acc);
    vel.limit(MAX_SPD);
    loc.add(vel);
  }
 
  void display() {
    zombiePos1.x = loc.x-20;
    zombiePos2.x = loc.x+20;
    zombiePos1.y = loc.y-20;
    zombiePos2.y = loc.y+20;
        
    //dline(zombiePos1.x,zombiePos1.y,zombiePos2.x,zombiePos2.y);    
        
    translate(loc.x, loc.y);
    rotate(vel.heading2D() + HALF_PI);
    image(zombieImg,-15,-15);   
    
    stroke(255,0,255);
    resetMatrix();
  }
}

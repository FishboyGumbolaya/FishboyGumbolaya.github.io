import java.util.*;
Random rand = new Random();
Spaceship ship = new Spaceship();
//Asteroid asteroid = new Asteroid();
//BigAsteroid bigasteroids = new BigAsteroid();

boolean isup, isleft, isright, ishyper, isshoot;

Star stars[] = new Star[10];
ArrayList<Asteroid> asteroids = new ArrayList<Asteroid> ();
ArrayList<BigAsteroid> bigasteroids = new ArrayList<BigAsteroid> ();
ArrayList<SmallAsteroid> smallasteroids = new ArrayList<SmallAsteroid>();
ArrayList<Bullet> bullets = new ArrayList<Bullet>();
int score = 0; 
int lives = 0; 
void setup() {
 
  
  
  
  
  for(int i = 0; i <= 5; i++){
    bigasteroids.add(new BigAsteroid());
  }
  for(int i = 0; i <= 6; i++){
    asteroids.add(new Asteroid(rand.nextInt(1000),rand.nextInt(1000)));
  }
  for(int i = 0; i <= 3; i++){
    smallasteroids.add(new SmallAsteroid(rand.nextInt(1000),rand.nextInt(1000)));
  }
  
for(int i = 0; i <= stars.length - 1; i++){
  stars[i] = new Star();
}
  
//runs only once
size(1000,1000);
lives = 3;
score = 0;
}

void draw() {
  background(0);
  textSize(32);
  
  if(lives > 0){
    for(int i = 0; i <= stars.length - 1; i++){
  stars[i].show();
    }
  ship.move();
  ship.show();
  
  for(int i = 0; i <= asteroids.size() - 1; i ++){
    asteroids.get(i).move();
    asteroids.get(i).show();
    text(score, 50, 50);
  text(lives, 50, 100);

    if(dist((float)ship.myCenterX, (float)ship.myCenterY, (float)asteroids.get(i).getAsteroidX(), (float)asteroids.get(i).getAsteroidY()) < 20){
      
        lives -= 1;
      
        ship.myCenterX = 500;
        ship.myCenterY = 500;
     
      
    } 
    for(int j = 0; j <= bullets.size() - 1; j ++){
    if(dist((float)bullets.get(j).myCenterX, (float)bullets.get(j).myCenterY, (float)asteroids.get(i).getAsteroidX(), (float)asteroids.get(i).getAsteroidY()) < 20){
        bullets.remove(j);
        smallasteroids.add(new SmallAsteroid(asteroids.get(i).getAsteroidX(), asteroids.get(i).getAsteroidY()));
        smallasteroids.add(new SmallAsteroid(asteroids.get(i).getAsteroidX(), asteroids.get(i).getAsteroidY()));
        asteroids.remove(i);
        score += 25;
        break;
    }
    }
  }
  for(int i = 0; i <= bigasteroids.size() - 1; i ++){
    bigasteroids.get(i).move();
    bigasteroids.get(i).show();
    if(dist((float)ship.myCenterX, (float)ship.myCenterY, (float)bigasteroids.get(i).getAsteroidX(), (float)bigasteroids.get(i).getAsteroidY()) < 30){
      
        lives -= 1;
      
        ship.myCenterX = 500;
        ship.myCenterY = 500;
     
      
    }
     for(int j = 0; j <= bullets.size() - 1; j ++){
    if(dist((float)bullets.get(j).myCenterX, (float)bullets.get(j).myCenterY, (float)bigasteroids.get(i).getAsteroidX(), (float)bigasteroids.get(i).getAsteroidY()) < 30){
        
        bullets.remove(j);
        asteroids.add(new Asteroid(bigasteroids.get(i).getAsteroidX(), bigasteroids.get(i).getAsteroidY()));
        asteroids.add(new Asteroid(bigasteroids.get(i).getAsteroidX(), bigasteroids.get(i).getAsteroidY()));
        bigasteroids.remove(i);
        score += 50;
        break;
    }
    }
    
  }
  for(int i = 0; i <= smallasteroids.size() - 1; i ++){
    smallasteroids.get(i).move();
    smallasteroids.get(i).show();
    if(dist((float)ship.myCenterX, (float)ship.myCenterY, (float)smallasteroids.get(i).getAsteroidX(), (float)smallasteroids.get(i).getAsteroidY()) < 10){
     
        lives -= 1;
       
        ship.myCenterX = 500;
        ship.myCenterY = 500;
      
      
    }
    for(int j = 0; j <= bullets.size() - 1; j ++){
    if(dist((float)bullets.get(j).myCenterX, (float)bullets.get(j).myCenterY, (float)smallasteroids.get(i).getAsteroidX(), (float)smallasteroids.get(i).getAsteroidY()) < 10){
        
        smallasteroids.remove(i);
        bullets.remove(j);
        score += 10;
        break;
    }
    }
  }
  for(int  i = 0; i <= bullets.size() - 1; i++){
    //bullets.get(i).accelerate();
    bullets.get(i).move();
    bullets.get(i).show();
    if(bullets.get(i).life >= 120){ 
      bullets.remove(i);
      break;
    }
   
    
    
    
  }
  }else{
    text("Game Over!" , 400, 500);
  }
  
//runs 60 times a second - can alter rate by calling frameRate(rate);  
  
    if(isright == true){
      ship.turn(6);
    }else if(isleft == true){
      ship.turn(-6);
    }
    if(isup == true){
      ship.accelerate(0.1);
    }else{
      ship.deccelerate(0.99);
    }
    if(ishyper == true){
      background(255);
      ship.myCenterX = rand.nextInt(1000);
      ship.myCenterY = rand.nextInt(1000);
      background(0);
      ishyper = false;
    }
    }
    


void keyPressed(){
  setMove(keyCode, true);
  if(key == ' '){
      if(bullets.size() < 10)bullets.add(new Bullet(ship.myCenterX, ship.myCenterY, ship.myPointDirection));
  }
}

void keyReleased(){
  setMove(keyCode, false);  
}

boolean setMove(int k, boolean b){
  switch (k) {
  case UP:
    return isup = b;
 
  case SHIFT:
    return ishyper = b;
 
  case LEFT:
    return isleft = b;
 
  case RIGHT:
    return isright = b;
    
  case ' ':
    return isshoot = b;
 
  default:
    return b;
  }
   }

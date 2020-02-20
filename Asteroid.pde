import java.util.Random;

public class Asteroid extends Floater{
  
  private int rotateSpeed;
  Random rand = new Random();
  
  public Asteroid(double x, double y){
    rotateSpeed = rand.nextInt(8) + 2;
    corners = 5;
    xCorners = new int[corners];
    yCorners = new int[corners];
    xCorners[0] = 0;
    yCorners[0] = (int)(Math.random() * 5) + 13;
    xCorners[1] = (int)(Math.random() * 5) + 13;
    yCorners[1] = (int)(Math.random() * 3);
    xCorners[2] = (int)(Math.random() * 5) + 10;
    yCorners[2] = (int)(Math.random() * -5) - 13;
    xCorners[3] = (int)(Math.random() * -5) - 13;
    yCorners[3] = (int)(Math.random() * -5) - 13;
    xCorners[4] = (int)(Math.random() * -5) - 13;
    yCorners[4] = (int)(Math.random() * 3);
    myColor = 255;
    myCenterX = x;
    myCenterY = y;
    myXspeed = 2.5 - rand.nextInt(5);
    myYspeed = 2.5 - rand.nextInt(5);
    myPointDirection = 360 - rand.nextInt(720);
  }
  
  public void move(){
      turn(rotateSpeed);
      myCenterX += myXspeed;
      myCenterY += myYspeed;
      
       if(myCenterX >width)
    {     
      myCenterX = 0;    
    }    
    else if (myCenterX<0)
    {     
      myCenterX = width;    
    }    
    if(myCenterY >height)
    {    
      myCenterY = 0;    
    } 
    
    else if (myCenterY < 0)
    {     
      myCenterY = height;    
    }   
  }
  
  public double getAsteroidX(){
    return myCenterX;
  }
  
  public double getAsteroidY(){
    return myCenterY;  
  }
  
  public void breaks(){
      
  }
}

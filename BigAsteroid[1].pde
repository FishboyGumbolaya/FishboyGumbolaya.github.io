import java.util.Random;

public class BigAsteroid extends Floater{
  
  private int rotateSpeed;
  //Random rand = new Random();
  
  public BigAsteroid(){
    rotateSpeed = rand.nextInt(8) + 2;
    corners = 6;
    xCorners = new int[corners];
    yCorners = new int[corners];
    xCorners[0] = 0;
    yCorners[0] = (int)(Math.random() * 10) + 25;
    xCorners[1] = (int)(Math.random() * 10) + 23;
    yCorners[1] = (int)(Math.random() * 8);
    xCorners[2] = (int)(Math.random() * 10) + 23;
    yCorners[2] = (int)(Math.random() * -10) - 25;
    xCorners[3] = (int)(Math.random() * -10) - 25;
    yCorners[3] = (int)(Math.random() * -10) - 25;
    xCorners[4] = (int)(Math.random() * -10) - 25;
    yCorners[4] = (int)(Math.random() * 8);
    xCorners[5] = (int)(Math.random() * 2) - 1;
    yCorners[5] = (int)(Math.random() * 2) - 1;
    myColor = 255;
    myCenterX = rand.nextInt(1000);
    myCenterY = rand.nextInt(1000);
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

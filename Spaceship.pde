public class Spaceship extends Floater{
  
   public Spaceship(){
    
    myCenterX = 500;
    myCenterY = 500;
    myColor = 255;
    myXspeed = 0;
    myYspeed = 0;
    myPointDirection = 90;
    corners = 5;
    xCorners = new int[corners];
    yCorners = new int[corners];
    xCorners[0]=-10;
    yCorners[0]=7;
    xCorners[1]=-6;
    yCorners[1]=3;
    xCorners[2]=-6;
    yCorners[2]=-3;
    xCorners[3]=-10;
    yCorners[3]=-7;
    xCorners[4]=11;
    yCorners[4]=0;
  
      
  }
  
}

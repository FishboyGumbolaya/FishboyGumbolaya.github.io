public class Bullet extends Floater{
  double myCenterX, myCenterY, life;
  public Bullet(double x, double y, double point){
    myPointDirection = point;
    myCenterX = x;
    myCenterY = y;
    myXspeed = ((10) * Math.cos((point*(Math.PI/180))));
    myYspeed = ((10) * Math.sin((point*(Math.PI/180))));
    
    
    /*double dRadians =myPointDirection*(Math.PI/180);     
    //change coordinates of direction of travel   
    if(myXspeed >= 5) myXspeed = 5;
    if(myXspeed <= -5) myXspeed = -5;
    if(myYspeed >= 5) myYspeed = 5;
    if(myYspeed <= -5) myYspeed = -5;
    
    myXspeed += ((dAmount) * Math.cos(dRadians));    
    myYspeed += ((dAmount) * Math.sin(dRadians));   */
  }
   
   public void move ()   //move the floater in the current direction of travel
  {      
    //change the x and y coordinates by myXspeed and myYspeed       
    myCenterX += myXspeed;    
    myCenterY += myYspeed;     

    //wrap around screen    
    /*if(myCenterX >width)
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
    } */
    life ++;
  }   
 
  public void show(){
      fill(255);
      ellipse((float)myCenterX, (float)myCenterY, 3, 3);
      //ellipse(500,500,3,3);
  }
  
}

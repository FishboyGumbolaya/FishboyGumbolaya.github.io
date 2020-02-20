import java.util.Random;

public class Star {
  Random rand = new Random();
  private int starX;
  private int starY;
  private int colour;

  public Star() {
      starX = rand.nextInt(1000);
      starY = rand.nextInt(1000);
  }
  
  public void show() {
      colour = 255;
      fill(255);
      ellipse(starX, starY, 3, 3);
  }
  
}

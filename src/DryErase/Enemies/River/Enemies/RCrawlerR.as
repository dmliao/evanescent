package DryErase.Enemies.River.Enemies
{
	import DryErase.Enemies.Bullets.AniBullet;
	import DryErase.Enemies.Generic.ForEnemy;
	import DryErase.Enemies.Generic.ForwardEnemy;
	import DryErase.Hero.Listener;
	
	import net.flashpunk.FP;
	import net.flashpunk.graphics.Image;
	
	public class RCrawlerR extends ForEnemy
	{
		
		public var shooterTimer:Number;
		public var shooterReset:Number;
		
		public var oscilRight:Boolean;
		
		public function RCrawlerR(xx:Number)
		{
			super(new Image(Assets.R_TURTLE_REAL), new Image(Assets.R_TURTLE_REAL), 10, 100, 3, 270, xx, -72, true, 64, 64, 32, 32, 0.9);
			shooterTimer = 2;
			direction = 270;
			oscilRight = Boolean(Math.round(Math.random()));
		}
		
		override public function update():void
		{
			super.update();
			shooterTimer -= FP.elapsed;
			
			if (shooterTimer < 0)
			{
				shooterTimer = 2;
				//shoot!
				oscilRight = !oscilRight;
				shoot(new AniBullet(24, 24, 12, 12, pointDirection(x,y, Listener.x2, Listener.y2), 4, 0, true, "green"), x, y + 35);
				
				
			}	
			
			if (oscilRight == true)
			{
				direction += 0.5 * Main.frameRate * FP.elapsed;
			}
			else
			{
				direction -= 0.5 * Main.frameRate * FP.elapsed;
			}
			
		}
	}
}
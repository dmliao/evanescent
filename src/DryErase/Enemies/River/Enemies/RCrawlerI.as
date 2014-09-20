package DryErase.Enemies.River.Enemies
{
	import DryErase.Enemies.Bullets.AniBullet;
	import DryErase.Enemies.Generic.ForEnemy;
	import DryErase.Enemies.Generic.ForwardEnemy;
	import DryErase.Hero.Listener;
	
	import net.flashpunk.FP;
	import net.flashpunk.graphics.Image;
	
	public class RCrawlerI extends ForEnemy
	{
		
		public var shooterTimer:Number;
		public var shooterReset:Number;
		
		public var oscilRight:Boolean;
		
		public function RCrawlerI(xx:Number)
		{
			super(new Image(Assets.R_PILLBUG_IMAG), new Image(Assets.R_PILLBUG_IMAG), 5, 100, 3, 270, xx, -72, false, 64, 64, 32, 32, 0.3);
			shooterTimer = 2;
			direction = dir;
			oscilRight = round(Math.random()) as Boolean;
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
				shoot(new AniBullet(24, 24, 12, 12, pointDirection(x,y, Listener.x2, Listener.y2), 4, 0, false), x, y + 35);
				
				
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
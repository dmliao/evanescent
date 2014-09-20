package DryErase.Enemies.Forest.Enemies
{
	import DryErase.Enemies.Bullets.AniBullet;
	import DryErase.Enemies.Generic.ForEnemy;
	import DryErase.Hero.Listener;
	
	import net.flashpunk.FP;
	import net.flashpunk.graphics.Image;

	public class FWaverI extends ForEnemy
	{
		public var shooterTimer:Number;
		public var shooterReset:Number;
		
		public var oscilRight:Boolean;
		public function FWaverI(xx:Number,right:Boolean)
		{
			super(new Image(Assets.F_ANT_IMAG), new Image(Assets.F_ANT_IMAG), 4, 100, 3, 270, xx, -72, false, 64, 64, 32, 32, 0.6, 0);
			shooterTimer = 0.3;
			direction = 270;
			oscilRight = right;
		}
		override public function update():void
		{
			
			super.update();
			shooterTimer -= FP.elapsed;
			
			if (shooterTimer < 0)
			{
				shooterTimer = 1;
				//shoot!
				oscilRight = !oscilRight;
				if (oscilRight == true)
				{
					
					shoot(new AniBullet(24, 24, 12, 12, pointDirection(x,y, Listener.x2, Listener.y2), 4, 0, false, "green"), x, y + 35);
				}
				
			}	
			
			if (oscilRight == true)
			{
				direction += 2 * Main.frameRate * FP.elapsed;
			}
			else
			{
				direction -= 2 * Main.frameRate * FP.elapsed;
			}
		}
	}
}
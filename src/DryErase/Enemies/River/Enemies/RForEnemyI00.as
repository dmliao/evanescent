package DryErase.Enemies.River.Enemies
{
	import DryErase.Enemies.Bullets.AniBullet;
	import DryErase.Enemies.Generic.ForEnemy;
	import DryErase.Enemies.Generic.ForwardEnemy;
	import DryErase.Hero.Listener;
	
	import net.flashpunk.FP;
	import net.flashpunk.graphics.Image;

	public class RForEnemyI00 extends ForEnemy
	{
		public var shooterTimer:Number;
		public var shooterReset:Number;
		
		public function RForEnemyI00(xx:Number, yy:Number, shootTimer:Number, dir:Number)
		{
			super(new Image(Assets.R_PILLBUG_IMAG), new Image(Assets.R_PILLBUG_IMAG), 5, 100, 2, dir, xx, yy, false, 64, 64, 32, 32, 0.3);
			shooterTimer = shootTimer;
			shooterReset = shootTimer;
			direction = dir;
		}
		
		override public function update():void
		{
			super.update();
			shooterTimer -= FP.elapsed;
			currentImage.angle = pointDirection(x,y,Listener.x2,Listener.y2);
			if (shooterTimer < 0)
			{
				shooterTimer = 3;
				//shoot!
				
				shoot(new AniBullet(24, 24, 12, 12, pointDirection(x,y, Listener.x2, Listener.y2), 4, 0, false), x, y + 35);
				
				
			}	
			
		}
	}
}
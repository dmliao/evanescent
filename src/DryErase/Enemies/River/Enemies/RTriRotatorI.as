package DryErase.Enemies.River.Enemies
{
	import DryErase.Enemies.Bullets.Bullet;
	import DryErase.Enemies.Generic.CirclerEnemy;
	
	import com.debug.Debug;
	
	import net.flashpunk.FP;
	import net.flashpunk.graphics.Image;

	public class RTriRotatorI extends CirclerEnemy
	{
		public var shooterTimer:Number;
		public var shooterReset:Number;
		
		public var image:Image;
		//START SHOOT TIMER is the time before the enemy fires the first shot, and then shootTimer is the amount of time between shots
		public function RTriRotatorI(startX:Number, shootTimer:Number, startShootTimer:Number)
		{
			image = new Image(Assets.R_TRI_IMAG);
			super(new Image(Assets.R_TRI_IMAG), new Image(Assets.R_TRI_IMAG), 25, 500, false, startX, -64, 96,96,48,48, 3.5, 290, true, 1.5, 15);
			shooterTimer = startShootTimer;
			shooterReset = shootTimer;
		}
		
		override public function update():void
		{
			super.update();
			imageDir -= 2 * Main.frameRate * FP.elapsed;
			shooterTimer -= FP.elapsed;
			if (shooterTimer <= 0)
			{
				shoot(new Bullet(image, 12, 12, 24, 24, direction, 3, 0, false, 4, 0.6), x, y, new Image(Assets.R_TRI_IMAG));
				shoot(new Bullet(image, 12, 12, 24, 24, direction + 120, 3, 0, false, 4, 0.6), x, y, new Image(Assets.R_TRI_IMAG));
				shoot(new Bullet(image, 12, 12, 24, 24, direction + 240, 3, 0, false, 4, 0.6), x, y, new Image(Assets.R_TRI_IMAG));
				shooterTimer = shooterReset;
			}
		}
	}
}
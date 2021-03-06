package DryErase.Enemies.River.Enemies
{
	import DryErase.Enemies.Bullets.Bullet;
	import DryErase.Enemies.Generic.ForwardEnemy;
	
	import net.flashpunk.FP;
	import net.flashpunk.graphics.Image;

	public class RLilipadI extends ForwardEnemy
	{
		
		public var shootTimer:Number = 0;
		public function RLilipadI(xx:Number)
		{
			super(new Image(Assets.R_LPAD_IMAG), new Image(Assets.R_LPAD_IMAG), 12, 200, 2, xx, -72, false, 64, 48, 32, 24);
		}
		
		override public function update():void
		{
			super.update();
			currentImage.angle = 0;
			
			shootTimer += FP.elapsed;
			if (shootTimer >= 1)
			{
				shootTimer = 0;
				shoot(new Bullet(new Image(Assets.BULLET_GREEN_IMAG), 24, 24, 12, 12, 0, 4, 0.5, false, 1), x, y, new Image(Assets.BULLET_GREEN_IMAG));
				shoot(new Bullet(new Image(Assets.BULLET_GREEN_IMAG), 24, 24, 12, 12, 45, 4, 0.5, false, 1), x, y, new Image(Assets.BULLET_GREEN_IMAG));
				shoot(new Bullet(new Image(Assets.BULLET_GREEN_IMAG), 24, 24, 12, 12, 90, 4, 0.5, false, 1), x, y, new Image(Assets.BULLET_GREEN_IMAG));
				shoot(new Bullet(new Image(Assets.BULLET_GREEN_IMAG), 24, 24, 12, 12, 135, 4, 0.5, false, 1), x, y, new Image(Assets.BULLET_GREEN_IMAG));
				shoot(new Bullet(new Image(Assets.BULLET_GREEN_IMAG), 24, 24, 12, 12, 180, 4, 0.5, false, 1), x, y, new Image(Assets.BULLET_GREEN_IMAG));
				shoot(new Bullet(new Image(Assets.BULLET_GREEN_IMAG), 24, 24, 12, 12, 225, 4, 0.5, false, 1), x, y, new Image(Assets.BULLET_GREEN_IMAG));
				shoot(new Bullet(new Image(Assets.BULLET_GREEN_IMAG), 24, 24, 12, 12, 270, 4, 0.5, false, 1), x, y, new Image(Assets.BULLET_GREEN_IMAG));
				shoot(new Bullet(new Image(Assets.BULLET_GREEN_IMAG), 24, 24, 12, 12, 315, 4, 0.5, false, 1), x, y, new Image(Assets.BULLET_GREEN_IMAG));
			}
		}
	}
}
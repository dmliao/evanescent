package DryErase.Enemies.River.Enemies
{
	import DryErase.Enemies.Bullets.AniBullet;
	import DryErase.Enemies.Specific.Swooper;
	import DryErase.Hero.Listener;
	
	import net.flashpunk.FP;
	import net.flashpunk.graphics.Image;
	public class RSwoopShooterR extends Swooper
	{
		public var shootTimer:Number = 0;
		
		public function RSwoopShooterR(right:Boolean)
		{
			super(new Image(Assets.R_RTHRUSH_REAL), new Image(Assets.R_RTHRUSH_REAL), true, right, 2);
			imageScale = 1;
		}
		
		override public function update():void
		{
			super.update();
			shootTimer += FP.elapsed;
			if (shootTimer > 1.3)
			{
				shoot(new AniBullet(12,12,24,24,direction + 90, 4, 0, true, "green"), x, y);
				shoot(new AniBullet(12,12,24,24,direction - 90, 4, 0, true, "green"),x, y);
				shoot(new AniBullet(12,12,24,24,pointDirection(x, y, Listener.x2, Listener.y2), 4, 0, true, "green"),x, y);
				shootTimer = 0;
			}
		}
	}
}
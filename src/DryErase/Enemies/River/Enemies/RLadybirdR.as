package DryErase.Enemies.River.Enemies
{
	import DryErase.Enemies.Bullets.Bullet;
	import DryErase.Enemies.Generic.ForEnemy;
	
	import net.flashpunk.FP;
	import net.flashpunk.graphics.Image;

	public class RLadybirdR extends ForEnemy
	{
		
		
		public var shootTimer:Number = 0;
		public function RLadybirdR()
		{
			super(new Image(Assets.R_LADY_REAL), new Image(Assets.R_LADY_REAL), 5, 100, 3, 240 + Math.random()*60, 300 + Math.random()*40, -72, true, 64, 64, 32, 32, 0.4, -1 + Math.random()*2);
		}
		override public function update():void
		{
			super.update();
			shootTimer += FP.elapsed;
			if (shootTimer > 2)
			{
				shootTimer = 0;
				shoot(new Bullet(new Image(Assets.BULLET_RED_REAL), 24,24,12,12,0, 4, -1, true, 2), x, y, new Image(Assets.BULLET_RED_REAL));
				shoot(new Bullet(new Image(Assets.BULLET_RED_REAL), 24,24,12,12,180, 4, 1, true, 2), x, y, new Image(Assets.BULLET_RED_REAL));
			}
		}
	}
}
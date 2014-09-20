package DryErase.Enemies.Forest.Enemies
{
	import DryErase.Enemies.Bullets.AniBullet;
	import DryErase.Enemies.Bullets.Bullet;
	import DryErase.Enemies.Generic.ForwardEnemy;
	
	import net.flashpunk.FP;
	import net.flashpunk.graphics.Image;

	public class FForEnemyI extends ForwardEnemy
	{
		public var shootTimer:Number;
		public function FForEnemyI(xx:Number)
		{
			super(new Image(Assets.F_THRUSH_IMAG),new Image(Assets.F_THRUSH_IMAG), 3, 100, 3, xx, - 72, false, 48,48,24,24);
		}
		override public function update():void
		{
			super.update();
			shootTimer += FP.elapsed;
			if (shootTimer > 0.7)
			{
				shoot(new AniBullet(24,24,12,12,0,4, 0, false),x,y);
				shoot(new AniBullet(24,24,12,12,180,4, 0, false),x,y);
				shootTimer = 0;
			}
		}
	}
}
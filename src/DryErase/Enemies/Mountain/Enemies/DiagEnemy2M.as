package DryErase.Enemies.Mountain.Enemies
{
	import DryErase.Enemies.Bullets.AniBullet;
	import DryErase.Enemies.Bullets.Bullet;
	import DryErase.Enemies.Generic.PauseEnemy;
	import DryErase.Effects.*;
	import net.flashpunk.FP;
	import net.flashpunk.graphics.Image;
	import net.flashpunk.Entity;
	
	public class DiagEnemy2M extends PauseEnemy
	{
		public var movingRight:Boolean;
		private var shootTimer:Number = 2;
		private var shootTimes:Number = 0;
		public function DiagEnemy2M(right:Boolean, field:Boolean = true)
		{
			movingRight = right;
			
			super(new Image(Assets.M_DFLY_REAL), new Image(Assets.M_DFLY_REAL), 1.5, 4, 0, null, 4, 330 - (Number(right)* 120), 200, 200, 100, 100, 20, 300, -84 + (Number(right)*726), 0, field);
			
			
		}
		override public function update():void
		{
			super.update();
			shootTimer -= FP.elapsed;
			if (shootTimer <= 0 && shootTimes < 3)
			{
				shoot(new AniBullet(24, 24, 12, 12, 0, 3, 0.1, true, "green"),x,y);
				shoot(new AniBullet(24, 24, 12, 12, 45, 3, 0.1, true, "green"),x,y);
				shoot(new AniBullet(24, 24, 12, 12, 90, 3, 0.1, true, "green"),x,y);
				shoot(new AniBullet(24, 24, 12, 12, 135, 3, 0.1, true, "green"),x,y);
				shoot(new AniBullet(24, 24, 12, 12, 180, 3, 0.1, true, "green"),x,y);
				shoot(new AniBullet(24, 24, 12, 12, 225, 3, 0.1, true, "green"),x,y);
				shoot(new AniBullet(24, 24, 12, 12, 270, 3, 0.1, true, "green"),x,y);
				shoot(new AniBullet(24, 24, 12, 12, 315, 3, 0.1, true, "green"),x,y);
				shootTimer = 0.2;
				shootTimes += 1;
			}
		}
		override public function removed():void
		{
			super.removed();
			var Ex01:Entity = new Explosion_Reality(x, y, 1.75);
			FP.world.add(Ex01);
		}
	}
}
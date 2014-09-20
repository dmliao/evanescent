package DryErase.Enemies.Mountain.Enemies
{
	import DryErase.Enemies.Bullets.AniBullet;
	import DryErase.Enemies.Bullets.Bullet;
	import DryErase.Enemies.Generic.PauseEnemy;
	import DryErase.Effects.Explosion_Imagination;
	import net.flashpunk.FP;
	import net.flashpunk.graphics.Image;
	import net.flashpunk.Entity;

	public class DiagEnemyM extends PauseEnemy
	{
		public var movingRight:Boolean;
		
		//INITIALIZE IMAGES
		private var shootTimer:Number = 2;
		private var shootTimes:Number = 0;
		public function DiagEnemyM(right:Boolean, field:Boolean = false)
		{
			movingRight = right;
			
			super(new Image(Assets.M_DFLY_IMAG), new Image(Assets.M_DFLY_IMAG), 1.5, 4, 0, null, 4, 30 + (Number(right)* 120), 200, 200, 100, 100, 20, 300, -84 + (Number(right)*726), 320, field);
			
			
		}
		override public function update():void
		{
			super.update();
			shootTimer -= FP.elapsed;
			if (shootTimer <= 0 && shootTimes < 3)
			{
				shoot(new AniBullet(24, 24, 12, 12, 0, 3, 0.1, false),x,y);
				shoot(new AniBullet(24, 24, 12, 12, 45, 3, 0.1, false),x,y);
				shoot(new AniBullet(24, 24, 12, 12, 90, 3, 0.1, false),x,y);
				shoot(new AniBullet(24, 24, 12, 12, 135, 3, 0.1, false),x,y);
				shoot(new AniBullet(24, 24, 12, 12, 180, 3, 0.1, false),x,y);
				shoot(new AniBullet(24, 24, 12, 12, 225, 3, 0.1, false),x,y);
				shoot(new AniBullet(24, 24, 12, 12, 270, 3, 0.1, false),x,y);
				shoot(new AniBullet(24, 24, 12, 12, 315, 3, 0.1, false),x,y);
				shootTimer = 0.2;
				shootTimes += 1;
			}
		}
		override public function removed():void
		{
			super.removed();
			var Ex01:Entity = new Explosion_Imagination(x, y);
			FP.world.add(Ex01);
		}
	}
}
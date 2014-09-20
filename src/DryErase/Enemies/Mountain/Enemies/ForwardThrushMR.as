package DryErase.Enemies.Mountain.Enemies
{
	import DryErase.Enemies.Bullets.AniBullet;
	import DryErase.Enemies.Bullets.Bullet;
	import DryErase.Enemies.Generic.ForwardEnemy;
	import DryErase.Hero.Listener;
	
	import net.flashpunk.FP;
	import net.flashpunk.graphics.Image;
	
	public class ForwardThrushMR extends ForwardEnemy
	{
		
		public var shooterTimer:Number;
		public var shooterReset:Number;
		public var willitShoot:Boolean;
		
		public function ForwardThrushMR(xx:Number,willShoot:Boolean, shootTimer:Number)
		{
			super(new Image(Assets.MX_BIRD_REAL), new Image(Assets.MX_BIRD_REAL), 2, 50, 3, xx, -72, true, 64, 48, 32, 24);
			shooterTimer = shootTimer;
			shooterReset = shootTimer;
			imageScale = 0.5;
			willitShoot = willShoot;
			imageScale = 0.75;
		}
		
		override public function update():void
		{
			super.update();
			shooterTimer -= FP.elapsed;
			if (shooterTimer < 0 && willitShoot == true)
			{
				shooterTimer = 500;
				//shoot!
				
				shoot(new Bullet(new Image(Assets.BULLET_REAL), 24,24,12,12,direction,6,0,true,0,1,true), x, y + 35, new Image(Assets.BULLET_REAL));
				shoot(new Bullet(new Image(Assets.BULLET_REAL), 24,24,12,12,direction - 40,6,0,true,0,1,true), x, y + 35, new Image(Assets.BULLET_REAL));
				shoot(new Bullet(new Image(Assets.BULLET_REAL), 24,24,12,12,direction + 40,6,0,true,0,1,true), x, y + 35, new Image(Assets.BULLET_REAL));
				
			}
			
			
		}
	}
}
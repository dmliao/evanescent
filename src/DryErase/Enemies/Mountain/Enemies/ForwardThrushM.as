package DryErase.Enemies.Mountain.Enemies
{
	import DryErase.Enemies.Bullets.AniBullet;
	import DryErase.Enemies.Bullets.Bullet;
	import DryErase.Enemies.Generic.ForwardEnemy;
	import DryErase.Hero.Listener;
	
	import net.flashpunk.FP;
	import net.flashpunk.graphics.Image;
	
	public class ForwardThrushM extends ForwardEnemy
	{
		
		public var shooterTimer:Number;
		public var shooterReset:Number;
		public var willitShoot:Boolean;
		
		public function ForwardThrushM(xx:Number,willShoot:Boolean, shootTimer:Number)
		{
			super(new Image(Assets.M_SPTHRUSH_IMAG), new Image(Assets.M_SPTHRUSH_IMAG), 2, 50, 3, xx, -72, false, 64, 48, 32, 24);
			shooterTimer = shootTimer;
			shooterReset = shootTimer;
			imageScale = 0.5;
			willitShoot = willShoot;
		}
		
		override public function update():void
		{
			super.update();
			shooterTimer -= FP.elapsed;
			if (shooterTimer < 0 && willitShoot == true)
			{
				shooterTimer = 500;
				//shoot!
				
				shoot(new AniBullet(24, 24, 12, 12, direction, 6, 0, false), x, y + 35);
				shoot(new AniBullet(24, 24, 12, 12, direction - 40, 6, 0, false), x, y + 35);
				shoot(new AniBullet(24, 24, 12, 12, direction + 40, 6, 0, false), x, y + 35);
				
			}
			
			
		}
	}
}
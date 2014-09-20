package DryErase.Enemies.Mountain.Enemies
{
	import DryErase.Enemies.Bullets.AniBullet;
	import DryErase.Enemies.Bullets.Bullet;
	import DryErase.Enemies.Generic.ForwardEnemy;
	import DryErase.Hero.Listener;
	
	import net.flashpunk.FP;
	import net.flashpunk.graphics.Image;
	
	public class ForwardThrush2MR extends ForwardEnemy
	{
		
		
		public var shooterTimer:Number;
		public var shooterReset:Number;
		
		public var reloadTimer:Number = 0;
		public var shotTimes:Number = 0;
		public var shootRight:Boolean;
		
		public function ForwardThrush2MR(xx:Number,shootTimer:Number)
		{
			super(new Image(Assets.MX_THRUSH_REAL), new Image(Assets.MX_THRUSH_REAL), 2, 50, 3, xx, -72, true, 64, 48, 32, 24);
			shooterTimer = shootTimer;
			shooterReset = shootTimer;
			if (Listener.x2 > x)
			{
				shootRight = true;
			}
			else
			{
				shootRight = false;
			}
		}
		
		override public function update():void
		{
			super.update();
			shooterTimer -= FP.elapsed;
			if (shooterTimer < 0)
			{
				
				reloadTimer -= FP.elapsed;
				//shoot!
				if (shootRight == true)
				{
					if (shotTimes < 5)
					{
						if (reloadTimer <= 0)
						{
							shoot(new Bullet(new Image(Assets.BULLET_BLUE_REAL), 32, 32, 16, 16, 270, 4, 0.5, true, 0, 1.25, true), x, y, new Image(Assets.BULLET_BLUE_REAL));
							reloadTimer = 0.2;
							shotTimes += 1;
						}
					}
					
				}
				if (shootRight == false)
				{
					if (shotTimes < 5)
					{
						if (reloadTimer <= 0)
						{
							shoot(new Bullet(new Image(Assets.BULLET_BLUE_REAL), 32, 32, 16, 16, 270, 4, -0.5, true, 0, 1.25, true), x, y, new Image(Assets.BULLET_BLUE_REAL));
							reloadTimer = 0.2;
							shotTimes += 1;
						}
					}
					
				}
				
			}
			
			
		}
	}
}
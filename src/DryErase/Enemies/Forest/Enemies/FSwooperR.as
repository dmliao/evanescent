package DryErase.Enemies.Forest.Enemies
{
	import DryErase.Enemies.Bullets.Bullet;
	import DryErase.Enemies.Specific.Swooper;
	import DryErase.Hero.Listener;
	
	import net.flashpunk.FP;
	import net.flashpunk.graphics.Image;
	
	public class FSwooperR extends Swooper
	{
		public var shooterTimer:Number;
		public var shooterReset:Number;
		
		public var reloadTimer:Number = 0;
		public var shotTimes:Number = 0;
		public var shootRight:Boolean;
		
		public function FSwooperR(right:Boolean)
		{
			super(new Image(Assets.F_SCARAB_REAL), new Image(Assets.F_SCARAB_REAL), true, right, 2);
			shooterTimer = 0.5;
			shooterReset = 0.5;
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
			moveSpeed += 0.025;
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
							shoot(new Bullet(new Image(Assets.BULLET_BWAVE_REAL), 32, 32, 16, 16, direction, 4, 0.5, true, 5), x, y, new Image(Assets.BULLET_BWAVE_REAL));
							reloadTimer = 0.2;
							shotTimes += 1;
						}
					}
					else
					{
						
						shooterTimer = 2;
						reloadTimer = 0;
						shotTimes = 0;
					}
					
				}
				if (shootRight == false)
				{
					if (shotTimes < 5)
					{
						
						if (reloadTimer <= 0)
						{
							shoot(new Bullet(new Image(Assets.BULLET_BWAVE_REAL), 32, 32, 16, 16, direction, 4, -0.5, true, -5), x, y, new Image(Assets.BULLET_BWAVE_REAL));
							reloadTimer = 0.2;
							shotTimes += 1;
						}
					}
					else
					{
						
						shooterTimer = 2;
						reloadTimer = 0;
						shotTimes = 0;
					}
					
				}
				
			}
		}
	}
}
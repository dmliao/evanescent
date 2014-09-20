package DryErase.Enemies.River.Enemies
{
	import DryErase.Enemies.Bullets.Bullet;
	import DryErase.Enemies.Generic.ArcEnemy;
	
	import net.flashpunk.FP;
	import net.flashpunk.graphics.Image;

	public class RArcEnemyI extends ArcEnemy
	{
		//INITIALIZE IMAGES
		
		//ALARMS
		private var deleteAlarm:Number = 0;
		private var shootAlarm:Number = 0;
		public var reloadTimer:Number = 0;
		public var shotTimes:Number = 0;
		
		public var shootRight:Boolean;
		
		public function RArcEnemyI(clockwise:Boolean, xx:Number = 0, yy:Number = 0,startDirection:Number = 0) 
		{
			super(new Image(Assets.R_RTHRUSH_IMAG), new Image(Assets.R_RTHRUSH_IMAG), 1, 50, 5, -64, 96, false, 64, 48, 32, 24, startDirection, 2, 0.05, clockwise);
			x = xx;
			y = yy;
			shootRight = clockwise;
		}
		
		override public function update():void
		{
			super.update();
			deleteAlarm += FP.elapsed;
			shootAlarm += FP.elapsed;
			
			if (shootAlarm > 1)
			{
				{
					
					reloadTimer -= FP.elapsed;
					//shoot!
					if (shootRight == true)
					{
						if (shotTimes < 5)
						{
							if (reloadTimer <= 0)
							{
								shoot(new Bullet(new Image(Assets.BULLET_GREEN_IMAG), 32, 32, 16, 16, 310, 4, 0.5, false, 5), x, y, new Image(Assets.BULLET_GREEN_IMAG));
								reloadTimer = 0.2;
								shotTimes += 1;
							}
						}
						else 
						{
							shootAlarm = 0;
							shotTimes = 0;
						}
						
					}
					if (shootRight == false)
					{
						if (shotTimes < 5)
						{
							if (reloadTimer <= 0)
							{
								shoot(new Bullet(new Image(Assets.BULLET_GREEN_IMAG), 32, 32, 16, 16, 230, 4, -0.5, false, -5), x, y, new Image(Assets.BULLET_GREEN_IMAG));
								reloadTimer = 0.2;
								shotTimes += 1;
							}
						}
						else 
						{
							shootAlarm = 0;
							shotTimes = 0;
						}
						
					}
					
				}
				
			}
			if (deleteAlarm > 9.5)
			{
				if (x < -16 || x > 656)
				{
					FP.world.remove(this);
				}
			}
		}
	}
}
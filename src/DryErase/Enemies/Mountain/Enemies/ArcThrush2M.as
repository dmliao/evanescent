package DryErase.Enemies.Mountain.Enemies 
{
	import DryErase.Enemies.Bullets.AniBullet;
	import DryErase.Enemies.Bullets.Bullet;
	import DryErase.Enemies.Generic.ArcEnemy;
	import DryErase.Hero.Listener;
	
	import net.flashpunk.FP;
	import net.flashpunk.graphics.Image;
	/**
	 * ...
	 * @author 
	 */
	public class ArcThrush2M extends ArcEnemy
	{
		
		
		
		
		//ALARMS
		private var deleteAlarm:Number = 0;
		private var shootAlarm:Number = 0;
		public var reloadTimer:Number = 0;
		public var shotTimes:Number = 0;
		
		public var shootRight:Boolean;
		
		public var bimage:Image;
		public function ArcThrush2M(clockwise:Boolean, xx:Number = 0, yy:Number = 0,startDirection:Number = 0) 
		{
			bimage = new Image(Assets.BULLET_BWAVE_REAL);	
			super(new Image(Assets.M_SPTHRUSH_REAL), new Image(Assets.M_SPTHRUSH_REAL), 1, 50, 5, -64, 96, true, 64, 48, 32, 24, startDirection, 2, 0.05, clockwise);
			x = xx;
			y = yy;
			shootRight = clockwise;
			imageScale = 0.3;
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
								shoot(new Bullet(bimage, 32, 32, 16, 16, 270, 4, 0.5, true, 5), x, y, bimage);
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
								shoot(new Bullet(bimage, 32, 32, 16, 16, 270, 4, -0.5, true, -5), x, y, bimage);
								reloadTimer = 0.2;
								shotTimes += 1;
							}
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
package DryErase.Enemies.Mountain.Enemies
{
	import DryErase.Enemies.Bullets.Bullet;
	import DryErase.Enemies.Generic.ForEnemy;
	import DryErase.Hero.Listener;
	import net.flashpunk.FP;
	import net.flashpunk.graphics.Image;

	public class SideSwooperM extends ForEnemy
	{
		
		
		public var swoopTimer:Number;
		public var endDir:Number;
		public var turnClockwise:Boolean;
		
		public var reloadTimer:Number = 0;
		public var shotTimes:Number = 0;
		public var shootRight:Boolean;
		
		public function SideSwooperM(xx:Number, yy:Number, startDir:Number, swoopAlarm:Number, clockwise:Boolean)
		{
			super(new Image(Assets.M_STAR_REAL), new Image(Assets.M_STAR_REAL), 4, 80, 3, startDir, xx, yy, true, 200, 200, 100, 100, 0.7);
			if (clockwise == true)
			{
				endDir = startDir - 90;
			}
			else
			{
				endDir = startDir + 90;
			}
			turnClockwise = clockwise;
			
			swoopTimer = swoopAlarm;
		}
		override public function update():void
		{
			super.update();
			swoopTimer -= FP.elapsed;	
			
			if (swoopTimer <= 0)
			{
				reloadTimer += FP.elapsed;
				if (shotTimes < 3)
				{
					if (reloadTimer > 0.5)
					{
						shoot(new Bullet(new Image(Assets.BULLET_BWAVE_REAL),24, 24, 12, 12, pointDirection(x,y,Listener.x2, Listener.y2), 3, 0, true,2),x,y,new Image(Assets.BULLET_BWAVE_REAL));
						shoot(new Bullet(new Image(Assets.BULLET_BWAVE_REAL),24, 24, 12, 12, pointDirection(x,y,Listener.x2, Listener.y2) +45, 3, -0.2, true,2),x,y,new Image(Assets.BULLET_BWAVE_REAL));
						shoot(new Bullet(new Image(Assets.BULLET_BWAVE_REAL),24, 24, 12, 12, pointDirection(x,y,Listener.x2, Listener.y2) -45, 3, 0.2, true,2),x,y,new Image(Assets.BULLET_BWAVE_REAL));
						
						shotTimes += 1;
					}
				}
				if (turnClockwise == true)
				{
					if (direction > endDir)
					{
						direction -= 3;
					}
					else
					{
						direction = endDir;
					}
				}
				else
				{
					if (direction < endDir)
					{
						direction += 3;
					}
					else
					{
						direction = endDir;
					}
				}
			}
		}
	}
}
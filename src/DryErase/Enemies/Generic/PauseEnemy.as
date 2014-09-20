package DryErase.Enemies.Generic 
{
	/**
	 * ...
	 * @author 
	 */
	import DryErase.Enemies.Enemy;
	
	import net.flashpunk.Entity;
	import net.flashpunk.FP;
	import net.flashpunk.graphics.Image;
	import DryErase.Enemies.Bullets.Bullet;
	public class PauseEnemy extends Enemy
	{
		public var moveSpeed:Number;
		public var maxSpeed:Number;
		
		private var moveAlarm:Number; //how long to move until it pauses
		private var pauseAlarm:Number; //how long to pause for
		
		private var shootAlarm:Number; //shoot alarm; 0 means no shots
		private var reCharge:Number;
		
		private var bullet:Bullet;
		
		public function PauseEnemy(newImage:Image, shadow:Image, moveTime:Number, pauseTime:Number, shootTime:Number, shootBullet:Bullet, speed:Number = 4, direc:Number = 270, hboxWidth:Number = 0, hboxHeight:Number = 0, hboxOriginX:Number = 0, hboxOriginY:Number = 0, hp:Number = 5, points:Number = 100, xx:Number = 320, yy:Number = 0, field:Boolean = false)
		{
			super(newImage, shadow, hp, points, field, direc, hboxWidth, hboxHeight, hboxOriginX, hboxOriginY);
			
			
			moveSpeed = speed;
			maxSpeed = speed;
			x = xx;
			y = yy;
			
			moveAlarm = moveTime;
			pauseAlarm = pauseTime;
			shootAlarm = shootTime;
			reCharge = shootTime;
			
			bullet = shootBullet;
		}
		override public function update():void
		{
			super.update();
			
			moveDirection(direction,moveSpeed);
			
			moveAlarm -= FP.elapsed;
			
			if (y > 800)
			{
				destroyed = true;
			}
			
			if (moveAlarm <= 0)
			{
				pauseAlarm -= FP.elapsed;
				shootAlarm -= FP.elapsed;
				if (pauseAlarm > 0 && shootAlarm <= 0)
				{
					shootAlarm = reCharge;
					//shoot!
					shoot(bullet, x, y);
				}
				if (pauseAlarm <= 0)
				{
					if (moveSpeed < maxSpeed)
					{
						moveSpeed += 0.5;
					}
					else
					{
						moveSpeed = maxSpeed;
					}
				}
				else
				{
					if (moveSpeed > 0)
					{
						moveSpeed -= 0.5;
					}
					else
					{
						moveSpeed = 0;
					}
				}
			}
		}
		
	}
	
}
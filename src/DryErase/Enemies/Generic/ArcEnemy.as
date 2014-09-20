package DryErase.Enemies.Generic 
{
	import DryErase.Enemies.Enemy;
	
	import net.flashpunk.FP;
	import net.flashpunk.graphics.Image;
	
	/**
	 * ...
	 * @author 
	 */
	public class ArcEnemy extends Enemy
	{
		public var dir:Number;
		public var turningSpeed:Number;
		public var alarmWait:Number;
		public var turningClockWise:Boolean;
		
		public var moveSpeed:Number;
		
		public function ArcEnemy(newImage:Image, shadow:Image, hp:Number = 5, points:Number = 100, speed:Number = 4, xx:Number = 320, yy:Number = 0, field:Boolean = false, hboxWidth:Number = 0, hboxHeight:Number = 0, hboxOriginX:Number = 0, hboxOriginY:Number = 0, startDirection:Number = 270, turnSpeed:Number = 2, turnPause:Number = 2, clockWise:Boolean = true) 
		{
			super(newImage, shadow, hp, points, field, startDirection, hboxWidth, hboxHeight, hboxOriginX, hboxOriginY);
			if (clockWise == true)
			{
				dir = startDirection + 180 % 360;
				turningClockWise = true;
			}
			else
			{
				dir = startDirection + 180 % 360;
				turningClockWise = false;
			}
			
			turningSpeed = turnSpeed;
			moveSpeed = speed;
			x = xx;
			y = yy;
			alarmWait = turnPause;
		}
		
		override public function update():void
		{
			super.update();
			
			currentImage.angle = direction;
			
			x += lengthDirX(1, direction) * moveSpeed * Main.frameRate * FP.elapsed;
			y += lengthDirY(1, direction) * moveSpeed * Main.frameRate * FP.elapsed;
			
			alarmWait -= FP.elapsed;
			if (alarmWait <= 0)
			{
				if (turningClockWise == true)
				{
					direction -= turningSpeed * Main.frameRate * FP.elapsed;
				}
				else
				{
				
					direction += turningSpeed * Main.frameRate * FP.elapsed;
				
				}
			}
			
			if (y < -200 || y > 600 || x < -200 || x > 800)
			{
				if (direction == dir)
				{
					destroyed = true;
				}
			}
		}
		
	}

}
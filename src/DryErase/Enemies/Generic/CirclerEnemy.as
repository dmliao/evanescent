package DryErase.Enemies.Generic
{
	import DryErase.Enemies.Enemy;
	import DryErase.Hero.Listener;
	
	import net.flashpunk.FP;
	import net.flashpunk.graphics.Image;

	public class CirclerEnemy extends Enemy
	{
		public var turnClockwise:Boolean;
		public var movSpeed:Number;
		
		public var circleAlarm:Number;
		public var rushAlarm:Number;
		
		public var imageDir:Number = 0;
		
		public function CirclerEnemy(newImage:Image, shadow:Image, hp:Number = 5, points:Number = 100, field:Boolean = false, xx:Number = 320, yy:Number = 240, hbwidth:Number = 0, hbheight:Number = 0, hbOX:Number = 0, hbOY:Number = 0, speed:Number = 4, startDirection:Number = 270, clockwise:Boolean = true, circlePause:Number = 2, rushPause:Number = 5)
		{
			super(newImage, shadow, hp, points,field, startDirection, hbwidth, hbheight, hbOX, hbOY);
			turnClockwise = clockwise;
			direction = startDirection;
			
			x = xx;
			y = yy;
			
			circleAlarm = circlePause;
			rushAlarm = rushPause;
			movSpeed = speed;
		}
		override public function update():void
		{
			super.update();
			currentImage.angle = imageDir;
			circleAlarm -= FP.elapsed;
			if (y > 600)
			{
				y -= 2;
			}
			if (y < -200)
			{
				y += 2;
			}
			if (circleAlarm > 0)
			{
				moveDirection(direction,movSpeed);
			}
			else
			{
				rushAlarm -= FP.elapsed;
				if (rushAlarm > 0)
				{
					circleAround(Listener.x2,Listener.y2,movSpeed,turnClockwise);
					direction = pointDirection(x,y,Listener.x2,Listener.y2);
				}
				else
				{
					moveDirection(direction,movSpeed);
				}
			}
		}
	}
}
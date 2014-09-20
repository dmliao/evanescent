package DryErase.Enemies.Generic 
{
	/**
	 * ...
	 * @author 
	 */
	import DryErase.Enemies.Enemy;
	import net.flashpunk.graphics.Image;
	
	import net.flashpunk.FP;
	 
	public class ForwardEnemy extends Enemy
	{
		public var moveSpeed:Number;
		
		public function ForwardEnemy(newImage:Image, shadow:Image, hp:Number = 5, points:Number = 100, speed:Number = 4, xx:Number = 320, yy:Number = 0, field:Boolean = false, hboxWidth:Number = 0, hboxHeight:Number = 0, hboxOriginX:Number = 0, hboxOriginY:Number = 0)
		{
			super(newImage, shadow, hp, points, field, 270, hboxWidth, hboxHeight, hboxOriginX, hboxOriginY);
			
			moveSpeed = speed;
			x = xx;
			y = yy;
		}
		override public function update():void
		{
			super.update();
			y += moveSpeed * Main.frameRate * FP.elapsed;
			
			if (y > 800)
			{
				destroyed = true;
			}
		}
		
	}

}
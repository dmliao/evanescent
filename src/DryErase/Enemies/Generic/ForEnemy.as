package DryErase.Enemies.Generic 
{
	/**
	 * ...
	 * @author 
	 */
	
	//NOTE: This enemy can also be used for segmented creatures, etc...due to the public variables it holds
	import DryErase.Enemies.Enemy;
	
	import net.flashpunk.FP;
	import net.flashpunk.graphics.Image;
	
	public class ForEnemy extends Enemy
	{
		public var moveSpeed:Number;
		
		
		
		public function ForEnemy(newImage:Image, shadow:Image, hp:Number = 5, points:Number = 100, speed:Number = 4, direc:Number = 270, xx:Number = 320, yy:Number = 0, field:Boolean = false, hboxWidth:Number = 0, hboxHeight:Number = 0, hboxOriginX:Number = 0, hboxOriginY:Number = 0, size:Number = 1, rotate:Number = 0)
		{
			super(newImage, shadow, hp, points, field, direc, hboxWidth, hboxHeight, hboxOriginX, hboxOriginY,size);
			
			moveSpeed = speed;
			x = xx;
			y = yy;
			
		}
		override public function update():void
		{
			
			super.update();
			moveDirection(direction,moveSpeed);
			
			if (y > 800)
			{
				destroyed = true;
			}
		}
		
	}
	
}
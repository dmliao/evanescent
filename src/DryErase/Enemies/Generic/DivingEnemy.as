package DryErase.Enemies.Generic
{
	import DryErase.Enemies.Enemy;
	
	import flash.geom.Point;
	
	import net.flashpunk.FP;
	import net.flashpunk.graphics.Image;

	import DryErase.Hero.Listener;
	
	public class DivingEnemy extends Enemy
	{
		public var realityImage:Image;
		public var divingSpeed:Number;
		public var diveDown:Boolean = false;
		public var moveSpeed:Number;
		public var totalAlpha:Number = 1;
		public function DivingEnemy(imagImage:Image, realImage:Image, shadow:Image, hp:Number = 5, points:Number = 100, speed:Number = 4, direc:Number = 270, xx:Number = 320, yy:Number = 0, field:Boolean = false, hboxWidth:Number = 0, hboxHeight:Number = 0, hboxOriginX:Number = 0, hboxOriginY:Number = 0, size:Number = 1, startdepth:Number = 0, diveSpeed:Number = 0.05)
		{
			super(imagImage, shadow, hp, points, field, direc, hboxWidth, hboxHeight, hboxOriginX, hboxOriginY, size, true, startdepth);
			realityImage = realImage;
			
			realityImage.smooth = true;
			realityImage.scale = currentImage.scale;
			realityImage.centerOO();
			realityImage.alpha = 0;
			divingSpeed = diveSpeed;
			moveSpeed = speed;
			x = xx;
			y = yy;
		}
		
		override public function update():void
		{
			super.update();
			if (currentField == Listener.currentField)
			{
				totalAlpha = 1;
			}
			else
			{
				totalAlpha = 0.5;
			}
			currentImage.alpha = (1 - depth)*totalAlpha;
			realityImage.alpha = (1 - currentImage.alpha)*totalAlpha;
			shadowImage.alpha = realityImage.alpha/4;
			realityImage.scale = currentImage.scale;
			realityImage.angle = currentImage.angle;
			moveDirection(direction,moveSpeed);
			if (diveDown == true)
			{
				if (depth > 0)
				{
					depth -= divingSpeed * Main.frameRate * FP.elapsed;
				}
				else
				{
					diveDown = false;
				}
			}
			if (diveDown == false)
			{
				if (depth < 1)
				{
					depth += divingSpeed * Main.frameRate * FP.elapsed;
				}
				else
				{
					diveDown = true;
				}
			}
			
		}
		
		override public function render():void
		{
			super.render();
			realityImage.render(FP.buffer,new Point(x,y-1), FP.camera);
		}
	}
}
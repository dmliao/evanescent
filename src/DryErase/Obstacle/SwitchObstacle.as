package DryErase.Obstacle 
{
	/**
	 * ...
	 * @author 
	 */
	import DryErase.Hero.Listener;
	
	import net.flashpunk.Entity;
	import net.flashpunk.FP;
	import net.flashpunk.graphics.Image;
	
	public class SwitchObstacle extends Entity
	{
		
		public var currentImage:Image;
		public var realImage:Image;
		public var currentField:Boolean;
		private var scaleFactor:Number;
		
		public var direction:Number;
		
		public var imageScale:Number;
		public var destroyed:Boolean = false;
		
		public function SwitchObstacle(ImaginationImage:Image, RealImage:Image, xx:Number = 0, yy:Number = 0, oX:Number = 0, oY:Number = 0, w:Number = 0, h:Number = 0, size:Number = 1) 
		{
			currentImage = ImaginationImage;
			currentImage.smooth = true;
			currentImage.centerOO();
			imageScale = size;
			direction = 270;
			
			realImage = RealImage;
			realImage.smooth = true;
			realImage.centerOO();
			
			graphic = currentImage;
			type = "obstacle_both";
			x = xx;
			y = yy;
			scaleFactor = (1 - (( -(y - FP.camera.y) + 600) / 3000));
			setHitbox(w * scaleFactor * imageScale, h * scaleFactor * imageScale, oX * scaleFactor * imageScale, oY * scaleFactor * imageScale);
			currentImage.scale = scaleFactor * imageScale;
			
		}
		
		override public function update():void
		{	
			
			if (y < -400 || y > 800 || x < -400 || x > 1000)
			{
				
				destroyed = true;
			}
			else 
			{
				//y += 2;
			}
			if (Listener.currentField == false)
				{
				layer = -(y - FP.camera.y)/2;
					currentImage.alpha = 1;
					realImage.alpha = 0;
				}
				else
				{
					layer = -(y - FP.camera.y) * 1.5;
					currentImage.alpha = 0;
					realImage.alpha = 1;
				}
			
			currentImage.scale = scaleFactor * imageScale;
			realImage.scale = scaleFactor * imageScale;
			//layer = -(y - FP.camera.y)/2
			if (destroyed == true)
			{
				FP.world.remove(this);
			}
		}
		
		public function moveDirection(dir:Number, moveSpeed:Number):void
		{
			x += lengthDirX(1, dir) * moveSpeed * Main.frameRate * FP.elapsed;
			y += lengthDirY(1, dir) * moveSpeed * Main.frameRate * FP.elapsed;
		}
		public function lengthDirX(distance:Number, direction:Number):Number
		{
			return distance * Math.cos(direction * (Math.PI / 180));
		}
		public function lengthDirY(distance:Number, direction:Number):Number
		{
			return -distance * Math.sin(direction * (Math.PI / 180));
		}
		
	}
	
}
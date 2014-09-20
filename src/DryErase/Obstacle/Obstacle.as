package DryErase.Obstacle 
{
	/**
	 * ...
	 * @author 
	 */
	import net.flashpunk.Entity;
	import net.flashpunk.FP;
	import net.flashpunk.graphics.Image;
	import DryErase.Hero.Listener;
	 
	public class Obstacle extends Entity
	{
		
		public var currentImage:Image;
		public var currentField:Boolean;
		private var scaleFactor:Number;
		
		public function Obstacle(drawnImage:Image, xx:Number = 0, yy:Number = 0, oX:Number = 0, oY:Number = 0, w:Number = 0, h:Number = 0, field:Boolean = false ) 
		{
			currentImage = drawnImage;
			currentImage.smooth = true;
			currentImage.centerOO();
			graphic = currentImage;
			currentField = field;
			if (currentField == false)
			{
				type = "obstacle_imagination";
			}
			else
			{
				type = "obstacle_reality";
			}
			
			x = xx;
			y = yy;
			scaleFactor = (1 - (( -(y - FP.camera.y) + 600) / 3000));
			setHitbox(w * scaleFactor, h * scaleFactor, oX * scaleFactor, oY * scaleFactor);
		}
		
		override public function update():void
		{	
			if (y > FP.screen.height + height)
			{
				FP.world.remove(this);
			}
			else 
			{
				y += 2 * Main.frameRate * FP.elapsed;
			}
			if (currentField == false)
			{
				if (Listener.currentField == false)
				{
					currentImage.alpha = 1;
				}
				else
				{
					currentImage.alpha = 0.5;
				}
				
			}
			if (currentField == true)
			{
				if (Listener.currentField == true)
				{
					currentImage.alpha = 1;
				}
				else
				{
					currentImage.alpha = 0.5;
				}
				
			}
			currentImage.scale = (1 - (( -(y - FP.camera.y) + 600) / 3000));
			layer = -(y - FP.camera.y)/2
		}
		
	}

}
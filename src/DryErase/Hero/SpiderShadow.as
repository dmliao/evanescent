package DryErase.Hero 
{
	/**
	 * ...
	 * @author 
	 */
	
	import net.flashpunk.Entity;
	import net.flashpunk.graphics.Image;
	import net.flashpunk.FP;
	import flash.display.BlendMode;
	
	public class SpiderShadow extends Entity
	{
		
		public var currentImage:Image;
		private var scaleFactor:Number;
		
		public function SpiderShadow() 
		{
			currentImage = new Image(Assets.SPIDER);
			currentImage.centerOO();
			//currentImage.smooth = true;

			scaleFactor = 1.5 - (( -(y - FP.camera.y) + 600) / 1200);
			//currentImage.scale = scaleFactor;
			currentImage.alpha = 1;
			layer = (y - FP.camera.y) - 3;
			currentImage.blend = "screen";
			graphic = currentImage;
		}
		
		override public function update():void
		{
			if (currentImage.alpha <= 0)
			{
				FP.world.remove(this);
			}
			else
			{
				currentImage.alpha -= 0.25 * Main.frameRate * FP.elapsed;
			}
		}
		
	}

}
package DryErase.Effects
{
	/**
	 * ...
	 * @author 
	 */
	
	import flash.display.BlendMode;
	
	import net.flashpunk.Entity;
	import net.flashpunk.FP;
	import net.flashpunk.graphics.Image;
	
	public class Explode_AfterEffects extends Entity
	{
		
		//INITIALIZE IMAGES
		public var currentImage:Image;
		private var scaleFactor:Number;
		
		public var add:Boolean;
		
		private var timer:Number;
		
		public var imageScale:Number;
		
		public function Explode_AfterEffects(scale:Number = 1) 
		{
			currentImage = new Image(Assets.EXPLODE_IMG_AFTEREFFECTS);
			currentImage.centerOO();
			currentImage.smooth = true;
			
			add = true;
			timer = 0;
			
			imageScale = scale;

			scaleFactor = (1 + Math.random()) - (( -(y - FP.camera.y) + 600) / 1200);
			currentImage.scale = scaleFactor*0.6*imageScale;
			currentImage.alpha = 0;
			layer = -(y - FP.camera.y);
			graphic = currentImage;
		}
		
		override public function update():void
		{
			timer += FP.elapsed;
			if (currentImage.alpha <= 0)
			{
				if (timer > 1)
				{
					FP.world.recycle(this);
				}
				
			}
			if (add == true && currentImage.alpha < 0.7)
			{
				currentImage.alpha += 0.1 * Main.frameRate * FP.elapsed;
			}
			else if (currentImage.alpha >= 0.7)
			{
					add = false;
			}
			if (add == false)
			{
				currentImage.alpha -= 0.025 * Main.frameRate * FP.elapsed;
				
			}
			
			y += 2 * Main.frameRate * FP.elapsed;
		}
		
	}

}
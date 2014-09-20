package DryErase.Effects 
{
	import net.flashpunk.graphics.Spritemap;
	import net.flashpunk.FP;
	import flash.display.BlendMode;
	
	import net.flashpunk.Entity;
	/**
	 * ...
	 * @author 
	 */
	public class Explosion_Top extends Entity
	{
		
		private var currentImage:Spritemap = new Spritemap(Assets.explodeReal, 256, 256);
		private var scaleFactor:Number;
		
		public function Explosion_Top(xx:Number, yy:Number, scale:Number = 1)
		{
			x = xx;
			y = yy;
			currentImage.add("Explosion", [0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11], 35, false);
			currentImage.smooth = true;
			currentImage.centerOO();
			
			currentImage.play("Explosion");
			
			scaleFactor = 1 - (( -(y - FP.camera.y) + 600) / 1200);
			currentImage.scale = scaleFactor * scale;
			layer = -555;
			
			currentImage.blend = "add";
			
			graphic = currentImage;
		}
		
		override public function update():void
		{
			y += 2 * Main.frameRate * FP.elapsed;
			if (currentImage.complete == true)
			{
				currentImage.alpha -= 0.05 * Main.frameRate * FP.elapsed;
				if (currentImage.alpha <= 0)
				{
					FP.world.remove(this);
				}
			}
		}
		
	}
	
}
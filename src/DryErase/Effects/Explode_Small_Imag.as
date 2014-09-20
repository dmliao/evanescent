package DryErase.Effects
{
	/**
	 * ...
	 * @author 
	 */
	
	import net.flashpunk.Entity;
	import net.flashpunk.graphics.Image;
	import net.flashpunk.FP;
	import flash.display.BlendMode;
	
	public class Explode_Small_Imag extends Entity
	{
		
		//INITIALIZE IMAGES
		public var currentImage:Image;
		private var scaleFactor:Number;
		
		private var timer:Number;
		
		public function Explode_Small_Imag(xx:Number, yy:Number) 
		{
			var explode:Explode_AfterEffects;
			var explode2:Explode_AfterEffects;
			var explode3:Explode_AfterEffects;
			
			currentImage = new Image(Assets.EXPLODE_IMG);
			currentImage.centerOO();
			currentImage.smooth = true;
			
			x = xx;
			y = yy;

			scaleFactor = (1.5 - (( -(y - FP.camera.y) + 600) / 1200));
			currentImage.scaleX = 0;
			currentImage.scaleY = 0;
			currentImage.alpha = 2;
			layer = -(y - FP.camera.y)+5;
			graphic = currentImage;
			
			timer = 0;
			
			explode = FP.world.create(Explode_AfterEffects,true) as Explode_AfterEffects;
			explode.x = (x - (scaleFactor * 32) + (Math.random() * scaleFactor * 64));
			explode.y = (y - (scaleFactor * 24) + (Math.random() * scaleFactor * 48));
			explode.add = true;
			explode.imageScale = 0.6;
			explode2 = FP.world.create(Explode_AfterEffects,true) as Explode_AfterEffects;
			explode2.x = (x - (scaleFactor * 32) + (Math.random() * scaleFactor * 32));
			explode2.y = (y - (scaleFactor * 24) + (Math.random() * scaleFactor * 48));
			explode2.imageScale = 0.6;
			explode2.add = true;
			explode3 = FP.world.create(Explode_AfterEffects,true) as Explode_AfterEffects;
			explode3.x = (x);
			explode3.y = (y);
			explode3.imageScale = 0.6;
			explode3.add = true;
			
		//	FP.world.add(new Explode_AfterEffects((x - (scaleFactor * 32) + (Math.random() * scaleFactor * 64)), (y - (scaleFactor * 24) + (Math.random() * scaleFactor * 48)),0.6));
			
		//	FP.world.add(new Explode_AfterEffects((x - (scaleFactor * 32) + (Math.random() * scaleFactor * 64)), (y - (scaleFactor * 24) + (Math.random() * scaleFactor * 48)),0.6));
		//	FP.world.add(new Explode_AfterEffects(x, y, 0.6));
		}
		
		override public function update():void
		{
			timer += FP.elapsed;
			if (currentImage.alpha <= 0)
			{
				FP.world.remove(this);
			}
			else
			{
				if (timer > 0.05)
				{
					currentImage.alpha -= 0.05 * Main.frameRate * FP.elapsed;
				}
				y += 2 * Main.frameRate * FP.elapsed;
				currentImage.scaleX += scaleFactor / 40;
				currentImage.scaleY += scaleFactor / 50;
			}
		}
		
	}

}
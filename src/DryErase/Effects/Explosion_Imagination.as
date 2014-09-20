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
	
	public class Explosion_Imagination extends Entity
	{
		
		//INITIALIZE IMAGES
		public var currentImage:Image;
		private var scaleFactor:Number;
		
		public function Explosion_Imagination(xx:Number, yy:Number) 
		{
			var explode:Explode_AfterEffects;
			var explode2:Explode_AfterEffects;
			var explode3:Explode_AfterEffects;
			var explode4:Explode_AfterEffects;
			
			currentImage = new Image(Assets.EXPLODE_IMG);
			currentImage.centerOO();
			currentImage.smooth = true;
			
			x = xx;
			y = yy;

			scaleFactor = (2 - (( -(y - FP.camera.y) + 600) / 1200));
			currentImage.scaleX = 0;
			currentImage.scaleY = 0;
			currentImage.alpha = 2;
			layer = -(y - FP.camera.y)+5;
			graphic = currentImage;
			
			explode = FP.world.create(Explode_AfterEffects,true) as Explode_AfterEffects;
			explode.x = (x - (scaleFactor * 32) + (Math.random() * scaleFactor * 64));
			explode.y = (y - (scaleFactor * 24) + (Math.random() * scaleFactor * 48));
			explode.imageScale = 1;
			explode.add = true;
			explode2 = FP.world.create(Explode_AfterEffects,true) as Explode_AfterEffects;
			explode2.x = (x - (scaleFactor * 48) + (Math.random() * scaleFactor * 96));
			explode2.y = (y - (scaleFactor * 48) + (Math.random() * scaleFactor * 96));
			explode2.imageScale = 1;
			explode2.add = true;
			explode3 = FP.world.create(Explode_AfterEffects,true) as Explode_AfterEffects;
			explode3.x = (x - (scaleFactor * 48) + (Math.random() * scaleFactor * 96));
			explode3.y = (y - (scaleFactor * 48) + (Math.random() * scaleFactor * 96));
			explode3.imageScale = 1;
			explode3.add = true;
			explode4 = FP.world.create(Explode_AfterEffects,true) as Explode_AfterEffects;
			explode4.x = x;
			explode4.y = y;
			explode4.imageScale = 1;
			explode4.add = true;
			
		//	FP.world.add(new Explode_AfterEffects((x - (scaleFactor * 32) + (Math.random() * scaleFactor * 64)), (y - (scaleFactor * 24) + (Math.random() * scaleFactor * 48))));
		//	FP.world.add(new Explode_AfterEffects((x - (scaleFactor * 48) + (Math.random() * scaleFactor * 96)), (y - (scaleFactor * 32) + (Math.random() * scaleFactor * 64))));
		//	FP.world.add(new Explode_AfterEffects((x - (scaleFactor * 48) + (Math.random() * scaleFactor * 96)), (y - (scaleFactor * 32) + (Math.random() * scaleFactor * 64))));
		//	FP.world.add(new Explode_AfterEffects(x, y));
		}
		
		override public function update():void
		{
			if (currentImage.alpha <= 0)
			{
				FP.world.remove(this);
			}
			else
			{
				currentImage.alpha -= 0.05 * Main.frameRate * FP.elapsed;
				y += 2 * Main.frameRate * FP.elapsed;
				currentImage.scaleX += scaleFactor / 20;
				currentImage.scaleY += scaleFactor / 25;
			}
		}
		
	}

}
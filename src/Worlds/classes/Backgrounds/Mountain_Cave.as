package Worlds.classes.Backgrounds
{
	import DryErase.Hero.Listener;
	
	import flash.geom.Point;
	
	import net.flashpunk.FP;
	import net.flashpunk.graphics.Image;
	
	import net.flashpunk.Entity;

	public class Mountain_Cave extends Entity
	{
		
		
		public var currentImage:Image;
		public var realImage:Image;
		
		public function Mountain_Cave(xx:Number, yy:Number)
		{
			layer = 0;
			x = xx;
			y = yy;
			
			currentImage = new Image(Assets.insideCaveImag);
			currentImage.originY = 1200;
			currentImage.originX = 0;
			
			realImage = new Image(Assets.insideCaveReal);
			
			
		}
		
		override public function update():void
		{
			super.update();
			y += 2 * Main.frameRate * FP.elapsed;
			if (Listener.currentField == false)
			{
				currentImage.alpha = 1;
				realImage.alpha = 0;
			}
			else
			{
				currentImage.alpha = 0;
				realImage.alpha = 1;
			}
		}
		
		override public function render():void
		{
			currentImage.render(FP.buffer,new Point(x,y),FP.camera);
			realImage.render(FP.buffer,new Point(x,y),FP.camera);
		}
	}
}
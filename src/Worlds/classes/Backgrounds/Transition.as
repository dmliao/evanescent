package Worlds.classes.Backgrounds 
{
	/**
	 * ...
	 * @author 
	 */
	
	 import net.flashpunk.Entity;
	import net.flashpunk.graphics.Backdrop;
	import net.flashpunk.graphics.Image;
	import flash.geom.Point;
	import net.flashpunk.FP;
	 
	 
	public class Transition extends Entity
	{
		
		private var transImage:Image;
		
		public function Transition(xx:Number, yy:Number) 
		{
			transImage = new Image(Assets.transition);
			layer = -3;
			transImage.originY = 1000;
			
			setHitbox(640, 1000, 0, 0);
			graphic = transImage;
			
			x = xx;
			y = yy;
			
			type = "forceReal";
			
		}
		
		override public function update():void
		{
			if (y > FP.screen.height + 1500)
			{
				FP.world.remove(this);
			}
			else 
			{
				y += 2 * Main.frameRate * FP.elapsed;
			}
		}
		
	}

}
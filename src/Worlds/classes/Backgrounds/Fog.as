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
	 
	 
	public class Fog extends Entity
	{
		
		
		private var fogImage:Image;
		
		public function Fog() 
		{
			fogImage = new Image(Assets.FOG);
			layer = -999999;
			fogImage.alpha = 0.5;
			graphic = fogImage;
		}
		
	}

}
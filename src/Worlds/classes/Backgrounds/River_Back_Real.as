package Worlds.classes.Backgrounds 
{
	/**
	 * ...
	 * @author 
	 */
	import DryErase.Hero.Listener;
	
	import flash.display.Bitmap;
	import flash.display.BlendMode;
	import flash.geom.Point;
	
	import net.flashpunk.Entity;
	import net.flashpunk.FP;
	import net.flashpunk.graphics.Backdrop;
	import net.flashpunk.graphics.Image;
	 
	public class River_Back_Real extends Backdrop
	{
		
		private var fogImage:Image;
		
		public function River_Back_Real() 
		{
			super(Assets.RIVER_REAL, false, true);
			//blend = "multiply";
			fogImage = new Image(Assets.FOG);
		}
		
	}

}
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
	import flash.display.BlendMode;
	
	import DryErase.Hero.Listener;
	 
	public class Mountain_Back_Real extends Backdrop
	{
		
		private var fogImage:Image;
		
		public function Mountain_Back_Real() 
		{
			super(Assets.MOUNTAINS_REAL, false, true);
			//blend = "multiply";
			fogImage = new Image(Assets.FOG);
		}
		
		
	}

}
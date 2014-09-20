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
	import flash.geom.Rectangle;
	
	import DryErase.Hero.Listener;
	
	public class Castle2_Back_Real extends Backdrop
	{
		
		private var fogImage:Image;
		
		public function Castle2_Back_Real() 
		{
			super(Assets.CASTLE2_REAL, false, true);
			
			fogImage = new Image(Assets.FOG);
		}
		
	}
	
}
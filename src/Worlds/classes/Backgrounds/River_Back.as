package Worlds.classes.Backgrounds 
{
	/**
	 * ...
	 * @author 
	 */
	import DryErase.Hero.Listener;
	
	import flash.geom.Point;
	import flash.geom.Rectangle;
	
	import net.flashpunk.Entity;
	import net.flashpunk.FP;
	import net.flashpunk.graphics.Backdrop;
	import net.flashpunk.graphics.Image;
	 
	public class River_Back extends Backdrop
	{
		private var fogImage:Image;
		
		
		public function River_Back() 
		{
			super(Assets.RIVER_IMG, false, true);
			
			fogImage = new Image(Assets.FOG);
		}
	}

}
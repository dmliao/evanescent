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
	 
	public class Mountain_Back extends Backdrop
	{
		
		
		
		
		private var fogImage:Image;
		
		public function Mountain_Back() 
		{
			super(Assets.MOUNTAINS_IMG, false, true);
			
			fogImage = new Image(Assets.FOG);
		}
		
	}

}
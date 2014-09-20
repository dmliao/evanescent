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
	
	public class RiverIce_BackReal extends Backdrop
	{
		
		public const FOG:Class;
		
		private var fogImage:Image;
		
		
		public function RiverIce_BackReal() 
		{
			super(Assets.RIVER_REAL_ICE, false, true);
			
			fogImage = new Image(Assets.FOG);
		}
	}
	
}
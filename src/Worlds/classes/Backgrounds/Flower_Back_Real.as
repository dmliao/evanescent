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
	
	public class Flower_Back_Real extends Backdrop
	{
		
		
		private var fogImage:Image;
		
		public function Flower_Back_Real() 
		{
			super(Assets.FLOWERBED_REAL, false, true);
			
			fogImage = new Image(Assets.FOG);
		}
		
	}
	
}
package Worlds.classes.Title
{
	import net.flashpunk.Entity;
	import net.flashpunk.FP;
	import net.flashpunk.World;
	import net.flashpunk.graphics.Image;
	
	public class Title extends Entity
	{
		
		
		public static var titleImage:Image;
		
		public function Title()
		{
			titleImage = new Image(Assets.TITLE);
			titleImage.alpha = 0;
			layer = -50;
			graphic = titleImage;
		}
		
		override public function update():void
		{
			titleImage.alpha +=0.02;
		}
	}
}
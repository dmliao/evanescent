package Worlds.classes.Title
{
	import net.flashpunk.Entity;
	import net.flashpunk.graphics.Image;

	public class TitleTree extends Entity
	{
		[Embed(source = 'assets/Tree.png')]
		private const BACK:Class;
		public var image:Image;
		public var accel:Number = 0;
		public var goUp:Boolean = true;
		public function TitleTree()
		{
			image = new Image(BACK);
			image.centerOO();
			x=320;
			y=240;
			layer = 2000;
			graphic = image;
			image.blend = "overlay";
		}
		override public function update():void
		{
			super.update();
			if (goUp)
			{
				y -= 0.1;
			}
			else
			{
				y += 0.1;
			}
			if (distanceToPoint(320,240) > 8)
			{
				goUp = !goUp;
			}
		}
	}
}
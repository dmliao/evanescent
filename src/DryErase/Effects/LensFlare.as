package DryErase.Effects
{
	import net.flashpunk.Entity;
	import net.flashpunk.graphics.Image;

	public class LensFlare extends Entity
	{
		[Embed(source = 'assets/lensFlare.png')]
		private const FLARE:Class;
		
		public var image:Image;
		public function LensFlare(xx:Number, yy:Number, dir:Number)
		{
			layer = -999999;
			image = new Image(FLARE);
			image.centerOO();
			image.blend = "add";
			super(xx, yy, image);
			image.smooth = true;
			image.alpha = 0.15;
			image.angle = dir;
		}
	}
}
package DryErase.Effects
{
	import net.flashpunk.Entity;
	import net.flashpunk.graphics.Spritemap;

	public class Fire_Dark extends Entity
	{
		
		private var currentImage:Spritemap = new Spritemap(Assets.fireAnim, 378, 272);
		public function Fire_Dark(xx:Number, yy:Number)
		{
			x=xx;
			y=yy;
			currentImage.add("Explosion", [0, 1, 2, 3, 4, 5, 6, 7],12,true);
			currentImage.blend="add";
			currentImage.play("Explosion");
			graphic = currentImage;
		}
	}
}
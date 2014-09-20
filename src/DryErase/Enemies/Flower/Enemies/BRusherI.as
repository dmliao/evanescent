package DryErase.Enemies.Flower.Enemies
{
	import DryErase.Enemies.Generic.ForEnemy;
	
	import net.flashpunk.graphics.Image;

	public class BRusherI extends ForEnemy
	{
		[Embed(source = '../assets/PointThrush.png')]
		private const IMAGE:Class;
		public function BRusherI(xx:Number, yy:Number, dir:Number, spd:Number)
		{
			super(new Image(IMAGE), new Image(IMAGE), 3, 30, spd, dir, xx, yy, false, 64, 64, 32, 32);
			imageScale = 0.6;
		}
	}
}
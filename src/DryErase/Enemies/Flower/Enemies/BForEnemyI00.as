package DryErase.Enemies.Flower.Enemies
{
	import DryErase.Enemies.Generic.ForEnemy;
	import DryErase.Enemies.Generic.ForwardEnemy;
	
	import net.flashpunk.graphics.Image;

	public class BForEnemyI00 extends ForwardEnemy
	{
		[Embed(source = '../assets/PointThrush.png')]
		private const IMAGE:Class;
		public function BForEnemyI00(right:Boolean)
		{
			var xxx:Number;
			if (right)
			{
				xxx = 480;
			}
			else
			{
				xxx = 160;
			}
			super(new Image(IMAGE), new Image(IMAGE), 4, 80, 3, xxx, -72, false, 64, 64, 32, 32);
		}
	}
}
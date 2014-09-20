package DryErase.Enemies.Flower.Enemies
{
	import DryErase.Enemies.Generic.ForEnemy;
	
	import net.flashpunk.graphics.Image;
	
	public class BRusherR extends ForEnemy
	{
		public function BRusherR(xx:Number, yy:Number, dir:Number, spd:Number)
		{
			super(new Image(Assets.B_JET_REAL), new Image(Assets.B_JET_REAL), 3, 30, spd, dir, xx, yy, true, 64, 64, 32, 32);
			imageScale = 0.5;
		}
	}
}
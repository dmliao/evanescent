package DryErase.Enemies.Flower.Enemies
{
	import DryErase.Enemies.Generic.ForEnemy;
	
	import net.flashpunk.FP;
	import net.flashpunk.graphics.Image;

	public class BFlower00I extends ForEnemy
	{
		
		private var turn:Number;
		private var totalTurn:Number = 0;
		public function BFlower00I(right:Boolean)
		{
			var dir:Number;
			var xxx:Number;
			var rot:Number;
			if (right == true)
			{
				dir = 0;
				xxx = -72;
				rot = 4;
				turn = 4;
			}
			else
			{
				dir = 180;
				xxx = 640 + 72;
				rot = -4;
				turn = -4;
			}
			super(new Image(Assets.B_FLOWER_IMAG), new Image(Assets.B_FLOWER_IMAG), 5, 90, 3, dir, xxx, 320, false, 100, 100, 50, 50, 0.7, rot);
		}
		
		override public function update():void
		{
			if (y <= -72)
			{
				FP.world.remove(this);
			}
			else
			{
			super.update();
			totalTurn += turn;
			currentImage.angle = totalTurn;
			direction += turn/8;
			}
		}
	}
}
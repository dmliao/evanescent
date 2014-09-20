package DryErase.Enemies.Forest.Enemies
{
	import DryErase.Enemies.Generic.ForEnemy;
	
	import net.flashpunk.graphics.Image;

	public class FStickI extends ForEnemy
	{
		public var isRight:Boolean;
		public var xx:Number;
		public function FStickI(right:Boolean)
		{
			isRight = right;
			if (isRight == true)
			{
				xx = 540;
			}
			else
			{
				xx = 100;
			}
			super(new Image(Assets.F_STICK_IMAG), new Image(Assets.F_STICK_IMAG), 20, 300, 2, 270, xx, -72, false, 400,100,200,50,0.8);
			currentImage.angle = 0;
			currentImage.flipped = isRight;
			
		}
		override public function update():void
		{
			super.update();
			currentImage.angle = 0;
		}
	}
}
package DryErase.Enemies.Specific
{
	import DryErase.Enemies.Generic.ForEnemy;
	import net.flashpunk.FP;
	import net.flashpunk.graphics.Image;

	public class Swooper extends ForEnemy
	{
		public var swoopRight:Boolean;
		public var swoopTimer:Number = 0;
		public function Swooper(newImage:Image, shadow:Image, field:Boolean = false, right:Boolean = true, speed:Number = 4)
		{
			super(newImage, shadow, 3, 75, 4, 270, 480 - (Number(right)* 320), -96, field, 48, 64, 24, 32, 0.4, 0);
			swoopRight = right;
		}
		override public function update():void
		{
			
			super.update();
			if (y >= 500 || x < -84 || x > 640+84)
			{
				FP.world.remove(this);
			}
			
			swoopTimer += FP.elapsed;
			if (swoopRight == true)
			{
				if (swoopTimer < 3)
				{
					direction += swoopTimer * 0.25;
				}
				else
				{
					direction += 0.75;
				}
			}
			if (swoopRight == false)
			{
				if (swoopTimer < 3)
				{
					direction -= swoopTimer * 0.25;
				}
				else
				{
					direction -= 0.75;
				}
			}
		}
	}
}
package DryErase.Enemies.Castle.Boss
{
	import DryErase.Enemies.Enemy;
	import DryErase.Hero.Listener;
	
	import net.flashpunk.FP;
	import net.flashpunk.graphics.Image;
	
	public class CLance extends Enemy
	{
		public var img:Image;
		public var existTimer:Number = 0;
		public var aaa:Number = 1;
		public var quaked:Boolean = false;
		public function CLance(xx:Number, field:Boolean, right:Boolean = true)
		{
			
			if (field == false)
			{
				img = new Image(Assets.HEROBULLET3_IMAG);
			}
			else
			{
				img = new Image(Assets.HEROBULLET3_REAL);
			}
			super(img, new Image(Assets.HEROBULLET3_IMAG), 30, 0, field, 270, 96,480,48,240,1.2, false, 0);
			
			if (right == false)
			{
				currentImage.flipped = true;
			}
			x = xx;
			y = -400;
		}
		override public function update():void
		{
			
			super.update();
			y += 3;
		}
	}
}
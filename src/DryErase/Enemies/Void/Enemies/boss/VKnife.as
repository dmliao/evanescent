package DryErase.Enemies.Void.Enemies.boss
{
	import DryErase.Enemies.Enemy;
	import DryErase.Hero.Listener;
	
	import net.flashpunk.FP;
	import net.flashpunk.graphics.Image;

	public class VKnife extends Enemy
	{
		public var img:Image;
		public var existTimer:Number = 0;
		public var aaa:Number = 1;
		public var quaked:Boolean = false;
		public function VKnife(xx:Number, field:Boolean, right:Boolean = true)
		{
			
			if (field == false)
			{
				img = new Image(Assets.V_KNIFE_IMAG);
			}
			else
			{
				img = new Image(Assets.V_KNIFE_REAL);
			}
			super(img, new Image(Assets.V_KNIFE_IMAG), 30, 0, field, 0, 96,480,48,240,1.2, false, 0);
			
			if (right == false)
			{
				currentImage.flipped = true;
			}
			x = xx;
			y = -400;
		}
		override public function update():void
		{
			if (currentImage.alpha <= 0)
			{
				FP.world.remove(this);
			}
			else
			{
				
				existTimer += FP.elapsed;
				super.update();
				if (y < 300)
				{
					y += 5;
				}
				else
				{
					if (quaked == false)
					{
						quaked = true;
						Utils.quake.start(15);
					}
				}
				if (existTimer > 12)
				{
					aaa -= 0.025;
				}
				if (aaa < 0.3)
				{
					type = "none";
				}
				if (Listener.currentField == currentField)
				{
					currentImage.alpha = aaa;
					img.alpha = aaa;
				}
				else
				{
					currentImage.alpha = aaa/2;
					img.alpha = aaa/2;
				}
			}
		}
	}
}
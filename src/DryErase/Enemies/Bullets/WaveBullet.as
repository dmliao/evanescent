package DryErase.Enemies.Bullets
{
	import DryErase.Hero.Listener;
	
	import net.flashpunk.FP;
	import net.flashpunk.graphics.Image;
	
	public class WaveBullet extends Bullet
	{
		public var fadingSpeed:Number;
		public var growingSpeed:Number;
		public var tempAlpha:Number = 1;
		
		public function WaveBullet(newImage:Image = null, hboxWidth:Number = 0, hboxHeight:Number = 0, hboxOriginX:Number = 0, hboxOriginY:Number = 0, dir:Number = 0, argspeed:Number = 1, field:Boolean = false, size:Number = 1, fadeSpeed:Number = 0.005, growSpeed:Number = 0.05)
		{
			
			super(newImage, hboxWidth, hboxHeight, hboxOriginX, hboxOriginY, dir, argspeed, 0, field, 0, size);
			currentImage = new Image(Assets.BULLET_WAVE);
			currentImage.centerOO();
			currentImage.alpha = tempAlpha;
			currentImage.smooth = true;
			fadingSpeed = fadeSpeed;
			growingSpeed = growSpeed;
		}
		override public function update():void
		{
			super.update();
			tempAlpha -= fadingSpeed * Main.frameRate * FP.elapsed;
			imageScale += growingSpeed * Main.frameRate * FP.elapsed;
			currentImage.angle = 0;
			if (Listener.currentField == currentField)
			{
				currentImage.alpha = tempAlpha;
			}
			else
			{
				currentImage.alpha = tempAlpha/2;
			}
			
			if (currentImage.alpha < 0.2)
			{
				type = "nothing";
			}
			if (currentImage.alpha <= 0)
			{
				FP.world.remove(this);
			}
		}
	}
}